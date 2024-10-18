#!/bin/bash

if [ -d "env" ]; then 
    echo "Python virtual env exists"
   

fi

echo $PWD
source env/bin/activate
pip3 install -r requrements.txt

if [ -d "logs" ]; then 
    echo "log folder exists"
else
    mkdir logs
    touch logs/error.log logs/access.log
fi

# Use this if passwordless sudo is set up, or provide password with `-S`
sudo chmod -R 777 logs

echo "envsetup finishes"
