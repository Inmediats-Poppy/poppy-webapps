
# Cleaning apache2 config
sudo mv /etc/apache2/sites-enabled/000-default.conf /etc/apache2/sites-enabled/wificonfig.conf
sudo a2ensite 000-default.conf
sudo /etc/init.d/apache2 restart
sudo mv /var/www/web/ /var/www/html/wificonfig/
 
# Moving WWW/
sudo mv www/html/ /var/www/html/

#mv snap
git clone snap.git
sudo mv snap/ /var/www/html/

# mv snap blocks
sudo mv conf/pypot-basic-snap-blocks.xml /var/www/html/snap/Examples/
