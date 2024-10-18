#!/bin/bash

# Activate the virtual environment
#source /var/lib/jenkins/workspace/django-cicd/

# Navigate to the Django application directory
cd /var/lib/jenkins/workspace/django-cicd/app

# Make migrations and migrate
python3 manage.py makemigrations
python3 manage.py migrate
# Uncomment the next line if you want to collect static files
# python manage.py collectstatic --no-input

echo "Migrations Done"

cd /var/lib/jenkins/workspace/django-cicd
sudo cp -rf gunicorn.socket /etc/systemd/system/
sudo cp -rf gunicorn.service /etc/systemd/system/

echo "$USER"
echo "$PWD"

# Restart Gunicorn service
sudo systemctl daemon-reload
sudo systemctl start gunicorn
sudo systemctl enable gunicorn

echo "Gunicorn has been started"

# Check Gunicorn service status
sudo systemctl status gunicorn
sudo systemctl rest