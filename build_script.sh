#!/bin/bash

echo "Welcome"

firstline=$(head -n 1 source/changelog.md)
read -a splitfirstline <<< $firstline
version=${splitfirstline[1]}

echo "You are building version" $version

echo "Do you want to continue? (enter '1' for yes, '0' for no)"
read versioncontinue

if [ $versioncontinue -eq 1 ]
then
  echo "OK"

  for filename in source/*
  do
    echo $filename
    
    if [ "$filename" == "source/secretinfo.md" ]
    then
      echo "Not copying" $filename
    else
      echo "Copying" $filename
      cp $filename /home/ccuser/workspace/learn-bash-scripting-project/build/.
    fi
  done

else
  echo "Please come back when you are ready"
fi

cd build
echo "Files inside build $version"
ls
cd ../
