#!/bin/bash

if ! sudo -v; then
    echo "This script must be run with sudo."
    exit 1
fi

filename="mkcmd.sh"
filecommand="mkcmd"

sudo cp "$filename" "/usr/local/bin/$filecommand"
sudo chmod a+rx "/usr/local/bin/$filecommand"
