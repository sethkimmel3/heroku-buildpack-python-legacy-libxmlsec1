#!/bin/bash

BIN_DIR=$(cd "$(dirname "$0")"; pwd)

# Define the location of the libxmlsec1 zip within the buildpack
LIBXMLSEC1_ZIP="$BIN_DIR/xmlsec1-1.2.39.tar.gz"

# Create a temporary directory for extraction
TEMP_DIR=$(mktemp -d)

# Extract the zip file
unzip "$LIBXMLSEC1_ZIP" -d "$TEMP_DIR"

# Navigate to the extracted directory
# This assumes there's only one directory extracted. Adjust as necessary.
cd "$TEMP_DIR"/* 

# Configure the build environment
# Note: You might need to adjust these commands based on the libxmlsec1 version and dependencies.
./configure

# Compile the source code
make

# Install the compiled binaries
sudo make install

# Clean up the temporary directory
rm -rf "$TEMP_DIR"
