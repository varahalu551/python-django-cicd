#!/bin/bash
if [-d "env"]
then 
echo "Python virtual env exists"
  python -m venv env
fi
echo $PWD
source env/Scripts/activate

if [-d "logs"]
then 
  echo "log folder exists"
else
   mkdir logs
   touch logs/error.log logs/access.log

fi

sudo chmod -R 777 logs
echo   ""envsetup finishes"
