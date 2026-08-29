#!/usr/bin/env bash

# This script is used to set up a simple system monitoring solution using Netdata.

# install Netdata using homebrew for macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Installing Netdata on macOS using Homebrew..."
    brew install netdata
    brew services start netdata
else
    echo "This script is intended for macOS. Please run the appropriate installation commands for your OS."
fi

echo "To access the Netdata dashboard, open your web browser and go to http://localhost:19999"