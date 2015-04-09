#! /bin/bash

# Create a new profile
ipython profile create nbserver

# Download and move ipython config
#wget https://raw.githubusercontent.com/Inmediats-Poppy/poppy_install/master/profile_nbserver/ipython_notebook_config.py
cp /home/poppy/.ipython/profile_nbserver/ipython_notebook_config.py /home/poppy/.ipython/profile_nbserver/ipython_notebook_config.py.BAK
cp ipython_notebook_config.py /home/poppy/.ipython/profile_nbserver/ipython_notebook_config.py

# ipython notebook --profile=nbserver
# Deamon to create
#wget https://raw.githubusercontent.com/Inmediats-Poppy/poppy_install/master/src/nbserver
sudo cp nbserver /etc/init.d/nbserver
sudo chmod 0755 /etc/init.d/nbserver
sudo update-rc.d nbserver defaults
