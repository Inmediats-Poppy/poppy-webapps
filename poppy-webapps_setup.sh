#! /bin/bash
# Installing poppy-webapps using several script
# You can also executing each script seperately

sudo apt-get install git
git clone https://github.com/Inmediats-Poppy/poppy-webapps.git
cd poppy-webapps/
sh ./nbserver_configure.sh
sh ./poppyweb_configure.sh
sh ./poppyAP_configure.sh

