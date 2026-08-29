#!/usr/bin/env bash
# This script is used to set up a simple system monitoring solution using Netdata.

# Test script for Netdata dashboard
echo "Testing Netdata dashboard..."
curl -s http://localhost:19999 | grep -q "Netdata" && echo "Netdata dashboard is accessible." || echo "Failed to access Netdata dashboard."

# Provide menu for testing cpu, memory, and disk usage
echo "Select an option to test:"
echo "1. Test CPU usage (processor load for 20 seconds)"
echo "2. Test Memory usage (load large files into memory)"
echo "3. Test Disk usage (read/write speed for 20 seconds)"
read -p "Enter your choice (1-3): " choice

# Perform the selected test
case $choice in
    1)
        echo "Testing CPU usage..."
        sysctl -n machdep.cpu.brand_string
        echo "Processor load for 20 seconds:"
        yes > /dev/null &
        sleep 20
        kill $!
        ;;
    2)
        echo "Testing Memory usage..."
        echo "Loading large files into memory for 20 seconds..."
        dd if=/dev/zero of=/tmp/testfile bs=1M count=1024
        sleep 20
        rm /tmp/testfile
        ;;
    3)
        echo "Testing Disk usage..."
        echo "Reading/writing speed for 20 seconds..."
        dd if=/dev/zero of=/tmp/testfile bs=1M count=1024
        sleep 20
        rm /tmp/testfile
        ;;
    *)
        echo "Invalid choice. Please select a valid option."
        ;;
esac