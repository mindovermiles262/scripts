#!/bin/bash

# Quickly set up list of Proxy Servers for Proxychains
# Uses NORD VPN as a Proxy Provider
#
# Copy output to [ProxyList] area of /etc/proxychains.conf
# 
# Be sure to change username & password

DOMAIN="us"
LOW=1822
HIGH=1841

USERNAME="user@example.com"
PASSWORD="yoursecretpassword"
PORT="1080"

for (( c=$LOW; c<=$HIGH; c++ ))
do
  LOOKUP="$DOMAIN$c.nordvpn.com"
  IP="$(nslookup $LOOKUP | grep Address | cut -d ' ' -f 2 | sed -n 2p)"
  echo "socks5 $IP $PORT $USERNAME $PASSWORD"
done

