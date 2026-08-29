#!/usr/bin/env bash
# This script is used to set up a simple system monitoring solution using Netdata.

# Cleanup script for Netdata installation on macOS
if [[ "$OSTYPE" == "darwin"* ]]; then
    echo "Stopping Netdata service..."
    brew services stop netdata
    if [[ $1 == "--uninstall" ]]; then
        echo "Uninstalling Netdata..."
        brew uninstall netdata
        echo "Netdata has been uninstalled."
    else
        echo "Netdata service stopped. Use --uninstall to remove Netdata completely."
    fi
else
    echo "This script is intended for macOS. Please run the appropriate cleanup commands for your OS."
fi