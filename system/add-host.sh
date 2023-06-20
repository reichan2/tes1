#!/bin/bash
# // CODE WARNA
export RED='\e[1;31m'
export GREEN='\e[0;32m'
export BLUE='\e[0;34m'
export NC='\e[0m'
#link izin ip vps
url_izin='https://raw.githubusercontent.com/Rerechan02/iziznscript/main/ip'






# // GMAIL && DOMAIN
clear
clear
echo ""
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo -e "\E[44;1;39m                Add Domain                \E[0m"
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo -e ""
echo -e "Domain anda saat ini:"
echo -e "$(cat /etc/xray/domain)"

echo "Masukan Domain Baru"
read -rp "Domain/Host: " -e host
echo "IP=$host" >> /var/lib/premium-script/ipvps.conf
echo "$host" > /usr/local/etc/xray/domain

export dom=$(cat /etc/xray/domain)
export domain=$(cat /usr/local/etc/xray/domain)

sed -i "s/sshws.${dom}/sshws.${domain}/g" /usr/local/etc/xray/config.json;
rm -f /etc/xray/domain;
echo "$host" > /etc/xray/domain

echo ""
echo -e "\e[1;32m════════════════════════════════════════════════════════════\e[0m"
echo ""
# // UPDATE CERT SSL
clear
echo
echo "Automatical Update Your Certificate SSL"
sleep 0.3
echo Starting Update SSL Certificate
sleep 0.3

# // STOP XRAY
systemctl stop xray.service
systemctl stop xray@none

# // GENERATE CERT
/root/.acme.sh/acme.sh --upgrade --auto-upgrade
/root/.acme.sh/acme.sh --set-default-ca --server letsencrypt
/root/.acme.sh/acme.sh --issue -d $domain -d sshws.$domain --standalone -k ec-256 --listen-v6
~/.acme.sh/acme.sh --installcert -d $domain -d sshws.$domain --fullchainpath /usr/local/etc/xray/xray.crt --keypath /usr/local/etc/xray/xray.key --ecc

# // RESTART XRAY
systemctl restart xray.service
systemctl restart xray@none

clear
echo -e ""
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo -e "\E[44;1;39m        PERTUKARAN DOMAIN SELESAI         \E[0m"
echo -e "\033[0;34m══════════════════════════════════════════\033[0m"
echo ""
read -n 1 -s -r -p "Press any key to back on menu"
menu
