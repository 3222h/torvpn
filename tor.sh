#!/bin/bash

if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi

TORRC_FILE="/etc/tor/torrc"

if ! grep -q "ExitNodes {us}" "$TORRC_FILE"; then
    echo -e "
ExitNodes {us}
StrictNodes 1
" | sudo tee -a "$TORRC_FILE"
fi

sudo service tor start
sudo service tor status
