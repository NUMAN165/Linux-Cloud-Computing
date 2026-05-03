
---

# 📄 `commands.sh`

```bash
#!/bin/bash

# Day 1 - Linux Practice Commands

echo "===== Tail Command ====="
tail -f file.txt

echo "===== Less Command ====="
less file.txt

echo "===== Copy Directory ====="
cp -r dir1 dir2

echo "===== Move / Rename ====="
mv old.txt new.txt

echo "===== Word Count ====="
wc file.txt

echo "===== Hard Link ====="
ln file.txt hardlink.txt

echo "===== Soft Link ====="
ln -s file.txt softlink.txt

echo "===== Cut Command ====="
cut -b 1-4 file.txt

echo "===== Tee Command ====="
echo "hello" | tee hello.txt

echo "===== Sort Command ====="
sort file.txt

echo "===== Diff Command ====="
diff file1.txt file2.txt

echo "===== Disk Usage ====="
df -h

echo "===== Top Processes ====="
top

echo "===== VMStat ====="
vmstat

echo "===== SSH Example ====="
echo "ssh user@host"