#!/bin/bash

# =============================================================================
#  Day 4 — Linux Networking Commands
#  A comprehensive reference script for Linux networking tools
#  Usage: bash commands.sh [section]
#  Author: Linux Networking Series
# =============================================================================

# ── Colors ────────────────────────────────────────────────────────────────────
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
CYAN='\033[0;36m'
BLUE='\033[0;34m'
BOLD='\033[1m'
RESET='\033[0m'

# ── Helpers ───────────────────────────────────────────────────────────────────
section() { echo -e "\n${BOLD}${BLUE}════════════════════════════════════════${RESET}"; \
            echo -e "${BOLD}${CYAN}  $1${RESET}"; \
            echo -e "${BOLD}${BLUE}════════════════════════════════════════${RESET}"; }

cmd()     { echo -e "${GREEN}▶ Running:${RESET} ${YELLOW}$1${RESET}"; }
info()    { echo -e "${CYAN}ℹ  $1${RESET}"; }
warn()    { echo -e "${RED}⚠  $1${RESET}"; }
note()    { echo -e "${BOLD}📌 Note:${RESET} $1"; }

# ── Default target host ───────────────────────────────────────────────────────
TARGET="${1:-google.com}"
TARGET_IP="8.8.8.8"
INTERFACE=$(ip route get 1.1.1.1 2>/dev/null | awk '{print $5; exit}')
INTERFACE="${INTERFACE:-eth0}"

echo -e "\n${BOLD}${CYAN}🌐  Linux Networking Commands — Day 4${RESET}"
echo -e "    Target Host : ${YELLOW}${TARGET}${RESET}"
echo -e "    Interface   : ${YELLOW}${INTERFACE}${RESET}"
echo -e "    Date        : $(date)"


# =============================================================================
# SECTION 1: ping
# =============================================================================
section "1. ping — Test Host Reachability"
info "Sends ICMP echo requests to check if a host is up and measure latency."

cmd "ping -c 4 $TARGET"
ping -c 4 "$TARGET" 2>/dev/null || warn "ping failed — host may be unreachable or ICMP blocked."

echo ""
cmd "ping -c 2 -i 0.5 $TARGET_IP   (Fast ping with 0.5s interval)"
ping -c 2 -i 0.5 "$TARGET_IP" 2>/dev/null || warn "ping to IP failed."

note "Use -c to limit count, -i for interval, -s to set packet size."


# =============================================================================
# SECTION 2: ip — Modern Network Configuration
# =============================================================================
section "2. ip — Modern Network Configuration (iproute2)"
info "Replaces ifconfig and route. The standard tool on all modern Linux systems."

cmd "ip addr show"
ip addr show 2>/dev/null || warn "ip command not found. Install: sudo apt install iproute2"

echo ""
cmd "ip link show"
ip link show 2>/dev/null

echo ""
cmd "ip route show"
ip route show 2>/dev/null

note "Preferred over ifconfig/route on all modern distros."


# =============================================================================
# SECTION 3: ifconfig — Interface Configuration (Legacy)
# =============================================================================
section "3. ifconfig — Network Interface Configuration (Legacy)"
warn "ifconfig is deprecated. Use 'ip addr' instead."
info "Part of net-tools package. Shows IP, MAC, RX/TX stats per interface."

cmd "ifconfig 2>/dev/null || ip addr show (fallback)"
if command -v ifconfig &>/dev/null; then
    ifconfig 2>/dev/null
else
    warn "ifconfig not found. Falling back to: ip addr show"
    ip addr show
fi

note "Install net-tools if needed: sudo apt install net-tools"


# =============================================================================
# SECTION 4: ss — Socket Statistics (Modern netstat)
# =============================================================================
section "4. ss — Socket Statistics"
info "Fast, modern replacement for netstat. Shows TCP/UDP connections and listening ports."

cmd "ss -tuln   (listening TCP/UDP ports)"
ss -tuln 2>/dev/null || warn "ss not available."

echo ""
cmd "ss -s   (summary statistics)"
ss -s 2>/dev/null

echo ""
cmd "ss -tnp | head -20   (connections with process names)"
ss -tnp 2>/dev/null | head -20

note "Use 'ss -tnp | grep :80' to find what's occupying a specific port."


# =============================================================================
# SECTION 5: netstat — Network Statistics (Legacy)
# =============================================================================
section "5. netstat — Network Statistics (Legacy)"
warn "netstat is deprecated. Use 'ss' instead."
info "Displays connections, routing table, interface stats."

cmd "netstat -tuln 2>/dev/null || ss -tuln (fallback)"
if command -v netstat &>/dev/null; then
    netstat -tuln 2>/dev/null
else
    warn "netstat not found. Using ss fallback:"
    ss -tuln
fi


# =============================================================================
# SECTION 6: traceroute / tracepath — Route Tracing
# =============================================================================
section "6. traceroute / tracepath — Trace Network Path"
info "Shows each router (hop) packets pass through to reach destination."

cmd "traceroute -m 10 $TARGET   (max 10 hops)"
if command -v traceroute &>/dev/null; then
    traceroute -m 10 "$TARGET" 2>/dev/null || warn "traceroute failed."
else
    warn "traceroute not found. Install: sudo apt install traceroute"
fi

echo ""
cmd "tracepath $TARGET"
if command -v tracepath &>/dev/null; then
    tracepath "$TARGET" 2>/dev/null &
    TPID=$!
    sleep 5
    kill $TPID 2>/dev/null
    echo "(output truncated after 5s)"
else
    warn "tracepath not found."
fi

note "tracepath doesn't need root and reports MTU at each hop."


# =============================================================================
# SECTION 7: mtr — My Traceroute (ping + traceroute)
# =============================================================================
section "7. mtr — Real-Time Network Diagnostics"
info "Combines ping + traceroute. Provides live statistics per hop."

cmd "mtr --report --report-cycles 5 $TARGET"
if command -v mtr &>/dev/null; then
    mtr --report --report-cycles 5 "$TARGET" 2>/dev/null || warn "mtr failed."
else
    warn "mtr not found. Install: sudo apt install mtr"
fi

note "Run 'mtr google.com' for live interactive mode."


# =============================================================================
# SECTION 8: nslookup — DNS Lookup (Basic)
# =============================================================================
section "8. nslookup — DNS Lookup"
info "Queries DNS to resolve domain names. Interactive or one-shot mode."

cmd "nslookup $TARGET"
nslookup "$TARGET" 2>/dev/null || warn "nslookup not found. Install: sudo apt install dnsutils"

echo ""
cmd "nslookup -type=MX gmail.com"
nslookup -type=MX gmail.com 2>/dev/null || true

note "Use '-type=A/MX/NS/TXT/CNAME' to query specific record types."


# =============================================================================
# SECTION 9: dig — Advanced DNS Queries
# =============================================================================
section "9. dig — Advanced DNS Querying Tool"
info "More powerful and scriptable than nslookup. Preferred for DNS debugging."

cmd "dig $TARGET"
if command -v dig &>/dev/null; then
    dig "$TARGET" 2>/dev/null

    echo ""
    cmd "dig +short $TARGET   (just the IPs)"
    dig +short "$TARGET" 2>/dev/null

    echo ""
    cmd "dig $TARGET MX   (mail exchange records)"
    dig "$TARGET" MX +short 2>/dev/null

    echo ""
    cmd "dig -x $TARGET_IP   (reverse DNS lookup)"
    dig -x "$TARGET_IP" +short 2>/dev/null
else
    warn "dig not found. Install: sudo apt install dnsutils"
fi

note "Use '@8.8.8.8' to query a specific DNS server: dig @8.8.8.8 google.com"


# =============================================================================
# SECTION 10: hostname — System Hostname
# =============================================================================
section "10. hostname — Display / Set System Hostname"
info "Shows the machine's hostname and associated IP addresses."

cmd "hostname"
hostname

echo ""
cmd "hostname -I   (all IP addresses)"
hostname -I 2>/dev/null

echo ""
cmd "hostname -f   (fully qualified domain name)"
hostname -f 2>/dev/null || warn "FQDN not configured."

note "To permanently set hostname: hostnamectl set-hostname new-name"


# =============================================================================
# SECTION 11: telnet — TCP Port Connectivity Test
# =============================================================================
section "11. telnet — Test TCP Port Connectivity"
warn "Do NOT use telnet for remote login — it's unencrypted. Use SSH instead."
info "Useful only for testing if a specific TCP port is open."

cmd "telnet $TARGET 80   (test HTTP port — times out after 3s)"
if command -v telnet &>/dev/null; then
    echo "quit" | timeout 3 telnet "$TARGET" 80 2>/dev/null \
        && echo "(Port 80 is open)" \
        || warn "Connection failed or timed out."
else
    warn "telnet not found. Install: sudo apt install telnet"
    info "Alternative: nc -zv $TARGET 80"
fi

note "Better alternatives: 'nc -zv host port' or 'curl -I http://host'"


# =============================================================================
# SECTION 12: iwconfig — Wireless Interface Config (Legacy)
# =============================================================================
section "12. iwconfig — Wireless Interface Configuration (Legacy)"
warn "iwconfig is deprecated. Use 'iw' or 'nmcli' instead."
info "Shows wireless interface details: SSID, frequency, signal strength."

cmd "iwconfig 2>/dev/null"
if command -v iwconfig &>/dev/null; then
    iwconfig 2>/dev/null || info "No wireless interfaces found (common in VMs/servers)."
else
    warn "iwconfig not found. Install: sudo apt install wireless-tools"
fi

echo ""
cmd "iw dev   (modern alternative)"
iw dev 2>/dev/null || info "iw command not available."

note "For WiFi management: nmcli device wifi list"


# =============================================================================
# SECTION 13: arp — Address Resolution Protocol
# =============================================================================
section "13. arp — ARP Cache (IP ↔ MAC Address Mapping)"
info "Shows the ARP table: maps IP addresses to hardware (MAC) addresses on the LAN."

cmd "arp -a   (show all entries)"
if command -v arp &>/dev/null; then
    arp -a 2>/dev/null || warn "No ARP entries found."
else
    warn "arp not found. Install: sudo apt install net-tools"
    info "Modern alternative: ip neigh show"
fi

echo ""
cmd "ip neigh show   (modern ARP equivalent)"
ip neigh show 2>/dev/null || true

note "ARP only works within the local network segment."


# =============================================================================
# SECTION 14: whois — Domain / IP Ownership Info
# =============================================================================
section "14. whois — Domain Registration & IP Ownership"
info "Queries WHOIS databases for registrant, nameservers, and expiry dates."

cmd "whois $TARGET"
if command -v whois &>/dev/null; then
    whois "$TARGET" 2>/dev/null | head -30
    echo "... (output truncated)"
else
    warn "whois not found. Install: sudo apt install whois"
fi


# =============================================================================
# SECTION 15: curl — HTTP Client / API Tool
# =============================================================================
section "15. curl — HTTP Requests & API Calls"
info "Transfers data using HTTP, HTTPS, FTP and more. Essential for APIs."

cmd "curl -I https://$TARGET   (headers only)"
curl -I --max-time 5 "https://$TARGET" 2>/dev/null || warn "curl request failed."

echo ""
cmd "curl -s https://ipinfo.io/json   (check your public IP)"
curl -s --max-time 5 "https://ipinfo.io/json" 2>/dev/null | python3 -m json.tool 2>/dev/null \
    || curl -s --max-time 5 "https://ipinfo.io/json" 2>/dev/null || warn "Request failed."

echo ""
cmd "curl -o /dev/null -w '%{http_code}' https://$TARGET   (check HTTP status code)"
STATUS=$(curl -o /dev/null -s --max-time 5 -w '%{http_code}' "https://$TARGET" 2>/dev/null)
echo "HTTP Status: $STATUS"

note "Common flags: -X POST, -H 'Header: val', -d '{json}', -L (follow redirects), -v (verbose)"


# =============================================================================
# SECTION 16: wget — File Downloader
# =============================================================================
section "16. wget — Download Files from the Internet"
info "Non-interactive downloader for HTTP, HTTPS, and FTP."

cmd "wget --spider https://$TARGET   (check URL without downloading)"
if command -v wget &>/dev/null; then
    wget --spider --timeout=5 "https://$TARGET" 2>&1 | grep -E "HTTP|resolved|connected" || true
else
    warn "wget not found. Install: sudo apt install wget"
fi

note "To download: wget https://example.com/file.zip"
note "Resume download: wget -c https://example.com/largefile.iso"
note "Background download: wget -b https://example.com/file"


# =============================================================================
# SECTION 17: route — Routing Table (Legacy)
# =============================================================================
section "17. route — IP Routing Table (Legacy)"
warn "route is deprecated. Use 'ip route' instead."
info "Displays and modifies the kernel IP routing table."

cmd "route -n 2>/dev/null || ip route show"
if command -v route &>/dev/null; then
    route -n 2>/dev/null
else
    warn "route not found. Falling back to: ip route show"
    ip route show
fi

note "Add default gateway: ip route add default via 192.168.1.1"
note "Add static route:    ip route add 10.0.0.0/8 via 192.168.1.1"


# =============================================================================
# SECTION 18: nmap — Network Scanner
# =============================================================================
section "18. nmap — Network Exploration & Port Scanner"
warn "Only scan networks/hosts you own or have explicit permission to scan."
info "Discovers hosts, open ports, services, and OS on a network."

LOCAL_NET=$(ip route | grep -oP '(\d{1,3}\.){3}0/\d+' | head -1)

cmd "nmap -sn $LOCAL_NET   (ping scan — discover live hosts)"
if command -v nmap &>/dev/null; then
    nmap -sn "${LOCAL_NET:-192.168.1.0/24}" 2>/dev/null | grep -E "Nmap|Host" | head -20 || true

    echo ""
    cmd "nmap -p 22,80,443 $TARGET_IP   (scan common ports)"
    nmap -p 22,80,443 "$TARGET_IP" 2>/dev/null || warn "nmap scan failed."
else
    warn "nmap not found. Install: sudo apt install nmap"
fi

note "Aggressive scan (OS + version detection): nmap -A 192.168.1.1"
note "Scan all ports: nmap -p- 192.168.1.1"


# =============================================================================
# BONUS SECTION: nc (netcat), tcpdump, nmcli, ssh
# =============================================================================
section "BONUS — Additional Essential Tools"

# nc / netcat
echo -e "\n${BOLD}nc (netcat) — TCP/UDP Swiss Army Knife${RESET}"
info "Tests port connectivity, transfers files, creates raw connections."
cmd "nc -zv $TARGET 80   (test if port 80 is open)"
if command -v nc &>/dev/null; then
    nc -zv "$TARGET" 80 2>&1 | head -3 || true
elif command -v ncat &>/dev/null; then
    ncat -zv "$TARGET" 80 2>&1 | head -3 || true
else
    warn "nc not found. Install: sudo apt install netcat"
fi

# tcpdump
echo -e "\n${BOLD}tcpdump — Packet Capture${RESET}"
info "Captures live network traffic. Use Wireshark to analyze .pcap files."
cmd "tcpdump -i $INTERFACE -c 10 2>/dev/null   (capture 10 packets)"
if command -v tcpdump &>/dev/null; then
    sudo timeout 5 tcpdump -i "$INTERFACE" -c 10 2>/dev/null \
        || warn "tcpdump needs root (sudo) or packet capture capability."
else
    warn "tcpdump not found. Install: sudo apt install tcpdump"
fi

# nmcli
echo -e "\n${BOLD}nmcli — NetworkManager CLI${RESET}"
info "Modern tool to manage WiFi, Ethernet, and VPN connections."
cmd "nmcli device status"
if command -v nmcli &>/dev/null; then
    nmcli device status 2>/dev/null || true
else
    warn "nmcli not found. Install: sudo apt install network-manager"
fi

# ssh
echo -e "\n${BOLD}ssh — Secure Shell${RESET}"
info "Encrypted remote login. Always prefer SSH over telnet."
cmd "ssh -V   (show version)"
ssh -V 2>&1 || warn "ssh not found."
note "Connect: ssh user@192.168.1.10"
note "Use key auth: ssh -i ~/.ssh/id_rsa user@host"


# =============================================================================
# SUMMARY
# =============================================================================
section "📋 Summary — Command Availability on This System"

TOOLS=(ping ip ifconfig ss netstat traceroute tracepath mtr
       nslookup dig hostname telnet iwconfig arp whois
       curl wget route nmap nc tcpdump nmcli ssh)

echo -e "  $( printf '%-15s' 'Command') Status"
echo -e "  $( printf '%-15s' '-------') ------"
for tool in "${TOOLS[@]}"; do
    if command -v "$tool" &>/dev/null; then
        echo -e "  ${GREEN}✔${RESET} $(printf '%-15s' "$tool") $(command -v "$tool")"
    else
        echo -e "  ${RED}✘${RESET} $(printf '%-15s' "$tool") not installed"
    fi
done

echo -e "\n${BOLD}${GREEN}✅  Day 4 Networking Commands demo complete!${RESET}"
echo -e "    See README.md for full documentation and examples.\n"