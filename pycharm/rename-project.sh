#! /bin/bash

# This script rename a Pycharm project
# Sintax:
# rename-project.sh path source_name target_name 

path=$1
source_name=$2
target_name=$3

echo $source_name
echo $target_name

cd $path"/".idea
mv $path""$source_name"".iml $path""$target_name"".iml

if [ "$?" != "0" ]; then
    echo "[Error] rename folder failed!" 1>&2
    exit 1
fi

change='s/'""$source_name""'/'""$target_name""'/g'

# Search in content and repale the old project name for the new name
find . -name "*.xml" -print | xargs sed -i $change
