#! /bin/bash
# Installing poppy-webapps using several script
# You can also executing each script seperately
set -x
trap read debug

sudo apt-get install git
git clone https://github.com/Inmediats-Poppy/poppy-webapps.git
cd poppy-webapps/
sudo sh ./nbserver_configure.sh
sudo sh ./poppyweb_configure.sh
sudo sh ./poppyAP_configure.sh

