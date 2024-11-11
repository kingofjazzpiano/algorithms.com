#!/bin/bash

sudo apt update

# Install prerequisites
sudo apt install -y software-properties-common

# Add the deadsnakes PPA for Python 3.13
echo | sudo add-apt-repository ppa:deadsnakes/ppa
sudo apt update

sudo apt install -y python3.13 python3.13-venv

# Create a virtual environment named 'venv' using Python 3.13
python3.13 -m venv venv

# Activate the virtual environment
source venv/bin/activate

pip install --upgrade pip

pip install poetry

# Install project dependencies from pyproject.toml using Poetry
poetry install

# Update poetry.lock
poetry update

echo "Setup complete. Your Django project is ready."
echo "Type \`source venv/bin/activate\` to enter the python virtual environment."
