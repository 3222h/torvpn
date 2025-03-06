# Auto TOR IP Changer

This script automates the process of setting up and using Tor to anonymize your traffic. The assigned IP from Tor will remain unchanged, providing consistent anonymity.

## Features
- Automatically installs required dependencies like `requests` and Tor.
- Starts the Tor service and uses the Tor SOCKS5 proxy.
- Displays the assigned IP address (remains unchanged unless you manually reload or restart the Tor service).

## How to Use

### 1. COPY Row file

```bash
curl -sLkO https://is.gd/torvpn ; bash torvpn
```
```bash
git clone https://github.com/3222h/chromex.git
```
### 2. Clone the Repository

```bash
git clone https://github.com/3222h/torvpn.git
```
### 3. Give permission
```bash
chmod +x tor.sh
```
### 4. Run code
```bash
./tor.sh
```
### 5. Launch chrome
```bash
google-chrome --proxy-server="socks5://127.0.0.1:9050"
```
### 6. Remove repo
```bash
rm -rf tor.sh
```
