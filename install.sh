#!/bin/bash
##Updating Locale to en_US
perl -pi -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/g' /etc/locale.gen
locale-gen en_US.UTF-8
update-locale en_US.UTF-8
echo 'Locale updated to en_US.UTF-8'
##Changing Hostname
#CURRNET_HOSTNAME='cat /etc/hostname | tr -d " \t\n\r"'
#rm /etc/hostname
#read -p 'Hostname: ' $hostname
#cat $hostname > /etc/hostname
#sed -i "s/127.0.1.1.*$CURRENT_HOSTNAME/127.0.1.1\t$hostname/g" /etc/hosts
#echo 'Hostname Changed to ' $hostname
##changing password
passwd pi &&
echo 'pi password changed'

#Installing updates and pkg
apt update -y
apt upgrade -y
apt dist-upgrade -y
wget -O - https://raw.githubusercontent.com/sdesalas/node-pi-zero/master/install-node-v.last.sh | bash
echo 'updates and Node.js have been installed'

#Cloning Barberry
git clone https://github.com/lejacobroy/barberry-client/ /home/pi/barberry/
#cron jobs
