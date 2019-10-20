#!/bin/bash
#
# https://github.com/KnallbertLp/getMeSomeSwapFast
#

sudo apt update -y &&  \
sudo apt upgrade -y  && \
sudo apt autoremove -y && \
sudo fallocate -l 5G /swapfile && \
sudo dd if=/dev/zero of=/swapfile bs=1024 count=5242880 && \
sudo chmod 600 /swapfile && \
sudo mkswap /swapfile && \
sudo swapon /swapfile && \
sudo su -c " echo '                /swapfile  swap swap    defaults        0 0' >> /etc/fstab" && sudo  mount -a && sudo reboot 
