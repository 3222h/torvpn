
#!/bin/bash

# Check if tor is installed, install if not
if ! command -v tor &> /dev/null
then
    sudo apt update
    sudo apt install -y tor
fi

# Display region options
echo "======================="
echo "Choose region (USE CAPITAL LETTERS ONLY)."
echo "======================="
echo "US, AU, SG, FR, DE, LU, JP, CA, BE, GB, NL, IS, HK, BR, IT, PL, RO"

# Read user input and convert to uppercase
read -p "Choose region: " CRP
CRP=$(echo "$CRP" | tr '[:lower:]' '[:upper:]')

# Configure torrc file
TORRC_FILE="/etc/tor/torrc"
sudo bash -c "cat > $TORRC_FILE" <<EOL
SocksPort 9050
ControlPort 9051
CookieAuthentication 1
ExitNodes {$CRP}
StrictNodes 1
EOL

# Restart Tor service
sleep 1
sudo service tor stop
sleep 1
sudo service tor start

curl --socks5 127.0.0.1:9050 https://ipscore.io


# Show Tor service status
sudo service tor status
