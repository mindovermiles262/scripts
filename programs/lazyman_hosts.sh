#!/bin/bash

# Get the IP of powersports.ml
IP="$(nslookup powersports.ml | grep "Address" | sed -n 2p | awk '{print $3}')"

echo "$IP mf.svc.nhl.com" >> /etc/hosts
echo "$IP mlb-ws-mf.media.mlb.com" >> /etc/hosts
echo "$IP playback.svcs.mlb.com" >> /etc/hosts
