#!/bin/bash

SPHINX_DIR="documentation/sphinx_docs"
BUILD_DIR="$SPHINX_DIR/build/html"
STATIC_DIR="static/documentation"

# Check if Sphinx documentation directory exists
if [ ! -d "$SPHINX_DIR" ]; then
    echo "Documentation directory not found at $SPHINX_DIR."
    exit 1
fi

cd "$SPHINX_DIR" || { echo "Failed to enter $SPHINX_DIR"; exit 1; }

# Run make to build the HTML documentation from $SPHINX_DIR/source
echo "Building HTML documentation..."
make html || { echo "Failed to build HTML documentation"; exit 1; }

# Go back to the project root
cd - > /dev/null

# Clear the static documentation directory if it exists
# to prevent having outdated files, or create it if it doesn't
if [ -d "$STATIC_DIR" ]; then
    echo "Clearing existing documentation in $STATIC_DIR..."
    rm -rf "$STATIC_DIR"/*
else
    echo "Creating $STATIC_DIR directory..."
    mkdir -p "$STATIC_DIR"
fi

# Copy the html directory into static/documentation
echo "Copying HTML documentation directory to $STATIC_DIR..."
cp -r "$BUILD_DIR" "$STATIC_DIR"

echo "Documentation build and copy completed successfully."
