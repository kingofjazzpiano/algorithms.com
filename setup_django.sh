#!/bin/bash

# Set the base directory (existing algorithms.com directory)
BASE_DIR="./"

# Navigate to the base directory
cd "$BASE_DIR" || { echo "Directory $BASE_DIR not found!"; exit 1; }

# Create and activate a Python virtual environment (if not exists)
if [ ! -d "venv" ]; then
  echo "Creating a virtual environment..."
  python3 -m venv venv
  echo "Virtual environment created."
fi

echo "Activating virtual environment..."
source venv/bin/activate

# Install Django if it's not installed
if ! python -c "import django" &> /dev/null; then
  echo "Installing Django..."
  pip install django
  echo "Django installed."
else
  echo "Django is already installed."
fi

# Check if a Django project already exists
if [ ! -d "project" ]; then
  echo "Creating Django project..."
  django-admin startproject project .
  echo "Django project created."
else
  echo "Django project already exists."
fi

# Edit settings.py to allow local connections (adjust for your IP if necessary)
SETTINGS_FILE="$BASE_DIR/project/settings.py"
if grep -q "ALLOWED_HOSTS" "$SETTINGS_FILE"; then
  echo "Configuring ALLOWED_HOSTS..."
  sed -i "s/ALLOWED_HOSTS = \[\]/ALLOWED_HOSTS = \['*'\]/g" "$SETTINGS_FILE"
fi

# Migrate the database
echo "Applying migrations..."
python manage.py migrate

# Run the Django development server to view the page
echo "Starting Django development server..."
python manage.py runserver 0.0.0.0:8000
