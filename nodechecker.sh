#!/bin/bash

ACCOUNT="$WALLET_ADDRESS"
VALIDATOR="$VALIDATOR_ADDRESS"
ID="$ID_CHAT"
TOKEN_BOT="5745269620:AAEu6smmKpCJyztqV9sXzx2MNBGsVGVzfTs"
while true
do
cd $HOME/
jail=$(haqqd q staking validator VALIDATOR -oj | jq .jailed)
if  [ $jail == "false" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ✅ VALIDATOR IS FINE"
elif
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ❌ VALIDATOR IS JAILED"       
fi
block=$(haqqd q slashing signing-info $(haqqd tendermint show-validator) -oj | jq .missed_blocks_counter)
if  [ $block -gt "0" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ⚠ NODE IS MISSING BLOCKS "\==" Missed Blocks Count: $block"      
fi
   printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
done
