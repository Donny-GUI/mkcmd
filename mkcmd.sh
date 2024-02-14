#!/bin/bash

if ! sudo -v; then
    echo "This script must be run with sudo."
    exit 1
fi

# Check if filepath is given
if [ "$#" -ne 1 ]; then
    echo "mkcmd"
    echo "Description: make an executable a command."
    echo "Usage: mkcmd <executable file>"
    exit 1
fi

# Extract filename without extension
filename=$1

# Check if the filename contains a dot
if [[ "$filename" == *.* ]]; then
    echo "Filename $filename has an extension."
    echo "executable files should not have extensions."
    exit 1
else
    echo "Filename $filename does not have an extension."
    # Move the executable to /usr/local/bin
    echo "Moving $filename to /usr/local/bin..."
    sudo cp "$filename" /usr/local/bin/$filename 
    # Set permissions
    echo "Setting permissions..."
    sudo chmod a+rx "/usr/local/bin/$filename"
    echo "Installation complete. You can now run '$filename' from anywhere."
fi
