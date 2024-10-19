#!/bin/bash

if [ -d "env" ] then 
    echo "Python virtual env exists"


fi
else
   sudo apt-get install python3-venv
   python3 -m venv env
 fi  

echo $PWD
source env/bin/activate
pip3 install -r  requirements.txt

if [ -d "logs" ] then 
    echo "log folder exists"
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

# Use this if passwordless sudo is set up, or provide password with `-S`
sudo chmod -R 777 logs

echo "envsetup finishes"
