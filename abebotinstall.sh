#!/bin/bash
echo "========================================================================================"
echo -e "\033[0;35m"
echo "      :::         ::: :::::       :::::::::    :::           :::::::::      ::::::::::    ";
echo "   :::   :::      :::    ::::     :::          :::          ::::    :::    :::       ::   ";
echo " :+:      :+:     :+:   :+::+     ::+          ::+          +::      ::+   :+:            ";
echo " +:+  +:+  +:+    ++:  ++:+       +:++:++:+    +:+         :++       ++:   :+:+#######  ";
echo " +#+       +#+    +++     #+++    #++          #++         +#+       +#+   +#+      ###   ";
echo " ###       ###    ###    #####    #########    #########    ###     ###    ###      ###   ";
echo " ###       ###    ### ######      #########    #########      #######       ##########   ";
echo -e "\e[0m"
echo "========================================================================================="

sleep 1

# set vars
if [ ! $ID_CHAT ]; then
read -p "Input Your ID_CHAT: " ID_CHAT
echo 'export ID_CHAT='\"${ID_CHAT}\" >> $HOME/.bash_profile
read -p "Input Your Wallet Address: " WALLET_ADDRESS
echo 'export WALLET_ADDRESS='\"${WALLET_ADDRESS}\" >> $HOME/.bash_profile
read -p "Input Your Validator Address: " VALIDATOR_ADDRESS
echo 'export WALLET_ADDRESS='\"${VALIDATOR_ADDRESS}\" >> $HOME/.bash_profile
fi
echo 'source $HOME/.bashrc' >> $HOME/.bash_profile
. $HOME/.bash_profile

echo -e "Your ID Chat: \e[1m\e[32m${ID_CHAT}\e[0m"
echo -e "Your Wallet Address: \e[1m\e[32m${WALLET_ADDRESS}\e[0m"
echo -e "Your Validator Address: \e[1m\e[32m${VALIDATOR_ADDRESS}\e[0m"
echo '================================================='
sleep 1

clear
cd $HOME
wget -O mdbotedit.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/bot/mdbotedit.sh && chmod +x mdbotedit.sh && screen -xR -S mdbot ./mdbotedit.sh
# wget -O mdbot.sh https://raw.githubusercontent.com/mdlog/testnet-mdlog/main/bot/mdbot.sh && chmod +x mdbot.sh && nohup ./mdbot.sh
