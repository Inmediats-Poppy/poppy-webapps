#! /bin/bash
set -x
trap read debug

# Create a new profile
ipython profile create nbserver

# Download and move ipython config
cp /home/$USER/.ipython/profile_nbserver/ipython_notebook_config.py /home/$USER/.ipython/profile_nbserver/ipython_notebook_config.py.BAK
cp conf/ipython_notebook_config.py /home/$USER/.ipython/profile_nbserver/ipython_notebook_config.py

# ipython notebook --profile=nbserver
# Deamonize
sudo cp conf/nbserver /etc/init.d/nbserver
sudo chmod 755 /etc/init.d/nbserver
sudo update-rc.d nbserver defaults
