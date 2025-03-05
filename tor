#!/bin/bash

# Function to get external IP via a given SOCKS proxy
get_ip() {
    curl --socks5-hostname 127.0.0.1:$1 -s https://check.torproject.org/api/ip | jq -r '.IP'
}

# Check if required dependencies are installed
if ! command -v tor &> /dev/null; then
    echo "Tor not found. Installing Tor..."
    sudo apt update
    sudo apt install -y tor jq curl
else
    echo "Tor is already installed."
fi

# Create a directory for Tor configuration files if it doesn't exist
mkdir -p ~/tor_config

# Array to store unique IPs
declare -a IP_LIST

# Start Tor instances one by one, ensuring each has a unique exit IP
for i in {1..10}; do
    # Create a new configuration file for each Tor instance
    cat <<EOF > ~/tor_config/torrc$i
SOCKSPort 127.0.0.1:905$i
Log notice file /var/log/tor/torrc$i.log
ExitNodes {us}
StrictNodes 1
DataDirectory /var/lib/tor/instance$i
ControlPort 905$i
HashedControlPassword 16:yourhashedpasswordhere
EOF

    # Create DataDirectory for each instance
    sudo mkdir -p /var/lib/tor/instance$i
    sudo chown -R $USER:$USER /var/lib/tor/instance$i

    # Start Tor instance
    echo "Starting Tor instance $i on port 905$i..."
    tor -f ~/tor_config/torrc$i &  
    sleep 10  # Give some time for Tor to connect

    # Get external IP
    while true; do
        IP=$(get_ip 905$i)
        echo "Tor instance $i IP: $IP"

        if [[ " ${IP_LIST[@]} " =~ " ${IP} " ]]; then
            echo "IP conflict detected! Restarting Tor instance $i..."
            pkill -f "tor -f ~/tor_config/torrc$i"
            sleep 5
            tor -f ~/tor_config/torrc$i &  
            sleep 10
        else
            IP_LIST+=("$IP")
            break
        fi
    done
done

echo "All 10 Tor instances are running with unique exit IPs."
