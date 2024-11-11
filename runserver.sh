#!/bin/bash

# Run pylint on all .py files in the current directory and subdirectories
echo "Running pylint..."
pylint_output=$(pylint $(find . -type f -name "*.py"))
pylint_exit_code=$?

# Output pylint results
echo "$pylint_output"

# Check if pylint found any issues
if [ $pylint_exit_code -eq 0 ]; then
    echo "No pylint errors found. Starting Django server..."
    python manage.py runserver 0.0.0.0:8000
else
    echo "Pylint found errors. Server will not start."
    exit 1
fi
