#!/bin/bash
sudo apt update && sudo apt install screen -y

sleep 1

# set vars
if [ ! $ID_CHAT ]; then
read -p "Input Your ID_CHAT: " ID_CHAT
echo 'export ID_CHAT='\"${ID_CHAT}\" >> $HOME/.bash_profile
read -p "Input Your Validator Address: " VALIDATOR_ADDRESS
echo 'export WALLET_ADDRESS='\"${VALIDATOR_ADDRESS}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "Your ID Chat: \e[1m\e[32m${ID_CHAT}\e[0m"
echo -e "Your Validator Address: \e[1m\e[32m${VALIDATOR_ADDRESS}\e[0m"
echo '================================================='
sleep 1

clear
cd $HOME
wget -O nodechecker.sh https://github.com/abeachmad/abebot/blob/main/nodechecker.sh && chmod +x nodechecker.sh && screen -xR -S abebot ./nodechecker.sh
