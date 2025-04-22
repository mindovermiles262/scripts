#!/bin/bash

MNT_DIR=/media/dennas
# CRD=/home/dipsea/.credentials_denhac
NAS=DENNAS
SHARE=denNAS/denhac_common

if [ "$EUID" -ne 0 ];
then
  echo "[!] Must be run as root."
  exit 1
fi

if [ ! -d "$MNT_DIR" ];
then
  echo "[!] Mount directory does not exist. Creating $MNT_DIR"
  mkdir -p $MNT_DIR
fi

echo "[*] Mounting $NAS/$SHARE to $MNT_DIR"

# mount -t cifs -o credentials=$CRD,uid=1000,gid=1000 //$NAS/$SHARE $MNT_DIR
mount -t cifs -o uid=1000,gid=1000 //$NAS/$SHARE $MNT_DIR

ls -l $MNT_DIR

