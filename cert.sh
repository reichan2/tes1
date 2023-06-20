#!/bin/bash
#wget https://github.com/${GitUser}/
GitUser="Rerechan02"
echo -e "\e[32mloading...\e[0m"
clear
echo start
sleep 0.5
source /var/lib/premium-script/ipvps.conf
domain=$(cat /usr/local/etc/xray/domain)
emailcf=$(cat /usr/local/etc/xray/email)
clear
systemctl stop xray
echo -e "\e[0;32mStart renew your Certificate SSL\e[0m"
sleep 1
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain --standalone -k ec-256
~/.acme.sh/acme.sh --installcert -d $domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc
systemctl start xray
echo Done
sleep 0.5
echo -e "\e[0;32m All finished ! \e[0m" 
sleep 1
clear
