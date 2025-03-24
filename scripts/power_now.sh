#!/bin/bash

awk '{print $1*10^-6 " W"}' /sys/class/power_supply/BAT0/power_now
