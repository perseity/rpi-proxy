#!/bin/bash

echo "### Enable & start DHCP server"
systemctl start isc-dhcp-server

echo Setting NAT routing
iptables -t nat -A POSTROUTING -o wlan0 -j MASQUERADE
iptables -A FORWARD -i wlan0 -o eth0 -m state --state RELATED,ESTABLISHED -j ACCEPT
iptables -t nat -A PREROUTING -p tcp -i wlan0 --dport 23 -j DNAT --to 10.0.1.2:23
iptables -t nat -A PREROUTING -p tcp -i wlan0 --dport 80 -j DNAT --to 10.0.1.2:80
iptables -A FORWARD -i eht0 -o wlan0 -j ACCEPT

DEFAULT_IFACE=`route -n | grep -E "^0.0.0.0 .+UG" | awk '{print $8}'`
if [ "$DEFAULT_IFACE" != "wlan0" ]
then
  GW=`route -n | grep -E "^0.0.0.0 .+UG .+wlan0$" | awk '{print $2}'`
  echo Setting default route to wlan0 via $GW
  route del default $DEFAULT_IFACE
  route add default gw $GW wlan0
fi
