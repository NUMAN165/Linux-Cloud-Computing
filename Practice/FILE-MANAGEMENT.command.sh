#!/bin/bash
# Navigate to /var/log
cd /var/log

# List files sorted by modification time
ls -lath /var/log | head -10

# Show oldest files first
ls -lrt

# ==========================================
# 2. FIND COMMANDS
# ==========================================

# Find log files modified within last 1 day
find /var/log -name '*.log' -mtime -1

# Find files larger than 100MB
find / -size +100M -type f 2>/dev/null

# Find .conf files modified within last 7 days
find /etc -name '*.conf' -mtime -7

# Count .conf files
find /etc -name '*.conf' | wc -l

# ==========================================
# 3. DU / DF COMMANDS
# ==========================================

# Show filesystem usage
 df -h

# Show directory usage
 du -sh /var/log/*

# Find largest directories under /var
 du -sh /var/* | sort -rh | head -5

# Find largest files recursively
 du -ah /var | sort -rh | head -10

# ==========================================
# 4. SYMBOLIC LINK COMMANDS
# ==========================================

# Create symbolic link
ln -s /opt/app/v2.1.0 /opt/app/current

# Verify symlink
ls -la /opt/app

# Remove symlink
rm /opt/app/current

# ==========================================
# 5. TREE COMMANDS
# ==========================================

# Show top 2 levels
 tree -L 2 /etc/nginx

# Show directories first
 tree -L 2 --dirsfirst /etc

# Show hidden files
 tree -a --dirsfirst /home/ubuntu

# Show only directories
 tree -d /etc

# ==========================================
# 6. TROUBLESHOOTING COMMANDS
# ==========================================

# Check deleted files still consuming disk
lsof | grep deleted

# ==========================================
# 7. INSTALL TREE COMMAND
# ==========================================

# Ubuntu / Debian
# sudo apt install tree

# Amazon Linux / RHEL
# sudo yum install tree

# ==========================================
# END
# ==========================================