Installing and configuring Poppy webapps

It aims to complete installation on Odroid using the poppy_install script

To install it you can (choose one of this method) :
- Execute the following line :

```bash
curl -L https://raw.githubusercontent.com/Inmediats-Poppy/poppy-webapps/master/poppy-webapps_setup.sh | sudo bash | sudo bash
```
  


- Clone the repo and execute each script once you're in the poppy-webapps directory (exept the poppy-webapps_setup.sh ):
```bash
sudo sh ./nbserver_configure.sh
sudo sh ./poppyweb_configure.sh
sudo sh ./poppyAP_configure.sh
``` 
