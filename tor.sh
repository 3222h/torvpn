#!/bin/bash

if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi

echo "======================="
echo "choose region (USE CAPITAL LATTER ONLY)."
echo "======================="
echo "US,AU,SG,FR,DE,LU,JP,CA,BE,GB,NL,IS,HK,BR,IT,PL,RO"
read -p "choose region: " CRP

TORRC_FILE="/etc/tor/torrc"
sudo bash -c "cat > $TORRC_FILE" <<EOL
SocksPort 9050
ControlPort 9051
CookieAuthentication 1
ExitNodes {$CRP}
StrictNodes 1
EOL
sleep 1
sudo service tor stop
sleep 1
sudo service tor start
sudo service tor status
