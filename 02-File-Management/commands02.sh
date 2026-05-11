#!/bin/bash

# =============================================================================
# File Management in Linux - Command Reference Script
# =============================================================================
# Demonstrates navigation, creation, viewing, copying, moving, deleting,
# permissions, searching, disk usage, compression, and linking.
# Usage: bash command.sh
# =============================================================================

DEMO_DIR="/tmp/linux_file_demo"

echo "============================================="
echo "   NAVIGATION COMMANDS"
echo "============================================="

echo ""
echo ">> pwd : Current working directory"
pwd

echo ""
echo ">> ls : List files in current directory"
ls

echo ""
echo ">> ls -la : Detailed listing with hidden files"
ls -la

echo ""
echo ">> cd ~ : Go to home directory (shown as pwd after)"
cd ~ && pwd

echo ""
echo "============================================="
echo "   SETTING UP DEMO DIRECTORY"
echo "============================================="

echo ""
echo ">> Creating demo workspace at $DEMO_DIR"
mkdir -p "$DEMO_DIR"
cd "$DEMO_DIR" || exit 1
echo "   Working inside: $(pwd)"

echo ""
echo "============================================="
echo "   FILE & DIRECTORY CREATION"
echo "============================================="

echo ""
echo ">> touch : Create empty files"
touch file1.txt file2.txt file3.txt
echo "   Created: file1.txt file2.txt file3.txt"

echo ""
echo ">> mkdir : Create a directory"
mkdir mydir
echo "   Created: mydir/"

echo ""
echo ">> mkdir -p : Create nested directories"
mkdir -p projects/linux/scripts
echo "   Created: projects/linux/scripts/"

echo ""
echo ">> ls after creation:"
ls -la

echo ""
echo "============================================="
echo "   VIEWING FILE CONTENT"
echo "============================================="

echo ""
echo ">> Writing sample content to file1.txt"
cat > file1.txt <<EOF
Hello, Linux!
This is line 2.
This is line 3.
File management is important.
Keep learning Linux every day.
EOF

echo ""
echo ">> cat : Display full file content"
cat file1.txt

echo ""
echo ">> head : First 3 lines"
head -n 3 file1.txt

echo ""
echo ">> tail : Last 2 lines"
tail -n 2 file1.txt

echo ""
echo ">> wc : Count lines, words, characters"
wc file1.txt

echo ""
echo ">> wc -l : Count lines only"
wc -l file1.txt

echo ""
echo "============================================="
echo "   COPYING & MOVING FILES"
echo "============================================="

echo ""
echo ">> cp : Copy file1.txt to file1_backup.txt"
cp file1.txt file1_backup.txt
echo "   Result:"
ls *.txt

echo ""
echo ">> cp -r : Copy directory recursively"
cp -r projects/ projects_backup/
echo "   Copied projects/ -> projects_backup/"
ls -d */

echo ""
echo ">> mv : Rename file2.txt to renamed.txt"
mv file2.txt renamed.txt
echo "   Result:"
ls *.txt

echo ""
echo ">> mv : Move file3.txt into mydir/"
mv file3.txt mydir/
echo "   Result in mydir/:"
ls mydir/

echo ""
echo "============================================="
echo "   FILE PERMISSIONS"
echo "============================================="

echo ""
echo ">> ls -l : View current permissions"
ls -l file1.txt

echo ""
echo ">> chmod +x : Make file executable"
chmod +x file1.txt
ls -l file1.txt

echo ""
echo ">> chmod 644 : Set owner=rw, group=r, others=r"
chmod 644 file1.txt
ls -l file1.txt

echo ""
echo ">> chmod 754 : Set owner=rwx, group=r-x, others=r--"
chmod 754 file1_backup.txt
ls -l file1_backup.txt

echo ""
echo "# chown example (requires sudo - shown only):"
echo "  sudo chown username file1.txt"
echo "  sudo chown username:groupname file1.txt"

echo ""
echo "============================================="
echo "   SEARCHING FILES & CONTENT"
echo "============================================="

echo ""
echo ">> find : Find files by name"
find "$DEMO_DIR" -name "*.txt"

echo ""
echo ">> find : Find files modified in last 1 day"
find "$DEMO_DIR" -mtime -1

echo ""
echo ">> grep : Search for 'Linux' in file1.txt"
grep "Linux" file1.txt

echo ""
echo ">> grep -i : Case-insensitive search for 'hello'"
grep -i "hello" file1.txt

echo ""
echo ">> grep -r : Recursive search for 'Linux' in demo dir"
grep -r "Linux" "$DEMO_DIR" 2>/dev/null

echo ""
echo ">> grep -n : Show line numbers in results"
grep -n "line" file1.txt

echo ""
echo "============================================="
echo "   FILE INFORMATION & DISK USAGE"
echo "============================================="

echo ""
echo ">> file : Identify file type"
file file1.txt
file mydir/

echo ""
echo ">> stat : Detailed file metadata"
stat file1.txt

echo ""
echo ">> du -sh : Size of a directory"
du -sh projects/

echo ""
echo ">> du -sh * : Size of all items"
du -sh *

echo ""
echo ">> df -h : Available disk space on filesystems"
df -h

echo ""
echo "============================================="
echo "   COMPRESSION & ARCHIVING"
echo "============================================="

echo ""
echo ">> tar -czf : Create a .tar.gz archive"
tar -czf myarchive.tar.gz file1.txt file1_backup.txt
echo "   Created: myarchive.tar.gz"
ls -lh myarchive.tar.gz

echo ""
echo ">> tar -xzf : Extract the archive"
mkdir extracted/
tar -xzf myarchive.tar.gz -C extracted/
echo "   Extracted to extracted/:"
ls extracted/

echo ""
echo ">> gzip : Compress renamed.txt"
gzip renamed.txt
echo "   After gzip:"
ls renamed.txt.gz

echo ""
echo ">> gunzip : Decompress it back"
gunzip renamed.txt.gz
echo "   After gunzip:"
ls renamed.txt

echo ""
echo "============================================="
echo "   SYMBOLIC LINKS"
echo "============================================="

echo ""
echo ">> ln -s : Create a symbolic link"
ln -s "$DEMO_DIR/file1.txt" "$DEMO_DIR/file1_link.txt"
echo "   Created symlink: file1_link.txt -> file1.txt"
ls -la file1_link.txt

echo ""
echo ">> Reading via symlink:"
cat file1_link.txt

echo ""
echo "============================================="
echo "   DELETING FILES & DIRECTORIES"
echo "============================================="

echo ""
echo ">> rm : Delete a single file"
rm file1_backup.txt
echo "   Deleted: file1_backup.txt"

echo ""
echo ">> rmdir : Remove an empty directory"
rmdir mydir/ 2>/dev/null && echo "   Deleted: mydir/" || echo "   mydir/ not empty, use rm -r"

echo ""
echo ">> rm -r : Remove a non-empty directory"
rm -r projects_backup/
echo "   Deleted: projects_backup/"

echo ""
echo "# rm -rf example (use with extreme caution!):"
echo "  rm -rf foldername/"

echo ""
echo "============================================="
echo "   CLEANUP DEMO DIRECTORY"
echo "============================================="

echo ""
echo ">> Cleaning up $DEMO_DIR ..."
cd /tmp || exit
rm -rf "$DEMO_DIR"
echo "   Demo directory removed."

echo ""
echo "============================================="
echo "   Script complete!"
echo "============================================="