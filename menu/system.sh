#wget https://github.com/${GitUser}/
GitUser="Rerechan02"
#IZIN SCRIPT
MYIP=$(curl -sS ipv4.icanhazip.com)



echo -e "\e[32mloading...\e[0m"

clear
# LINE COLOUR
line=$(cat /etc/line)
# TEXT COLOUR BELOW
below=$(cat /etc/below)
# BACKGROUND TEXT COLOUR
back_text=$(cat /etc/back)
# NUMBER COLOUR
number=$(cat /etc/number)
# TEXT ON BOX COLOUR
box=$(cat /etc/box)
clear
red='\e[1;31m'
green='\e[0;32m'
NC='\e[0m'
MYIP=$(wget -qO- ifconfig.me/ip);
clear
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e "                 • SYSTEM MENU •                 "
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
echo -e " [\e[36m•1\e[0m] Ganti Domain"
echo -e " [\e[36m•2\e[0m] Speedtest vps"
echo -e " [\e[36m•3\e[0m] Restart All service"
echo -e " [\e[36m•4\e[0m] Cek Bandiwth"
echo -e " [\e[36m•5\e[0m] Generate cert ssl"
echo -e " [\e[36m•6\e[0m] Check CPU & RAM"
echo -e ""
echo -e " [\e[36m•x\e[0m] Back to Menu"
echo -e ""
echo -e "\e[33m ━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━\033[0m" | lolcat
echo -e ""
read -p " Please Input Number  [1-6 or x] :  "  sys
echo -e ""
case $sys in
1)
add-host
;;
2)
speedtest
;;
3)
restart
;;
4)
vnstat -d
;;
5)
certv2ray
;;
6)
htop
;;
7)
restore
;;
8)
wbmn
;;
9)
limit-speed
;;
10)
backup
;;
11)
speedtest
;;
12)
xray version
;;
13)
bbr
;;
14)
ins-helium
;;
15)
helium
;;
16)
autoreboot
;;
17)
passwd
;;
18)
htop
;;
19)
message-ssh
;;
x)
menu
;;
*)
echo "Please enter an correct number"
sleep 1
system
;;
esac
