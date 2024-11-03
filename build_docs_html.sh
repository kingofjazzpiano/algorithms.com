#!/bin/bash

STATIC_DIR="static/documentation"

# Navigate to the Sphinx documentation directory
cd documentation/sphinx_docs/ || { echo "Documentation directory not found"; exit 1; }

# Run make to build the HTML documentation
make html

# Go back to the project root
cd ../../

if [ -d "$STATIC_DIR" ]; then
    echo "Clearing existing documentation in $STATIC_DIR..."
    rm -rf $STATIC_DIR
else
    echo "Creating $STATIC_DIR directory..."
    mkdir -p $STATIC_DIR
fi

# Copy the generated HTML files to the static directory
echo "Copying HTML documentation to $STATIC_DIR..."
cp -r documentation/sphinx_docs/build/html $STATIC_DIR
