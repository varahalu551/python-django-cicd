#!/bin/bash

# Function to check if Python 3 is installed
check_python() {
    if command -v python3 &>/dev/null; then
        echo "Python 3 is installed."
    else
        echo "Python 3 is not installed. Installing Python 3..."
        # Update package list and install Python 3
        sudo apt-get update
        sudo apt-get install -y python3 python3-venv python3-pip
        echo "Python 3 installation complete."
    fi
}

# Check for Python 3
check_python

# Check if the Python virtual environment exists
if [ -d "env" ]; then 
    echo "Python virtual env exists."
else
    echo "Python virtual env does not exist. Creating a new virtual environment."
    # Create the Python virtual environment
    python3 -m venv env
    echo "Virtual environment created."
fi

# Activate the virtual environment
echo "Activating virtual environment..."
source env/bin/activate

# Check if the logs directory exists
if [ -d "logs" ]; then 
    echo "Log folder exists."
else
    echo "Log folder does not exist. Creating logs directory."
    mkdir logs
    touch logs/error.log logs/access.log
    echo "Log files created."
fi

# Set permissions for the logs directory
sudo chmod -R 755 logs
echo "Permissions for logs set to 755."

# Install required packages from requirements.txt
if [ -f "requirements.txt" ]; then
    echo "Installing packages from requirements.txt..."
    if ! pip install -r requirements.txt; then
        echo "Package installation failed. Check logs/error.log for details."
        exit 1  # Exit the script with an error code
    fi
else
    echo "requirements.txt file not found. Skipping package installation."
fi

echo "envsetup finishes."
