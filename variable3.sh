#!/bin/bash

#Variable Declaration

PACKAGE="wget unzip apache2"
SVC="apache2"
URL="https://templatemo.com/tm-zip-files-2020/templatemo_520_highway.zip"
ARTIFACT="templatemo_520_highway"
TEMP="/tmp/webfiles"


# Installing dependencies

echo "##########################################"
echo "Installing dependencies"
echo "##########################################"
echo
#sudo apt remove apache2
sudo apt install $PACKAGE -y > /dev/null

#Enabeling and starting apache service
echo "##########################################"
echo "Enabeling and starting httpd service"
echo "##########################################"
sudo systemctl start $SVC
sudo systemctl enable $SVC
echo 

#Making tmp directory
echo "##########################################"
echo "Starting artifact deployment"
echo "##########################################"
mkdir -p $TEMP > /dev/null

cd /tmp/webfiles > /dev/null
wget $URL 
unzip $ARTIFACT.zip
sudo cp -r $ARTIFACT/* /var/www/html/ > /dev/null

#Restarting server
echo "##########################################"
echo "Restarting HTTPD service"
echo "##########################################"

sudo systemctl restart $SVC
echo

#Cleanup
echo "##########################################"
echo "Removing temperory files"
echo "##########################################"

rm -rf $TEMP > /dev/null
echo 
