# 🌐 Day 4 — Linux Networking Commands

> A comprehensive guide to Linux networking tools for system administrators, DevOps engineers, and developers.

---

## 📋 Table of Contents

- [System-Level Networking Commands](#system-level-networking-commands)
- [Daily Networking Commands](#daily-networking-commands)
- [Quick Reference Table](#quick-reference-table)
- [Installation Notes](#installation-notes)
- [Usage Examples](#usage-examples)

---

## System-Level Networking Commands

### 1. `ping`
Sends ICMP echo requests to a host to check reachability and measure round-trip time.

```bash
ping google.com              # Continuous ping
ping -c 4 google.com         # Ping 4 times and stop
ping -i 2 google.com         # Ping with 2-second interval
```

---

### 2. `ifconfig`
Displays and configures network interface parameters (IP address, MAC address, netmask, etc.).  
> ⚠️ **Deprecated** on modern systems — prefer `ip` command. Install via `net-tools` package.

```bash
ifconfig                     # Show all active interfaces
ifconfig eth0                # Show specific interface
ifconfig eth0 up             # Enable interface
ifconfig eth0 down           # Disable interface
```

---

### 3. `ip`
The modern replacement for `ifconfig` and `route`. Part of the `iproute2` package.

```bash
ip addr show                 # Show all IP addresses
ip link show                 # Show all network interfaces
ip route show                # Show routing table
ip addr add 192.168.1.10/24 dev eth0   # Assign IP to interface
ip link set eth0 up          # Enable interface
```

---

### 4. `netstat`
Displays network connections, routing tables, interface statistics, and more.  
> ⚠️ **Deprecated** — prefer `ss` command on modern systems.

```bash
netstat -tuln                # Show listening TCP/UDP ports
netstat -a                   # Show all connections
netstat -r                   # Show routing table
netstat -s                   # Show network statistics per protocol
netstat -p                   # Show PID/program for each connection
```

---

### 5. `ss`
The modern, faster replacement for `netstat`. Stands for **Socket Statistics**.

```bash
ss -tuln                     # Show listening TCP/UDP sockets
ss -ta                       # Show all TCP connections
ss -s                        # Summary statistics
ss -p                        # Show process using socket
ss -tnp | grep :80           # Find what's using port 80
```

---

### 6. `traceroute` / `tracepath`
Traces the route packets take to reach a destination, showing each hop.

```bash
traceroute google.com        # Trace route to host
traceroute -n google.com     # Skip DNS resolution (faster)
tracepath google.com         # Similar but doesn't need root; shows MTU
```

> 💡 `tracepath` doesn't require root privileges and also reports MTU (Maximum Transmission Unit) at each hop.

---

### 7. `mtr`
Combines `ping` and `traceroute` into a real-time, continuously updating diagnostic tool.

```bash
mtr google.com               # Interactive real-time mode
mtr --report google.com      # Run once, print report
mtr -n google.com            # No DNS resolution
mtr --tcp google.com         # Use TCP instead of ICMP
```

---

### 8. `nslookup`
Queries DNS servers to resolve domain names to IP addresses and vice versa.

```bash
nslookup google.com          # Basic DNS lookup
nslookup google.com 8.8.8.8  # Use specific DNS server
nslookup -type=MX gmail.com  # Look up mail exchange records
nslookup -type=NS google.com # Look up name servers
```

---

### 9. `dig`
Advanced DNS lookup tool — more powerful and scriptable than `nslookup`.

```bash
dig google.com               # Basic A record lookup
dig google.com MX            # Mail exchange records
dig google.com NS            # Name server records
dig @8.8.8.8 google.com      # Query specific DNS server
dig +short google.com        # Short output (just the IP)
dig -x 8.8.8.8               # Reverse DNS lookup
dig google.com ANY           # All record types
```

---

### 10. `hostname`
Displays or sets the system's hostname.

```bash
hostname                     # Display current hostname
hostname -I                  # Show all IP addresses of the host
hostname -f                  # Show fully qualified domain name (FQDN)
sudo hostname newname        # Temporarily set hostname
```

---

### 11. `telnet`
Tests TCP connectivity to a specific port on a remote host.  
> ⚠️ **Not secure** for remote login — use SSH instead. Useful only for port testing.

```bash
telnet google.com 80         # Test HTTP port connectivity
telnet smtp.gmail.com 587    # Test SMTP port
```

---

### 12. `iwconfig`
Configures wireless network interfaces (SSID, frequency, mode, etc.).  
> ⚠️ **Deprecated** — prefer `iw` or `nmcli` on modern systems.

```bash
iwconfig                     # Show all wireless interfaces
iwconfig wlan0               # Show specific wireless interface
iwconfig wlan0 essid "MyWifi" # Connect to SSID
```

---

### 13. `arp`
Displays and manipulates the ARP (Address Resolution Protocol) cache — maps IP addresses to MAC addresses.

```bash
arp -a                       # Show ARP table (all entries)
arp -n                       # Show without resolving hostnames
arp -d 192.168.1.1           # Delete an ARP entry
arp -s 192.168.1.1 aa:bb:cc:dd:ee:ff  # Add static ARP entry
```

---

### 14. `whois`
Queries WHOIS databases for domain registration and IP ownership information.

```bash
whois google.com             # Domain registration info
whois 8.8.8.8                # IP address ownership info
```

---

## Daily Networking Commands

### 15. `curl`
Transfers data from or to a server using various protocols (HTTP, HTTPS, FTP, etc.). Widely used for API calls and testing.

```bash
curl https://api.example.com           # Basic GET request
curl -X POST https://api.example.com \
  -H "Content-Type: application/json" \
  -d '{"key":"value"}'                 # POST with JSON body
curl -I https://google.com             # Show response headers only
curl -o output.html https://example.com # Save response to file
curl -u user:pass https://example.com  # Basic authentication
curl -L https://example.com           # Follow redirects
curl -v https://example.com           # Verbose output (debug)
```

---

### 16. `wget`
Downloads files from the internet non-interactively. Supports HTTP, HTTPS, and FTP.

```bash
wget https://example.com/file.zip          # Download a file
wget -O myfile.zip https://example.com/f   # Save with custom name
wget -c https://example.com/largefile.iso  # Resume interrupted download
wget -r https://example.com               # Recursive website download
wget --limit-rate=1m https://example.com/f # Limit download speed
wget -b https://example.com/file           # Download in background
```

---

### 17. `route`
Displays and manipulates the kernel's IP routing table.  
> ⚠️ **Deprecated** — prefer `ip route` on modern systems.

```bash
route -n                                # Show routing table (numeric)
route add default gw 192.168.1.1       # Add default gateway
route add -net 10.0.0.0/8 gw 192.168.1.1  # Add static route
route del default gw 192.168.1.1       # Remove default gateway
```

---

### 18. `nmap`
Network exploration and security auditing tool. Scans hosts and services on a network.

```bash
nmap 192.168.1.1                  # Scan a single host
nmap 192.168.1.0/24               # Scan entire subnet
nmap -p 80,443 192.168.1.1        # Scan specific ports
nmap -p- 192.168.1.1              # Scan all 65535 ports
nmap -sV 192.168.1.1              # Detect service versions
nmap -O 192.168.1.1               # OS detection
nmap -A 192.168.1.1               # Aggressive scan (OS + version + scripts)
nmap -sn 192.168.1.0/24           # Ping scan (no port scan)
```

> ⚠️ Only scan networks you own or have explicit permission to scan.

---

## ➕ Additional Recommended Commands

### 19. `ssh`
Secure Shell — encrypted remote login and command execution.

```bash
ssh user@192.168.1.10         # Connect to remote host
ssh -p 2222 user@host         # Connect on custom port
ssh -i ~/.ssh/id_rsa user@host # Use specific key file
```

---

### 20. `nc` (netcat)
The "Swiss army knife" of networking — creates TCP/UDP connections for testing, file transfer, and port scanning.

```bash
nc -zv 192.168.1.1 80         # Test if port 80 is open
nc -l 1234                    # Listen on port 1234
echo "hello" | nc host 1234   # Send data to port
```

---

### 21. `tcpdump`
Captures and analyzes network packets — essential for debugging and traffic analysis.

```bash
tcpdump -i eth0               # Capture on eth0 interface
tcpdump -i eth0 port 80       # Capture HTTP traffic only
tcpdump -w capture.pcap       # Save capture to file
tcpdump -r capture.pcap       # Read from saved file
```

---

### 22. `nmcli`
NetworkManager command-line tool — the modern way to manage network connections.

```bash
nmcli device status           # Show all network devices
nmcli connection show         # List all connections
nmcli device wifi list        # Show available WiFi networks
nmcli device wifi connect "SSID" password "pass"  # Connect to WiFi
```

---

### 23. `firewall-cmd` / `ufw`
Manage firewall rules.

```bash
# UFW (Ubuntu/Debian)
ufw status                    # Show firewall status
ufw allow 80/tcp              # Allow HTTP
ufw deny 23/tcp               # Block Telnet

# firewall-cmd (RHEL/CentOS/Fedora)
firewall-cmd --list-all       # Show all rules
firewall-cmd --add-port=80/tcp --permanent  # Open port 80
```

---

## 📊 Quick Reference Table

| Command       | Purpose                          | Modern Alternative  | Requires Root |
|---------------|----------------------------------|---------------------|---------------|
| `ping`        | Test host reachability           | —                   | No            |
| `ifconfig`    | Show/configure interfaces        | `ip addr`           | Partial       |
| `ip`          | Full network configuration       | —                   | Partial       |
| `netstat`     | Network connections & stats      | `ss`                | No            |
| `ss`          | Socket statistics (fast)         | —                   | No            |
| `traceroute`  | Trace network path               | `mtr`               | No            |
| `tracepath`   | Trace path with MTU info         | —                   | No            |
| `mtr`         | Live ping + traceroute           | —                   | No            |
| `nslookup`    | DNS lookup                       | `dig`               | No            |
| `dig`         | Advanced DNS queries             | —                   | No            |
| `hostname`    | Show/set system hostname         | —                   | Partial       |
| `telnet`      | Test TCP port connectivity       | `nc`, `curl`        | No            |
| `iwconfig`    | Wireless interface config        | `iw`, `nmcli`       | Partial       |
| `arp`         | View/edit ARP cache              | `ip neigh`          | Partial       |
| `whois`       | Domain/IP ownership info         | —                   | No            |
| `curl`        | HTTP/API requests                | —                   | No            |
| `wget`        | Download files                   | `curl -O`           | No            |
| `route`       | View/edit routing table          | `ip route`          | Partial       |
| `nmap`        | Network scanning & auditing      | —                   | Partial       |
| `ssh`         | Secure remote login              | —                   | No            |
| `nc`          | Raw TCP/UDP connections          | —                   | No            |
| `tcpdump`     | Packet capture & analysis        | —                   | Yes           |
| `nmcli`       | Manage network connections       | —                   | Partial       |

---

## 🔧 Installation Notes

Some tools may not be pre-installed. Install them as needed:

```bash
# Debian / Ubuntu
sudo apt update
sudo apt install -y net-tools traceroute mtr nmap dnsutils \
                   curl wget whois telnet netcat tcpdump \
                   iproute2 wireless-tools network-manager

# RHEL / CentOS / Fedora
sudo dnf install -y net-tools traceroute mtr nmap bind-utils \
                   curl wget whois telnet nmap-ncat tcpdump \
                   iproute wireless-tools NetworkManager

# Arch Linux
sudo pacman -S net-tools traceroute mtr nmap dnsutils \
               curl wget whois inetutils gnu-netcat tcpdump \
               iproute2 wireless_tools networkmanager
```

---

## 🚀 Usage Examples

See [`commands.sh`](./commands.sh) for a runnable script with all commands demonstrated.

---

## 📝 Notes

- Commands marked ⚠️ as **deprecated** still work but are no longer maintained. Their modern replacements are preferred.
- Always use `sudo` when a command requires elevated privileges.
- For production environments, prefer `nmap` only on systems you own or have written permission to scan.
- `tcpdump` output can be opened in **Wireshark** for visual analysis.

---

*Day 4 of Linux Networking — Part of the Linux for DevOps/Networking series.*