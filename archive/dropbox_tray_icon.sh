#!/bin/bash

# Fixes dropbox icon not displaying ubuntu/xubuntu
# Set this script to run with startup programs (Disable
# all other Dropbox-init Scripts)

sleep 5
dropbox stop && dbus-launch dropbox start

