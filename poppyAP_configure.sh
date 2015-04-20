#! /bin/bash
# Installing and configuring Poppy as an Wifi Access Point
set -x
trap read debug

# Creating variable for Wlan inerface
#export WLANINT=$(ifconfig | grep wlan | cut -c -6)
# configuring with Wlan variable
#sed -i -e "s/WLANINT/$WLANINT/g" *


# installating software
sudo apt-get update
sudo apt-get install hostapd dnsmasq

#configure interfaces
sudo cp /etc/network/interfaces /etc/network/interfaces.BAK
sudo mv conf/interfaces /etc/network/interfaces 

# Changing NetworkManager configuration
sudo cp /etc/NetworkManager/NetworkManager.conf /etc/NetworManager/NetworManager.conf.BAK
sudo mv conf/iNetworkManager.conf /etc/NetworkManager/NetworManager.conf
sudo nmcli nm wifi off
sudo rfkill unblock wlan
sudo ifdown wlan2 #${WLANINT}
sudo ifup wlan2 #${WLANINT}

#configure hostapd
sudo /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.BAK
sudo mv conf/hostpad.conf /etc/hostapd/hostapd.conf
#modify /etc/default/hostapd DAEMON_CONF="/etc/hostapd/hostapd.conf"

# adafruit hack to make driver rtl871xdrv working with hostapd
wget http://adafruit-download.s3.amazonaws.com/adafruit_hostapd_14128.zip
unzip adafruit_hostapd_14128.zip
rm adafruit_hostapd_14128.zip
sudo cp /usr/sbin/hostapd /usr/sbin/hostapd.BAK
sudo mv hostapd /usr/sbin
sudo chmod 755 /usr/sbin/hostapd
sudo service hostapd start 


#configure dnsmasq
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.BAK
sudo mv conf/idnsmasq.conf /etc/dnsmasq.conf 
sudo service dnsmasq

# Starting daemons
sudo /etc.init.d/hostapd start
sudo /etc.init.d/dnmasq start
