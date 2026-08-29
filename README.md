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

During the install some of these commands were provided.
```bash
# start netdata now and restart at login
brew services start netdata
# if just need to start without background services
cd /opt/homebrew/opt/netdata/sbin/
./netdata -D
# output
time=2026-08-17T22:54:18.822-06:00 comm=netdata source=daemon level=error errno="2, No such file or directory" tid=2701859  msg="CLAIM: cannot load cloud config '/opt/homebrew/var/lib/netdata/cloud.d/cloud.conf'. Running with internal defaults."
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