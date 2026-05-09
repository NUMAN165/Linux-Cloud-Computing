# Users and Group Management — Linux Command Reference

A practical guide to system-level commands and user/group management on Linux.

---

## System Level Commands

| Command | Description |
|---------|-------------|
| `uname` | Displays the operating system name (e.g., `Linux`, `Darwin` on macOS) |
| `uptime` | Shows how long the system has been running since last boot |
| `date` | Prints the current date and time |
| `whoami` | Displays the currently logged-in username |
| `apt` | Package manager for Debian/Ubuntu-based Linux distributions |
| `which` | Shows the full path of where a program/binary is installed |
| `shutdown` | Shuts down the system (requires sudo) |
| `reboot` | Restarts the system (requires sudo) |
| `id` | Displays the current user's UID (user ID) and GID (group ID) |

---

## Users and Group Management Commands

| Command | Description |
|---------|-------------|
| `useradd` | Adds a new user. Use `-m` flag to auto-create a home directory |
| `passwd` | Sets or updates the password for a user |
| `su` | Switches to another user account |
| `userdel` | Deletes a user from the system |
| `groupadd` | Creates a new group |
| `groupdel` | Deletes an existing group |

> **Note:** All user and group management commands require `sudo` (superuser) privileges.

---

## Usage Examples

### System Commands

```bash
# Check OS type
uname

# Check full OS info
uname -a

# See system uptime
uptime

# Print current date
date

# Check current user
whoami

# Check user and group IDs
id

# Find where Python is installed
which python3

# Install a package (e.g., curl)
sudo apt install curl

# Shutdown immediately
sudo shutdown now

# Reboot the system
sudo reboot
```

### User Management

```bash
# Add a new user with home directory
sudo useradd -m username

# Set password for a user
sudo passwd username

# Switch to another user
su username

# Switch to root user
su -

# Delete a user (keeps home directory)
sudo userdel username

# Delete a user AND their home directory
sudo userdel -r username
```

### Group Management

```bash
# Create a new group
sudo groupadd groupname

# Delete a group
sudo groupdel groupname

# Add an existing user to a group
sudo usermod -aG groupname username

# View all groups
cat /etc/group
```

---

## Key Flags

| Flag | Command | Meaning |
|------|---------|---------|
| `-m` | `useradd` | Create home directory for the new user |
| `-r` | `userdel` | Remove home directory along with the user |
| `-a` | `usermod` | Append (do not remove from other groups) |
| `-G` | `usermod` | Specify supplementary group(s) |
| `-a` | `uname` | Display all system information |

---

## Important Files

| File | Purpose |
|------|---------|
| `/etc/passwd` | Stores user account information |
| `/etc/shadow` | Stores encrypted user passwords |
| `/etc/group` | Stores group information |
| `/home/username` | Default home directory for a user |

---

## Notes

- Always use `sudo` before user/group management commands.
- The `-m` flag in `useradd -m` ensures the new user gets their own home directory (e.g., `/home/username`).
- `su` without a username switches to the root user.
- `userdel -r` permanently removes the user's home directory — use with caution.