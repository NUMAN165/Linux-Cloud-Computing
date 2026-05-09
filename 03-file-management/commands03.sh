
#!/bin/bash

# =============================================================================
# Users and Group Management - Linux Command Reference Script
# =============================================================================
# This script demonstrates system-level and user/group management commands.
# Most user/group commands require sudo privileges.
# Usage: bash command.sh
# =============================================================================

echo "============================================="
echo "   SYSTEM LEVEL COMMANDS"
echo "============================================="

# uname - show operating system name
echo ""
echo ">> uname : Operating system name"
uname

# uname -a - full system info
echo ""
echo ">> uname -a : Full system information"
uname -a

# uptime - how long system has been running
echo ""
echo ">> uptime : System uptime"
uptime

# date - current date and time
echo ""
echo ">> date : Current date and time"
date

# whoami - current logged-in user
echo ""
echo ">> whoami : Current user"
whoami

# id - user ID and group ID
echo ""
echo ">> id : User ID and Group ID"
id

# which - where is a binary installed
echo ""
echo ">> which bash : Location of bash"
which bash

echo ""
echo ">> which python3 : Location of python3"
which python3 2>/dev/null || echo "python3 not found"

echo ""
echo "============================================="
echo "   USER MANAGEMENT COMMANDS"
echo "============================================="

# ------------------------------------------------------------------
# NOTE: The following commands require sudo.
# They are printed as examples but NOT auto-executed to avoid
# unintended changes on your system.
# Uncomment the lines below to run them.
# ------------------------------------------------------------------

NEW_USER="demouser"
NEW_GROUP="demogroup"

echo ""
echo ">> [INFO] The following commands require sudo."
echo "   Uncomment in the script to execute them."
echo ""

# useradd - add a new user with home directory
echo "# Add new user with home directory:"
echo "  sudo useradd -m $NEW_USER"
# sudo useradd -m "$NEW_USER"

# passwd - set password for the user
echo ""
echo "# Set password for user:"
echo "  sudo passwd $NEW_USER"
# sudo passwd "$NEW_USER"

# su - switch user
echo ""
echo "# Switch to user:"
echo "  su $NEW_USER"
# su "$NEW_USER"

# userdel - delete a user (keep home directory)
echo ""
echo "# Delete user (keep home directory):"
echo "  sudo userdel $NEW_USER"
# sudo userdel "$NEW_USER"

# userdel -r - delete user AND home directory
echo ""
echo "# Delete user AND home directory:"
echo "  sudo userdel -r $NEW_USER"
# sudo userdel -r "$NEW_USER"

echo ""
echo "============================================="
echo "   GROUP MANAGEMENT COMMANDS"
echo "============================================="

# groupadd - create a new group
echo ""
echo "# Create a new group:"
echo "  sudo groupadd $NEW_GROUP"
# sudo groupadd "$NEW_GROUP"

# Add user to group
echo ""
echo "# Add user to group:"
echo "  sudo usermod -aG $NEW_GROUP $NEW_USER"
# sudo usermod -aG "$NEW_GROUP" "$NEW_USER"

# groupdel - delete a group
echo ""
echo "# Delete a group:"
echo "  sudo groupdel $NEW_GROUP"
# sudo groupdel "$NEW_GROUP"

echo ""
echo "============================================="
echo "   VIEWING SYSTEM USER/GROUP INFO"
echo "============================================="

# List all users
echo ""
echo ">> All users on this system (from /etc/passwd):"
cut -d: -f1 /etc/passwd

# List all groups
echo ""
echo ">> All groups on this system (from /etc/group):"
cut -d: -f1 /etc/group

# Current user's groups
echo ""
echo ">> Groups the current user belongs to:"
groups

echo ""
echo "============================================="
echo "   PACKAGE MANAGER (apt) - INFO"
echo "============================================="

echo ""
echo "# Update package list:"
echo "  sudo apt update"

echo ""
echo "# Install a package (e.g., curl):"
echo "  sudo apt install curl"

echo ""
echo "# Remove a package:"
echo "  sudo apt remove curl"

echo ""
echo "# Search for a package:"
echo "  apt search <package-name>"

echo ""
echo "============================================="
echo "   SHUTDOWN & REBOOT - INFO"
echo "============================================="

echo ""
echo "# Shutdown immediately:"
echo "  sudo shutdown now"

echo ""
echo "# Shutdown after 5 minutes:"
echo "  sudo shutdown +5"

echo ""
echo "# Reboot the system:"
echo "  sudo reboot"

echo ""
echo "============================================="
echo "   Script complete!"
echo "============================================="