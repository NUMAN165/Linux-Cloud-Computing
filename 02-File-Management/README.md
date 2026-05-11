# File Management in Linux — Command Reference

A practical guide to navigating, creating, viewing, editing, copying, moving, and managing files and directories in Linux.

---

## Navigation Commands

| Command | Description |
|---------|-------------|
| `pwd` | Print Working Directory — shows your current location in the filesystem |
| `ls` | List files and directories in the current directory |
| `cd` | Change Directory — navigate to a different folder |
| `tree` | Display directory structure in a tree format |

---

## File & Directory Creation

| Command | Description |
|---------|-------------|
| `touch` | Create a new empty file (or update timestamp of existing file) |
| `mkdir` | Make a new directory |
| `mkdir -p` | Create nested directories in one command |

---

## Viewing File Content

| Command | Description |
|---------|-------------|
| `cat` | Display the full content of a file |
| `less` | View file content page by page (scroll-friendly) |
| `more` | Similar to `less` but only scrolls forward |
| `head` | Show the first 10 lines of a file |
| `tail` | Show the last 10 lines of a file |
| `tail -f` | Follow a file in real time (great for logs) |

---

## Copying, Moving & Renaming

| Command | Description |
|---------|-------------|
| `cp` | Copy a file or directory |
| `mv` | Move or rename a file or directory |
| `rsync` | Sync files/directories efficiently (great for backups) |

---

## Deleting Files & Directories

| Command | Description |
|---------|-------------|
| `rm` | Remove a file |
| `rm -r` | Remove a directory and its contents recursively |
| `rm -rf` | Force remove without prompts — use with extreme caution |
| `rmdir` | Remove an empty directory |

---

## File Permissions

| Command | Description |
|---------|-------------|
| `chmod` | Change file permissions (read/write/execute) |
| `chown` | Change file owner and group |
| `ls -l` | View detailed listing including permissions |

### Permission Notation

```
-rwxr-xr--
 ||| ||| |||
 ||| ||| ||+-- others: read only
 ||| |||+--- others: no write
 ||| ||+---- others: no execute
 ||| |+----- group: read only
 ||| +------ group: no write
 ||+-------- group: execute
 |+--------- owner: write
 +---------- owner: read + execute
```

### chmod Numeric Mode

| Number | Permission |
|--------|------------|
| `7` | rwx (read + write + execute) |
| `6` | rw- (read + write) |
| `5` | r-x (read + execute) |
| `4` | r-- (read only) |
| `0` | --- (no permission) |

---

## Searching & Finding Files

| Command | Description |
|---------|-------------|
| `find` | Search for files by name, type, size, etc. |
| `locate` | Quickly find files using a pre-built index |
| `grep` | Search for text patterns inside files |
| `grep -r` | Recursively search through directories |

---

## File Information

| Command | Description |
|---------|-------------|
| `file` | Identify the type of a file |
| `stat` | Detailed file metadata (size, permissions, timestamps) |
| `du` | Disk Usage — show size of files/directories |
| `df` | Disk Free — show available disk space on filesystems |
| `wc` | Word count — count lines, words, and characters in a file |

---

## Compression & Archiving

| Command | Description |
|---------|-------------|
| `tar -czf` | Create a compressed `.tar.gz` archive |
| `tar -xzf` | Extract a `.tar.gz` archive |
| `zip` | Compress files into a `.zip` archive |
| `unzip` | Extract a `.zip` archive |
| `gzip` | Compress a file using gzip |
| `gunzip` | Decompress a `.gz` file |

---

## Linking Files

| Command | Description |
|---------|-------------|
| `ln` | Create a hard link to a file |
| `ln -s` | Create a symbolic (soft) link to a file or directory |

---

## Usage Examples

### Navigation

```bash
# Show current directory
pwd

# List files (basic)
ls

# List with details and hidden files
ls -la

# Change to home directory
cd ~

# Go up one level
cd ..

# Go to a specific path
cd /var/log

# Show directory tree
tree
tree -L 2        # limit depth to 2 levels
```

### Creating Files & Directories

```bash
# Create an empty file
touch notes.txt

# Create multiple files at once
touch file1.txt file2.txt file3.txt

# Create a directory
mkdir projects

# Create nested directories
mkdir -p projects/linux/scripts
```

### Viewing Files

```bash
# Print file content
cat notes.txt

# View large files page by page
less notes.txt

# First 10 lines
head notes.txt

# Last 10 lines
tail notes.txt

# Last 20 lines
tail -n 20 notes.txt

# Follow log file in real time
tail -f /var/log/syslog
```

### Copying & Moving

```bash
# Copy a file
cp file1.txt file2.txt

# Copy into a directory
cp file1.txt /home/user/backup/

# Copy a directory recursively
cp -r myfolder/ /home/user/backup/

# Move (or rename) a file
mv oldname.txt newname.txt

# Move file to another directory
mv file1.txt /tmp/
```

### Deleting

```bash
# Delete a file
rm notes.txt

# Delete a directory and its contents
rm -r myfolder/

# Force delete without confirmation (careful!)
rm -rf myfolder/

# Delete an empty directory
rmdir emptyfolder/
```

### Permissions

```bash
# Make a script executable
chmod +x script.sh

# Set specific permissions (owner=rwx, group=r-x, others=r--)
chmod 754 script.sh

# Change owner of a file
sudo chown john file.txt

# Change owner and group
sudo chown john:developers file.txt

# View permissions
ls -l file.txt
```

### Searching

```bash
# Find a file by name
find /home -name "notes.txt"

# Find all .sh files
find . -name "*.sh"

# Find files modified in last 7 days
find . -mtime -7

# Search for a word inside a file
grep "error" logfile.txt

# Case-insensitive search
grep -i "error" logfile.txt

# Search recursively in all files
grep -r "TODO" ./projects/
```

### File Info & Disk Usage

```bash
# Identify file type
file notes.txt

# Show detailed metadata
stat notes.txt

# Show size of a directory
du -sh myfolder/

# Show disk usage of all mounted filesystems
df -h

# Count lines, words, characters
wc notes.txt
wc -l notes.txt    # lines only
```

### Compression

```bash
# Create a tar.gz archive
tar -czf archive.tar.gz myfolder/

# Extract a tar.gz archive
tar -xzf archive.tar.gz

# Zip a file
zip myarchive.zip file1.txt file2.txt

# Unzip
unzip myarchive.zip

# Compress with gzip
gzip file.txt

# Decompress
gunzip file.txt.gz
```

### Linking

```bash
# Create a symbolic link
ln -s /path/to/original /path/to/link

# Example: link a config file
ln -s /etc/nginx/sites-available/mysite /etc/nginx/sites-enabled/mysite
```

---

## Key Flags Quick Reference

| Flag | Used With | Meaning |
|------|-----------|---------|
| `-l` | `ls` | Long/detailed listing |
| `-a` | `ls` | Show hidden files (starting with `.`) |
| `-r` | `cp`, `rm` | Recursive (include subdirectories) |
| `-f` | `rm` | Force (no confirmation prompts) |
| `-p` | `mkdir` | Create parent directories as needed |
| `-h` | `du`, `df` | Human-readable sizes (KB, MB, GB) |
| `-i` | `grep` | Case-insensitive search |
| `-n` | `tail`, `head` | Specify number of lines |
| `-s` | `ln` | Create symbolic (soft) link |
| `-z` | `tar` | Use gzip compression |
| `-c` | `tar` | Create archive |
| `-x` | `tar` | Extract archive |
| `-f` | `tar` | Specify archive filename |

---

## Important Paths

| Path | Purpose |
|------|---------|
| `/` | Root of the filesystem |
| `/home/username` | User's home directory |
| `/etc` | System configuration files |
| `/var/log` | Log files |
| `/tmp` | Temporary files (cleared on reboot) |
| `/usr/bin` | User-installed binaries |
| `/bin` | Essential system binaries |

---

## Notes

- `rm -rf` is irreversible — always double-check before running.
- Use `ls -la` to see hidden files (those starting with `.`).
- `chmod 777` gives everyone full access — avoid in production.
- Prefer `less` over `cat` for large files.
- `tail -f` is extremely useful for monitoring live log files.