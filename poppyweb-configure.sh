#! /bin/bash
# Configuring apache and moving files to /var/www/
set -x
trap read debug

# Cleaning apache2 config
sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/wificonfig.conf
sudo a2ensite 000-default.conf
sudo /etc/init.d/apache2 restart
sudo mv /var/www/web /var/www/html/wificonfig
 
# Moving WWW/
sudo cp www/html/* /var/www/html/

#mv snap
git clone https://github.com/jmoenig/Snap--Build-Your-Own-Blocks.git
mv Snap--Build-Your-Own-Blocks snap
sudo cp snap/ /var/www/html/snap/

# mv snap blocks
sudo cp conf/pypot-basic-snap-blocks.xml /var/www/html/snap/Examples/
