# Telegram Bot Node Checker
This script is a node checker that uses a telegram bot to notify or alert validators about their current haqq node state.

## Prerequisites:
In order to be able to use this telegram bot alert, you need to provide:
#### 1. Your telegram Chat ID
You can find your telegram chat_ID by sending message to [@get_id_bot](https://t.me/get_id_bot) or [@getmyid_bot](https://t.me/getmyid_bot) or [@userinfobot](https://t.me/userinfobot)
#### 2. Your Validator Address
Validator address is your Bech32 Val address. Its easy to spot because it start with "haqqvaloperxxxxxxxxxxxxxxxxxxxxxxxxxxxxx".
You can view this address using explorer such as [manticore explorer](https://testnet.manticore.team/haqq/staking) or [guru explorer](https://haqq.explorers.guru/validators). And the simplest way to find is by using command:
```
haqqd keys show <YOUR_WALLET_NAME> --bech val -a
```

## Bot Installation
After get your telegram chat_ID and Validator Address, run this script on the same server/virtual machine (VM), where your node validator runs.
You will be promted to fill both of your chat_ID as well as validator address:
```
wget -O abebotinstall.sh  https://raw.githubusercontent.com/abeachmad/abebot/main/abebotinstall.sh && chmod +x abebotinstall.sh && ./abebotinstall.sh
```
Please type or fill your chain_ID and validator address when prompted. 
This script will open screen session to ping your telegram with alert about your node state.
There are two alert ping by this bot every minute:
#### 1. Does your validator get jailed or not
#### 2. How many blocks your node miseed.
Then the last to do is go to your telegram and add [this bot](https://t.me/abe_nodecheckerbot) . After click start, the bot will start to give you alert every minutes.
