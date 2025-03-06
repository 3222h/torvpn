
#!/bin/bash


if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi


echo "======================="
echo "Choose region (USE CAPITAL LETTERS ONLY)."
echo "======================="
echo "US, AU, SG, FR, DE, LU, JP, CA, BE, GB, NL, IS, HK, BR, IT, PL, RO"


read -p "Choose region: " CRP
CRP=$(echo "$CRP" | tr '[:lower:]' '[:upper:]')


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
