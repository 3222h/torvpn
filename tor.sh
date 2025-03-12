
#!/bin/bash


if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi

clear
TORVPN_FILE="TORVPN"
TORRC_FILE="/etc/tor/torrc"

# Check if TORVPN file exists and is not empty
if [ -s "$TORVPN_FILE" ]; then
    CRP=$(cat "$TORVPN_FILE")
    echo "Using saved region: $CRP"
else
    echo "======================="
    echo "Choose region (USE CAPITAL LETTERS ONLY)."
    echo "======================="
    echo "US, AU, SG, FR, DE, LU, JP, CA, BE, GB, NL, IS, HK, BR, IT, PL, RO"

    read -p "Choose region: " CRP
    CRP=$(echo "$CRP" | tr '[:lower:]' '[:upper:]')

    # Save the region to the TORVPN file
    echo "$CRP" > "$TORVPN_FILE"
fi

# Create or update the torrc file
sudo bash -c "cat > $TORRC_FILE" <<EOL
SocksPort 9050
ControlPort 9051
CookieAuthentication 1
ExitNodes {$CRP}
StrictNodes 1
EOL

echo "Tor configuration updated with region: $CRP"
clear

sleep 1
sudo service tor stop
sleep 1
sudo service tor start
sudo service tor status
clear
curl --socks5 127.0.0.1:9050 https://check.torproject.org/api/ip
