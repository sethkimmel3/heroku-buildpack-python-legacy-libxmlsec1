#!/bin/bash

BIN_DIR=$(cd "$(dirname "$0")"; pwd)

# Define the location of the libxmlsec1 zip within the buildpack
LIBXMLSEC1_TAR_GZ="$BIN_DIR/xmlsec1-1.2.39.tar.gz"

# Create a temporary directory for extraction
TEMP_DIR=$(mktemp -d)

# Extract the tar.gz file
tar -xzf "$LIBXMLSEC1_TAR_GZ" -C "$TEMP_DIR"

# Assuming there's only one directory extracted, find it
EXTRACTED_DIR=$(find "$TEMP_DIR" -mindepth 1 -maxdepth 1 -type d)

# Check if the directory exists and change into it
if [ -d "$EXTRACTED_DIR" ]; then
    cd "$EXTRACTED_DIR"
else
    echo "The expected directory was not found after extraction."
    exit 1
fi

# Configure the build environment
# Note: You might need to adjust these commands based on the libxmlsec1 version and dependencies.
./configure --prefix=/app/vendor/xmlsec1

# Compile the source code
make 

# Install the compiled binaries
make install

# Clean up the temporary directory
rm -rf "$TEMP_DIR"
