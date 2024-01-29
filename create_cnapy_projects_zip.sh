#!/bin/bash

zip_package_path=./_zip_package
# Create temporary subfolder in which
# all other new temporary folders for each
# project will be generated
if [ -d $zip_package_path ]
then
  rm -rf $zip_package_path
fi
mkdir $zip_package_path

# Go through each project subfolder
for d in ./*
do
  # Move the .scen/.sdc files into a temporary
  # folder so that they are not zipped together
  # into the .cna file
  if [ -d "$d" ]
  then
    echo $d
    cd "$d"

    for f in ./*
    do
      echo $f
      if [[ $f == *.scen || $f == *.sdc ]]
      then
          mkdir "../_temp" -v
          cp $f "../_temp"/$f
      fi
    done

    # zip .cna files (without the moved files)
    package_dir=."$zip_package_path"/"${d:2}"
    mkdir $package_dir -v
    zip_path="$package_dir"/"${d:2}".cna
    zip $zip_path *

    # Move - if there are any - the .scen/.sdc files
    # into the temporary project subfolder
    if [ -d "../_temp" ]
    then
        mv ../_temp/* $package_dir
        rm -rf "../_temp"
    fi

    cd ..
  fi
done

rm -rf "$zip_package_path"/"${zip_package_path:2}"
cd $zip_package_path

# Zip everything together
zip -r ../all_cnapy_projects.zip *

# Zip main projects together
zip -r ../main_cnapy_projects.zip SmallExample ECC2 ECC2comp e_coli_core e_coli_core_14bdo iJO1366 iJO1366core iML1515 iML1515core

# Create single-project .zip files
for d in ./*
do
  cd $d
  zip -r ../../${d:2}.zip *
  cd ..
done

cd ..
rm -rf $zip_package_path
