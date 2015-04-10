#! /bin/bash

# Create a new profile
ipython profile create nbserver

# Download and move ipython config
cp /home/poppy/.ipython/profile_nbserver/ipython_notebook_config.py /home/poppy/.ipython/profile_nbserver/ipython_notebook_config.py.BAK
cp conf/ipython_notebook_config.py /home/poppy/.ipython/profile_nbserver/ipython_notebook_config.py

# ipython notebook --profile=nbserver
# Deamonize
sudo cp conf/nbserver /etc/init.d/nbserver
sudo chmod 0755 /etc/init.d/nbserver
sudo update-rc.d nbserver defaults
