#!/bin/bash


# Installing dependencies

echo "##########################################"
echo "Installing dependencies"
echo "##########################################"
echo
sudo apt remove apache2
sudo apt install wget unzip apache2 -y

#Enabeling and starting apache service
echo "##########################################"
echo "Enabeling and starting httpd service"
echo "##########################################"
sudo systemctl start apache2
sudo systemctl enable apache2
echo 
#Making tmp directory
echo "##########################################"
echo "Starting artifact deployment"
echo "##########################################"
mkdir -p /tmp/webfiles

cd /tmp/webfiles
wget https://www.tooplate.com/zip-templates/2132_clean_work.zip
unzip 2132_clean_work.zip
sudo cp -r 2132_clean_work/* /var/www/html/

#Restarting server
echo "##########################################"
echo "Restarting HTTPD service"
echo "##########################################"

sudo systemctl restart apache2
echo

#Cleanup
echo "##########################################"
echo "Removing temperory files"
echo "##########################################"

rm -rf /tmp/webfiles
echo 
