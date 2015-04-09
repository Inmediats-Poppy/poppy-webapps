#! /bin/bash
# Installing and configuring Poppy as an Wifi Access Point
WLAN=ifconfig | grep wlan | cut -c -6


# installating software
sudo apt-get update
sudo apt-get install hostapd dnsmasq

#configure interfaces
#wget https://raw.githubusercontent.com/Inmediats-Poppy/poppy_install/master/poppyAP/interfaces
sudo cp /etc/network/interfaces /etc/network/interfaces.BAK
sudo mv interfaces /etc/network/interfaces 

# Changing NetworkManager configuration
#wget https://raw.githubusercontent.com/Inmediats-Poppy/poppy_install/master/poppyAP/NetworkManager.conf
sudo cp /etc/NetworManager/NetworManager.conf /etc/NetworManager/NetworManager.conf.BAK
sudo mv NetworManager.conf /etc/NetworManager/NetworManager.conf
sudo nmcli nm wifi off
sudo rfkill unblock wlan
sudo ifdown ${WLAN}
sudo ifup ${WLAN}

#configure hostapd
#wget https://raw.githubusercontent.com/Inmediats-Poppy/poppy_install/master/poppyAP/hostpad.conf
sudo /etc/hostapd/hostapd.conf /etc/hostapd/hostapd.conf.BAK
sudo mv hostpad.conf /etc/hostapd/hostapd.conf

# adafruit hack to make driver rtl871xdrv working with hostapd
wget http://adafruit-download.s3.amazonaws.com/adafruit_hostapd_14128.zip
unzip adafruit_hostapd_14128.zip
rm adafruit_hostapd_14128.zip
sudo cp /usr/sbin/hostapd /usr/sbin/hostapd.BAK
sudo mv hostapd /usr/sbin
sudo chmod 755 /usr/sbin/hostapd
sudo service hostapd start 


#configure dnsmasq
wget https://raw.githubusercontent.com/Inmediats-Poppy/poppy_install/master/poppyAP/dnsmasq.conf
sudo cp /etc/dnsmasq.conf /etc/dnsmasq.conf.BAK
sudo mv dnsmasq.conf /etc/dnsmasq.conf 
sudo service dnsmasq

# Starting daemons
sudo /etc.init.d/hostapd start
sudo /etc.init.d/dnmasq start
