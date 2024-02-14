#!/bin/bash

# Define the version of libxmlsec1 you want to install
LIBXMLSEC1_VERSION="1.2.37"
LIBXMLSEC1_DOWNLOAD_URL="https://www.aleksey.com/xmlsec/download/xmlsec1-${LIBXMLSEC1_VERSION}.tar.gz"

# Update and install build dependencies
sudo apt-get update
sudo apt-get install -y build-essential libxml2-dev libssl-dev libxslt1-dev wget

# Download the specified version of libxmlsec1
wget ${LIBXMLSEC1_DOWNLOAD_URL} -O /tmp/xmlsec1-${LIBXMLSEC1_VERSION}.tar.gz

# Extract the downloaded tarball
tar -zxf /tmp/xmlsec1-${LIBXMLSEC1_VERSION}.tar.gz -C /tmp

# Navigate to the extracted directory
cd /tmp/xmlsec1-${LIBXMLSEC1_VERSION}

# Configure the build environment
./configure

# Compile the source code
make

# Install the compiled binaries
sudo make install

# Clean up the downloaded and extracted files
cd ~
rm -rf /tmp/xmlsec1-${LIBXML
