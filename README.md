# 🐧 Linux & Cloud Computing Mastery Workspace

Welcome to your central learning hub for **Linux Systems Administration**, **Shell Scripting**, and **Cloud Engineering Foundations**! 🚀

---

## 🎯 Why This Workspace Exists

In modern technology, **Linux is the bedrock of the Cloud**. Whether you are working with Virtual Machines (AWS EC2, GCP Compute Engine), containerized environments (Docker, Kubernetes), serverless computing, or Infrastructure as Code (Terrace/Ansible), they all run on or interact with Linux. 

This repository was systematically created to:
* **Build a strong foundation**: Move from absolute Linux basic commands to advanced system, file, user, and network management.
* **Practice Hands-On**: Move away from theoretical learning by executing real-world scripts, tasks, and scenarios.
* **Master Automation**: Build practical experience writing interactive and automated shell (`.sh`) scripts that perform system administration tasks.
* **Bridge the Gap to DevOps**: Gain the troubleshooting skills necessary to manage real cloud deployments, debug live application logs, manage security permissions, and analyze resource allocations.

---

## 📁 Repository Map

Here is the structural overview of your practice workspace:

```bash
Linux-Cloud-Computing/
├── 01-Basic-Linux/                  # Day 1: Foundational Linux utilities
│   ├── README.md                    # Concepts: Links, text processing, performance
│   └── commands01.sh                # Executable script demonstrating basic operations
│
├── 02-File-Management/              # Day 2: In-depth file & directory control
│   ├── README.md                    # Concepts: Navigation, searching, permissions, archiving
│   └── commands02.sh                # Safe interactive script showing file operations in /tmp
│
├── 03-Users-Groups_Management/      # Day 3: Administration, users, & groups
│   ├── README.md                    # Concepts: User accounts, privileges, system info, packages
│   └── commands03.sh                # Reference script for user, group, and apt management
│
├── 04-NetworkingCommands-for-linux/ # Day 4: Server communication & diagnostics
│   └── README.md                    # Concepts: IP config, diagnostic pinging, socket states, transfer
│
├── Practice/                        # Focused hands-on training challenges
│   ├── FILE-MANAGEMENT_PRAC.README.md # Exercise guide for search, disk, link, and tree tasks
│   └── FILE-MANAGEMENT.command.sh   # Direct practice commands to solve specific real-world tasks
│
└── README.md                        # Master workspace documentation (This File)
```

---

## 📘 Module Breakdown & Core Learnings

### 1️⃣ [01-Basic-Linux](file:///Users/numan/numan/Practice/Linux-Cloud-Computing/01-Basic-Linux)
Focuses on starting the Linux journey, executing standard text-processing utilities, and initial system checking.
* **Key Commands**: `tail -f` (real-time log tracking), `less` (scroll-friendly view), `cp -r` (recursive copy), `mv` (moving/renaming), `wc` (word and line count).
* **Core Concepts**:
  * Difference between **Hard Links** (`ln`) pointing to the direct inode, and **Soft (Symbolic) Links** (`ln -s`) serving as path shortcuts.
  * Text filtering with `cut`, combining outputs with `tee`, sorting with `sort`, and finding file changes with `diff`.
  * Performance monitoring using `df -h`, `top`, and `vmstat`.

### 2️⃣ [02-File-Management](file:///Users/numan/numan/Practice/Linux-Cloud-Computing/02-File-Management)
An extensive guide to navigating the file system, handling paths, setting access levels, and packing files.
* **Key Commands**: `touch`, `mkdir -p` (nested folder creation), `head`, `tail`, `rsync` (backup synchronization), `rm -rf` (recursive force deletion).
* **Core Concepts**:
  * **File Permissions**: Reading octal/numeric representation of read, write, and execute permissions (e.g., `chmod 754` -> `rwxr-xr--`) for owner, group, and others.
  * **Searching & Finding**: Combining `find` filters (by name, modification time `mtime`, or size) and running powerful recursive text searches using `grep -r`.
  * **Compression & Archiving**: Packing directories recursively using `tar -czf` and extracting with `tar -xzf`.

### 3️⃣ [03-Users-Groups_Management](file:///Users/numan/numan/Practice/Linux-Cloud-Computing/03-Users-Groups_Management)
Focuses on system administration, permissions escalation, package installs, and configuration database files.
* **Key Commands**: `uname -a` (kernel details), `whoami`, `id`, `useradd -m`, `passwd`, `usermod -aG` (group assignment), `apt` (package utility).
* **Core Concepts**:
  * User storage configuration databases `/etc/passwd` (accounts metadata) and `/etc/shadow` (secure hashed password storage).
  * Group organization database `/etc/group`.
  * Proper permission usage via `sudo` to safely manage accounts and delete resources using `userdel -r`.

### 4️⃣ [04-NetworkingCommands-for-linux](file:///Users/numan/numan/Practice/Linux-Cloud-Computing/04-NetworkingCommands-for-linux)
Focuses on network verification, ports administration, DNS resolution, and interface diagnostics.
* **Key Commands**: `ip addr` (checking network interface), `ping`, `traceroute`, `dig` (highly-detailed DNS checks), `ss -tunlp` (active listening sockets), `lsof -i`, `nc` (port reachability), `curl` / `wget` (remote data transmission).
* **Core Concepts**:
  * Troubleshooting connectivity barriers between web servers and databases.
  * Monitoring active sockets and mapping running services to their respective ports.

### 5️⃣ [Practice Challenges](file:///Users/numan/numan/Practice/Linux-Cloud-Computing/Practice)
Contains focused practice challenges testing troubleshooting speeds and real-world system admin tasks.
* **Exercise Highlights**:
  * Log scanning inside `/var/log` to find the most recently modified files.
  * Locating massive files over `100MB` on the root disk and finding `.conf` files.
  * Disk usage troubleshooting using `du -sh` and sorting folders by space consumption.
  * Simulating production hot-swaps using symbolic links.
  * Generating formatted system structures using `tree`.

---

## ⚡ How to Run the Demonstration Scripts

Most scripts in this repository are safe to run and contain comments describing exactly what they do.

> [!NOTE]
> Some scripts perform operations inside your `/tmp` directory to prevent cluttered workspaces, while others show commands that require `sudo` privileges. 

### To run basic operations script:
```bash
cd 01-Basic-Linux
bash commands01.sh
```

### To run the interactive, self-cleaning File Management Demo:
```bash
cd 02-File-Management
bash commands02.sh
```
*This script will create a dummy directory under `/tmp/linux_file_demo`, perform copies, moves, permission changes, grep searches, compression tests, and clean up after itself completely!*

### To run the system level and user/group reference:
```bash
cd 03-Users-Groups_Management
bash commands03.sh
```
*This script lists the safe system configuration information (such as kernel version and local user/group accounts) and prints educational templates for user management commands that require root authority.*

### To run practice challenges:
```bash
cd Practice
bash FILE-MANAGEMENT.command.sh
```

---

## 📅 Roadmap to Cloud Engineering Mastery

Below is the structured roadmap for this workspace as you progress from Linux basics to cloud deployments:

- [x] **Phase 1: Foundations** — Basic command syntax, pipelines, text editing, and linking.
- [x] **Phase 2: File Management & Systems** — Searching logs, reading disk size, managing permissions, and compression.
- [x] **Phase 3: Security & Administration** — Users, user privileges, root escalation, group scopes, and application installation.
- [x] **Phase 4: Networking & Diagnostics** — Ports diagnostics, server-to-server reachability, DNS queries, and request handling.
- [ ] **Phase 5: Shell Scripting & Automation** — Writing variables, conditions, loops, and robust error-catching scripts to automate daily operational tasks.
- [ ] **Phase 6: Cloud Deployment & Containers** — Launching EC2 instances, deploying Nginx, configuring SSH keys, installing Docker, and automating setup using User Data scripts.

> [!TIP]
> **Best Practice for Learning**: Always try to run commands manually in your terminal before automating them. Use `man <command>` or `<command> --help` to read detailed descriptions of any flags you do not understand!

---
*Happy Command Line Journey! Keep hacking, automating, and building!* 🐧☁️
