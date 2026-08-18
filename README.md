# Netdata Simple System Monitor
This is a project buid from roadmap.sh and is located here:

https://roadmap.sh/projects/simple-monitoring-dashboard

## Requirements
This project is to pratice setting up a basic system monitoring tool. It will use Netdata to monitor basic system metrics.
- Install Netdata on a Linux system
  - this project will setup for a MacOs system
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
```

Configure Netdata
```bash
/opt/homebrew/etc/netdata/.bottle/etc/edit-config
# Reference stock configuration files
/opt/homebrew/Cellar/netdata/{NETDATA_VERSION}/lib/netdata/conf.d/
```

Adding additional certificates, place .pem files in
```bash
/opt/hombrew/etc/opnessl@3/certs
# ingest by running
/opt/homebrew/opt/openssl@3/bin/c_rehash
```