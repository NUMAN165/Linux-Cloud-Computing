# Linux Filesystem Navigation & Disk Management Practice

This repository contains beginner-to-intermediate Linux commands commonly used in DevOps, Cloud Engineering, and System Administration.

Topics covered:

1. `ls` – List files and directories
2. `find` – Search files and directories
3. `du` / `df` – Disk usage analysis
4. `ln -s` – Symbolic links
5. `tree` – Visualize directory structures

---

# 📂 Repository Structure

```bash
.
├── README.md
└── commands.sh
```

---

# 1️⃣ LS Command

## Purpose

The `ls` command is used to list files and directories.

---

## Important Options

| Option | Meaning                   |
| ------ | ------------------------- |
| `-l`   | Long listing format       |
| `-a`   | Show hidden files         |
| `-h`   | Human readable sizes      |
| `-t`   | Sort by modification time |
| `-r`   | Reverse order             |

---

## Example Usage

```bash
ls -lah /etc/nginx/
```

---

## Practice Task

Navigate to `/var/log` and identify the 3 most recently modified log files.

### Commands

```bash
cd /var/log
ls -lath /var/log | head -10
```

---

# 2️⃣ FIND Command

## Purpose

The `find` command searches for files and directories based on:

* name
* size
* type
* permissions
* modification time

---

## Example Usage

### Find log files modified within 1 day

```bash
find /var/log -name '*.log' -mtime -1
```

### Find files larger than 100MB

```bash
find / -size +100M -type f 2>/dev/null
```

---

## Practice Task

Find all `.conf` files under `/etc` modified within the last 7 days.

### Command

```bash
find /etc -name '*.conf' -mtime -7
```

---

# 3️⃣ DU / DF Commands

## Purpose

### `df`

Shows filesystem disk usage.

### `du`

Shows file and directory disk usage.

---

## Example Usage

### Filesystem Usage

```bash
df -h
```

### Directory Usage

```bash
du -sh /var/log/*
```

---

## Practice Task

Find which directory under `/var` is consuming the most disk space.

### Command

```bash
du -sh /var/* | sort -rh | head -5
```

---

# 4️⃣ LN -S Command

## Purpose

The `ln -s` command creates symbolic (soft) links.

Commonly used for:

* deployments
* versioning
* config management
* shortcuts

---

## Example Usage

```bash
ln -s /etc/nginx/sites-available/myapp /etc/nginx/sites-enabled/myapp
```

---

## Practice Task

Create a symbolic link named `current` pointing to `/opt/app/v2.1.0`.

### Command

```bash
ln -s /opt/app/v2.1.0 /opt/app/current
```

---

## Verify Symlink

```bash
ls -la /opt/app
```

---

# 5️⃣ TREE Command

## Purpose

The `tree` command displays directory structures visually.

Useful for:

* project structure exploration
* configuration inspection
* deployment debugging

---

## Example Usage

```bash
tree -L 2 /etc/nginx
```

### Show Hidden Files

```bash
tree -a --dirsfirst /home/ubuntu
```

---

## Practice Task

Show the top 2 levels of `/etc` with directory-first ordering.

### Command

```bash
tree -L 2 --dirsfirst /etc
```

---

# 🔥 Useful Extra Commands

## Show largest files recursively

```bash
du -ah /var | sort -rh | head -10
```

---

## Show oldest files first

```bash
ls -lrt
```

---

## Count matching files

```bash
find /etc -name '*.conf' | wc -l
```

---

# ⚠️ Common Linux Troubleshooting Commands

## Check deleted files consuming disk space

```bash
lsof | grep deleted
```

---

## Install tree command

### Ubuntu / Debian

```bash
sudo apt install tree
```

### Amazon Linux / RHEL

```bash
sudo yum install tree
```

---

# 📘 Learning Outcomes

By practicing these commands, you will learn:

* Linux filesystem navigation
* Log analysis basics
* Disk space troubleshooting
* File searching techniques
* Symbolic link management
* Project structure visualization

---
