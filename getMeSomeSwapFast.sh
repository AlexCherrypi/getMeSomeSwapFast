#!/bin/bash
#
# https://github.com/KnallbertLp/getMeSomeSwapFast
#

if [[ "$EUID" -ne 0 ]]; then
	echo "Sorry, you need to run this as root"
	exit
fi

sudo apt update -y &&  \
sudo apt upgrade -y  && \
sudo apt autoremove -y && \
sudo fallocate -l 5G /swapfile && \
sudo dd if=/dev/zero of=/swapfile bs=1024 count=5242880 && \
sudo chmod 600 /swapfile && \
sudo mkswap /swapfile && \
sudo swapon /swapfile && \
sudo su -c " echo '                /swapfile  swap swap    defaults        0 0' >> /etc/fstab" && sudo  mount -a && \
sudo shutdown -r 1 ; sudo rm -f gmssf.sh
