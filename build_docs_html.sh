#!/bin/bash

# Navigate to the Sphinx documentation directory
cd documentation/sphinx_docs/ || { echo "Documentation directory not found"; exit 1; }

# Run make to build the HTML documentation
make html

# Go back to the project root
cd ../../

# Create the static/documentation directory if it doesn't exist
if [ ! -d static/documentation/ ]; then
    mkdir -p static/documentation/
fi

# Copy the generated HTML files to the static directory
cp -r documentation/sphinx_docs/build/html static/documentation/
