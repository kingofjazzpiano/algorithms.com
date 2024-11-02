#!/bin/bash

# Check if a repository URL is provided
if [ $# -ne 1 ]; then
    echo "Usage: $0 <github-repository-url>"
    exit 1
fi

# Extract repository name from URL
REPO_URL=$1
REPO_NAME=$(basename "$REPO_URL" .git)

# Create a temporary directory
mkdir tmp
TEMP_DIR=tmp
cd "$TEMP_DIR" || exit

# Clone the repository
echo "Cloning repository..."
git clone "$REPO_URL" || exit 1
cd "$REPO_NAME" || exit 1

# Create output file
OUTPUT_FILE="../${REPO_NAME}.txt"
touch "$OUTPUT_FILE"

# Function to check if a file is binary
is_binary() {
    mime=$(file -b --mime-encoding "$1")
    if [[ "$mime" == "binary" ]]; then
        return 0
    else
        return 1
    fi
}

# Find all files, excluding .git directory and binary files
find . -type f -not -path "./.git/*" | while read -r file; do
    # Skip binary files
    if is_binary "$file"; then
        continue
    fi
    
    # Skip empty files
    if [ ! -s "$file" ]; then
        continue
    fi
    
    echo "Processing: $file"
    
    # Add filename header
    echo "<$file>" >> "$OUTPUT_FILE"
    # Add file content
    cat "$file" >> "$OUTPUT_FILE"
    # Add newlines for separation
    echo -e "\n" >> "$OUTPUT_FILE"
done

# Move output file to current directory
mv "$OUTPUT_FILE" "$PWD/../../${REPO_NAME}.txt"

# Clean up
cd "../.."
rm -rf "$TEMP_DIR"

echo "Repository contents have been saved to ${REPO_NAME}.txt"
