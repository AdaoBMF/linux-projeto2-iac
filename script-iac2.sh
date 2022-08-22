#!/bin/bash

echo 'Updating server'
apt-get update
apt-get upgrade -y
apt-get install apache2 unzip -y

echo 'Downloading/seting app files'
cd /tmp
wget https://github.com/denilsonbonatti/linux-site-dio/archive/refs/heads/main.zip
unzip main.zip
cd linux-site-dio-main
cp -R * /var/www/html

echo "Warning: in Oracle cloud ubuntu servers, it's necessary to set the HTTP acces at the apache2.conf file"
echo "set it at => [/etc/iptables/rules.v4]"
echo "add the line [ -A INPUT -p tcp -m state --state NEW -m tcp --dport 80 -j ACCEPT ] right after the ssh config line"
echo "then run the command [ iptables-restore < /etc/iptables/rules.v4 ]"
echo "note that the access should be allowed on the security group at the Oracle instance console as well"
