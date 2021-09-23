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
  # Move the .scen files into a temporary
  # folder so that they are not zipped together
  # into the .cna file
  if [ -d "$d" ]
  then
    echo $d
    cd "$d"

    for f in ./*
    do
      echo $f
      if [[ $f == *.scen ]]
      then
          mkdir "../_scen_temp" -v
          cp $f "../_scen_temp"/$f
      fi
    done

    # zip .cna files (without the moved .scen files)
    package_dir=."$zip_package_path"/"${d:2}"
    mkdir $package_dir -v
    zip_path="$package_dir"/"${d:2}".cna
    zip $zip_path *

    # Move - if there are any - the .scen files
    # into the temporary project subfolder
    if [ -d "../_scen_temp" ]
    then
        mv ../_scen_temp/* $package_dir
        rm -rf "../_scen_temp"
    fi

    cd ..
  fi
done

# Zip everything together
rm -rf "$zip_package_path"/"${zip_package_path:2}"
cd $zip_package_path
zip -r ../cnapy_projects.zip *
cd ..
rm -rf $zip_package_path
