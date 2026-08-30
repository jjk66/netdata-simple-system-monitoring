# Netdata Simple System Monitor
This is a project buid from roadmap.sh and is located here:

https://roadmap.sh/projects/simple-monitoring-dashboard

## Requirements
This project is to pratice setting up a basic system monitoring tool. It will use Netdata to monitor basic system metrics.
- Install Netdata on a Linux system
  - this project will setup for a MacOs Silicon system
  - use homebrew to install
- Configure to monitor CPU, memory usage, and disk I/O
- Access monitor via a web browser
- Set up an alert, ie CPU above 80%

Once the system is setup, automate the setup using shell scripts.
- setup.sh
  - installs Netdata on a new system
- test_dashboard.sh
  - puts a load on the system to test the dashboard
- cleanup.sh
  - clean up the system and remove Netdata


## Clone this repo

git@github.com:jjk66/netdata-simple-system-monitoring.git

## Install Netdata on to a MacOs
Use homebrew to install Netdata
```bash
brew install netdata
```

Homebrew will install netdata at this location
```bash
# For Apple Silicon
/opt/homebrew/etc/netdata
```

## Controlling the Netdata Agent
Use the brew services for commands on how to start, stop, restart and check status of the Agent. 

Start netdata
```bash
# start netdata now and restart at login
brew services start netdata

# Url for local host
http://localhost:19999
```

Configure Netdata
```bash
# General Configuration
/opt/homebrew/etc/netdata/edit-config netdata.conf

# Set up email notifications
# Modify SEND_EMAILS="YES"
# Modify DEFAULT_RECIPIENT_EMAIL="youremail@somewhere.com"
/opt/homebrew/etc/netdata/edit-config health_alarm_notify.conf

# After saving updates, cycle the netdata process
brew services stop netdata
brew services start netdata
```

Use the provided scripts to start, stop, and test netdata
```bash
cd <clone area>
# start netdata
./setup.sh

# stop netdata
./cleanup.sh

# stop and uninstall netdata
./cleanup --uninstall

# Put test load on the system
# Use menu selections for desired test
./test_dashboard.sh
```

