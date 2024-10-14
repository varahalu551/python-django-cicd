#!/bin/bash

# Activate the virtual environment
source /var/lib/jenkins/workspace/django-cicd/env/bin/activate

# Navigate to the Django application directory
cd /var/lib/jenkins/workspace/django-cicd/app

# Make migrations and migrate
python manage.py makemigrations
python manage.py migrate
# Uncomment the next line if you want to collect static files
# python manage.py collectstatic --no-input

echo "Migrations Done"

# Restart Gunicorn service
sudo systemctl daemon-reload
sudo systemctl restart gunicorn

# Check Gunicorn service status
sudo systemctl status gunicorn
