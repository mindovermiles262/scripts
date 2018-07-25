#!/bin/bash

# Fixes dropbox icon not displaying properly in ubuntu
# Set this script to run with startup programs

dropbox stop && dbus-launch dropbox start

