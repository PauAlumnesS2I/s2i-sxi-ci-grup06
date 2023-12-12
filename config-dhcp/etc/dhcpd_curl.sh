#!/bin/bash

# Purpose: Config ubuntu DHCP server
# https://ubuntu.com/server/docs/network-dhcp
# Author: Jose Maria Madronal GPL v2.0+ (Proxmox script)
# ------------------------------------------



# Declare STRING variable
STRING="Instalant DHCP configurat per script"
#print variable on screen
echo $STRING

# Declare variables to download files from private repository
#TOKEN="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"
#headerToken="--header Authorization: token $TOKEN"
#headerToken=""
OWNER="PauAlumnesS2I"
REPO="s2i-sxi-ci-grup06"
PATHFILE="tree/main/config-dhcp/etc/dhcp/dhcpd.conf"
f_dchpd_conf="https://github.com/$OWNER/$REPO/$PATHFILE"

#https://raw.githubusercontent.com/$OWNER/$REPO/$PATHFILE


# Print f_dchpd_conf on screen
echo $f_dchpd_conf

#Install DHCP
echo "Install DHCP"
apt update -y
apt install isc-dhcp-server -y

# Download github configuration file
#wget $f_dchpd_conf
echo "Get configuration file"
curl $headerToken -O -L $f_dchpd_conf

# Copy configuration file to etc directory
cp dhcpd.conf /etc/dhcp

# Restart dhcp service
echo "Restart dhcp service"
systemctl restart isc-dhcp-server
