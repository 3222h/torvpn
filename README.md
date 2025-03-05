# Auto TOR IP Changer

This script automates the process of setting up and using Tor to anonymize your traffic. The assigned IP from Tor will remain unchanged, providing consistent anonymity.

## Features
- Automatically installs required dependencies like `requests` and Tor.
- Starts the Tor service and uses the Tor SOCKS5 proxy.
- Displays the assigned IP address (remains unchanged unless you manually reload or restart the Tor service).

## How to Use
### 1. Clone the Repository

```bash
git clone https://github.com/3222h/torvpn.git
```
### 2. Give permission
```bash
chmod +x tor.sh
```
### 3. Run code
```bash
./tor.sh
```
### 9. Launch chrome
```bash
google-chrome --proxy-server="socks5://127.0.0.1:9050"
```
### 10. Remove repo
```bash
rm -rf tor.sh
```
