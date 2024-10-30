#!/bin/bash

# Check if Homebrew is installed, and install if it's missing
if ! command -v brew &> /dev/null; then
    echo "Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "Homebrew is already installed."
fi

# Install Python if it's not installed
if ! command -v python3 &> /dev/null; then
    echo "Installing Python..."
    brew install python
else
    echo "Python is already installed."
fi

# Navigate to the project directory (if required)
BASE_DIR="./"
cd "$BASE_DIR" || { echo "Directory $BASE_DIR not found!"; exit 1; }

# Create and activate a virtual environment if it doesn't exist
if [ ! -d "venv" ]; then
    echo "Creating a virtual environment..."
    python3 -m venv venv
    echo "Virtual environment created."
fi

echo "Activating virtual environment..."
source venv/bin/activate

# Upgrade pip
echo "Upgrading pip..."
pip install --upgrade pip

# Install Poetry for dependency management
if ! command -v poetry &> /dev/null; then
    echo "Installing Poetry..."
    curl -sSL https://install.python-poetry.org | python3 -
    export PATH="$HOME/.local/bin:$PATH"  # Add Poetry to PATH
else
    echo "Poetry is already installed."
fi

# Install dependencies with Poetry (Django, Sphinx, etc.)
echo "Installing dependencies with Poetry..."
poetry install

echo "All required packages are installed."
