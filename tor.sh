#!/bin/bash

if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi

TORRC_FILE="/etc/tor/torrc"
sudo sed -i '/^ExitNodes/d' "$TORRC_FILE"
sudo sed -i '/^StrictNodes/d' "$TORRC_FILE"

sudo service tor stop
sudo service tor start
sudo service tor status
