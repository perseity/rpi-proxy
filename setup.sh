#!/bin/bash

echo "### Installing dependencies"
apt-get install -y isc-dhcp-server

echo "### Backing up /etc/network/interfaces.d/eth0-dhcp"
mv /etc/network/interfaces.d/eth0-dhcp /etc/network/interfaces.d/eth0-dhcp.save
echo "### Copying new isc-dhcp-server settings"
cp ./etc-local/network/interfaces.d/eth0-dhcp /etc/network/interfaces.d/

echo "### Backing up /etc/default/isc-dhcp-server settings"
mv /etc/default/isc-dhcp-server /etc/default/isc-dhcp-server.save
echo "### Copying new isc-dhcp-server settings"
cp ./etc-local/default/isc-dhcp-server /etc/default/

echo "### Backing up /etc/dhcp/dhcpd.conf settings"
mv /etc/dhcp/dhcpd.conf /etc/dhcp/dhcpd.conf.save
echo "### Copying new dhcpd.conf settings"
cp ./etc-local/dhcp/dhcpd.conf /etc/dhcp/

echo "### Backing up /etc/sysctl.conf settings"
mv /etc/sysctl.conf /etc/sysctl.conf.save
echo "### Copying new sysctl.conf settings"
cp ./etc-local/sysctl.conf /etc/
