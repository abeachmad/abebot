#!/bin/bash

VALIDATOR="$VALIDATOR_ADDRESS"
ID="$ID_CHAT"
TOKEN_BOT="5745269620:AAEu6smmKpCJyztqV9sXzx2MNBGsVGVzfTs"
while true
do
cd "$HOME"/ || return
jail=$(haqqd q staking validator "$VALIDATOR" -ot | jq .jailed)
if  [ "$jail" == "false" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ✅ $VALIDATOR IS FINE"
elif [ "$jail" == "true" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ❌ $VALIDATOR IS JAILED"
fi
block=$(haqqd q slashing signing-info $(haqqd tendermint show-validator) -ot | jq .missed_blocks_counter)
if  [[ "$block" == ""0"" ]]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ✅ NODE MISSED NO BLOCK"
elif [ "$block" != ""0"" ]; then
        curl -s -X POST "https://api.telegram.org/bot$TOKEN_BOT/sendmessage" -d "chat_id=$ID" -d "parse_mode=html" -d "text= ⚠️ NODE IS MISSING BLOCKS: $block missed blocks"
fi
   printf "sleep"
        for((sec=0; sec<60; sec++))
        do
                printf "."
                sleep 1
        done
        printf "\n"
        
        echo "Press Ctrl+A+D to detach from this screen..."
        echo "or type: exit "
done
