# 🐧 Linux Mastery for Cloud Engineering

## 📌 Overview

This repository documents my structured journey to mastering **Linux fundamentals** as a foundation for becoming a **Cloud Engineer**.

Instead of just learning commands, I focus on:

* Understanding **why** each command is used
* Practicing **real-world scenarios**
* Documenting learnings in a **professional format**

---

## 🎯 Goal

Build strong Linux fundamentals before moving into:

* AWS ☁️
* DevOps ⚙️
* Infrastructure Automation 🚀

---

## 📅 Progress Tracker

| Day   | Topics Covered                                    | Status      |
| ----- | ------------------------------------------------- | ----------- |
| Day 1 | File Handling, Text Processing, System Monitoring | ✅ Completed |
| Day 2 | Coming Soon                                       | ⏳           |
| Day 3 | Coming Soon                                       | ⏳           |

---

# 📘 Day 1: Linux Basics + System Commands

## 🧱 Basic Commands

### 🔹 `tail -f`

Used to monitor logs in real-time.

📌 Real-world use: Debugging live applications

```bash
tail -f app.log
```

---

### 🔹 `less`

View large files page by page without loading entire file.

```bash
less file.txt
```

---

### 🔹 `cp -r`

Copy directories recursively.

```bash
cp -r source_dir destination_dir
```

---

### 🔹 `mv`

Move or rename files and directories.

```bash
mv oldname.txt newname.txt
```

---

### 🔹 `wc`

Displays:

* Number of lines
* Words
* Bytes

```bash
wc file.txt
```

---

### 🔹 Hard Link vs Soft Link

#### Hard Link

* Points directly to inode
* Same data reference

```bash
ln file.txt hardlink.txt
```

#### Soft Link (Symbolic Link)

* Shortcut to file path

```bash
ln -s file.txt softlink.txt
```

---

### 🔹 `cut`

Extract specific portions from a file.

```bash
cut -b 1-4 file.txt
```

---

### 🔹 `tee`

Writes output to both terminal and file.

```bash
echo "hello" | tee hello.txt
```

---

### 🔹 `sort`

Sort file contents.

```bash
sort file.txt
```

---

### 🔹 `diff`

Compare two files.

```bash
diff file1.txt file2.txt
```

---

## ⚡ Advanced Commands

### 🔹 SSH (Secure Shell)

Used to connect remote servers (default port: 22).

```bash
ssh user@host
```

---

### 🔹 `df -h`

Check disk usage in human-readable format.

```bash
df -h
```

---

### 🔹 `top`

Displays real-time system processes.

```bash
top
```

---

### 🔹 `vmstat`

Shows system performance:

* Memory
* CPU
* Processes

```bash
vmstat
```

---

## 🧠 Key Learnings

* Real-time log monitoring using `tail -f`
* File navigation and manipulation
* Understanding links (hard vs soft)
* Text processing with `cut`, `sort`, `tee`
* System monitoring using `top`, `df`, `vmstat`

---
<!-- 
## 📁 Project Structure

```
linux-learning/
│
├── Day-1/
│   ├── README.md
│   └── commands.sh
│
├── Day-2/
│   └── (coming soon)
│
└── README.md
```

---

## 💻 How to Use

Clone the repository:

```bash
git clone https://github.com/your-username/linux-learning.git
cd linux-learning/Day-1
bash commands.sh
```

---

## 🚀 Why This Repository?

This is not just notes — it reflects:

* Hands-on practice
* Real-world command usage
* Structured learning approach
 -->
