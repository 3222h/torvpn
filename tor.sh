#!/bin/bash

if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi
TORRC_FILE="/etc/tor/torrc"

sudo bash -c "cat > $TORRC_FILE" <<EOL
SocksPort 9050
ControlPort 9051
CookieAuthentication 1
ExitNodes {US}
StrictNodes 1
EOL
sleep 2
sudo service tor start
sudo service tor status
