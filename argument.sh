#!/bin/bash

#echo "value of 0 is:"
#echo $0

#echo "value of 1 is:"
#echo $1


echo "removing apache package"
sudo apt remove $1 -y > /dev/null

echo "INSTALLING APACHE SERVER"
sudo apt install $1 -y 

