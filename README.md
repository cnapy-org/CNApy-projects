# CNApy-projects

A repository of CNApy projects and associated scenarios.

The latest release can be downloaded here: https://github.com/cnapy-org/CNApy-projects/releases/latest

The project files (.cna) are created automatically on release in the
following way: First, for each subdirectory, all files which are *not* .scen (the scenario files) are
zipped into a .cna file. Then, this .cna file is moved into its own new temporary directory with the
same name as the subdirectory. In addition, all files which *are* .scen are also moved into this new temporary directory. Then, all newly created directories are zipped together as one big .zip file
called "all_cnapy_projects.zip". This .zip file is then automatically added as an asset to the current
CNA projects release. Finally, all single projects are also zipped, each on their own, as .zip files.
