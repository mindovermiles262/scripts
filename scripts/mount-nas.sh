#!/bin/bash

MNT_DIR=/mnt/nas
CRD=/home/dipsea/.credentials
NAS=192.168.5.11
SHARE=andrew

if [ "$EUID" -ne 0 ];
then
  echo "[!] Must be run as root."
  exit 1
fi

if [ ! -d "$MNT_DIR" ];
then
  echo "[!] Mount directory does not exist. $MNT_DIR"
fi

echo "[*] Mounting $NAS/$SHARE to $MNT_DIR"
sleep 2

mount -t cifs -o credentials=$CRD,uid=1000,gid=1000 //$NAS/$SHARE $MNT_DIR

ls -l $MNT_DIR
