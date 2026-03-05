# **Linux Command Line Basics**

*For beginners, students, and new Linux users*

---

# **1. Introduction to the Linux Command Line**

The Linux command line (often called the **terminal**, **shell**, or **CLI**) is a text-based interface that allows you to interact with your system quickly and efficiently. While graphical interfaces (GUIs) are great for daily tasks, the command line provides:

* Faster automation
* Power-user flexibility
* Access to advanced tools
* A universal interface across all distros

Most distributions ship with **bash** as the default shell, though others (zsh, fish) also exist.

To open a terminal:

* **Ubuntu / Debian**: `Ctrl + Alt + T`
* **Fedora**: Activities → Terminal
* **Any distro**: Search “Terminal”

---

# **2. System Information**

Linux provides several commands to check system details:

### **2.1 `uname`**

Shows basic system information:

```bash
uname
uname -a
uname -r
uname -m
```

### **2.2 `hostnamectl`**

Shows OS name, kernel, hardware:

```bash
hostnamectl
```

### **2.3 `inxi`**

A more advanced tool (you may need to install it):

```bash
sudo apt update # update package index
sudo apt install inxi
inxi -F
```

> Note : you need to update the package index before installing any package .

Displays CPU, GPU, RAM, kernel, drivers, etc.

### **2.4 `lsb_release`**

Useful on Debian-based systems:

```bash
lsb_release -a
```

---

# **3. Shell Variables**

The shell stores data (variables) temporarily during your session.

### **3.1 Viewing Variables**

```bash
echo $HOME
echo $USER
echo $PATH
```

### **3.2 Creating Variables**

```bash
NAME="Khaled"
echo $NAME
```

### **3.3 Exporting Variables**

Makes them available to programs:

```bash
export EDITOR=nano
```

### **3.4 Listing All Variables**

```bash
printenv
set
```

---

# **4. File System Navigation**

Every Linux filesystem starts from the **root (`/`)** directory.

### **4.1 `pwd` – Print Working Directory**

Shows where you currently are:

```bash
pwd
```

### **4.2 `ls` – List Files**

```bash
ls
ls -l
ls -la
ls -h
```

### **4.3 `cd` – Change Directory**

```bash
cd /home
cd Documents
cd ..
cd ~
cd -
```

Shortcuts:

* `.` → current directory
* `..` → parent directory
* `~` → home directory
* `-` → previous directory

---

# **5. Essential File & Directory Commands**

### **5.1 `mkdir` – Create Directory**

```bash
mkdir projects
mkdir -p school/assignments
```

### **5.2 `touch` – Create Empty Files**

```bash
touch notes.txt
```

### **5.3 `cp` – Copy**

```bash
cp file.txt backup.txt
cp -r folder/ folder_backup/
```

### **5.4 `mv` – Move/Rename**

```bash
mv oldname.txt newname.txt
mv file.txt /home/user/Documents/
```

### **5.5 `rm` – Remove**

⚠️ Dangerous but essential:

```bash
rm file.txt
rm -r folder/
rm -rf folder/  # very dangerous
```

### **5.6 `cat` – View Content**

```bash
cat file.txt
```

### **5.7 `echo` – Print Text**

```bash
echo "Hello Linux!"
echo $USER
```

### **5.8 `sleep` – Pause Execution**

```bash
sleep 5
```

---

# **6. Understanding Paths**

### **6.1 Absolute Paths**

Start from the root `/`.

Example:

```
/home/khaled/projects/code.py
```

### **6.2 Relative Paths**

Start from your current location.

Example:

```
../images/photo.png
./run.sh
```

---

# **7. Package Management**

Every Linux distribution uses a package manager to install software.

---

## **7.1 `apt` – Debian, Ubuntu, Linux Mint**

### Update repositories:

```bash
sudo apt update
```

### Install:

```bash
sudo apt install gedit
```

### Remove:

```bash
sudo apt remove gedit
```

### Upgrade system:

```bash
sudo apt upgrade
```

---

## **7.2 `dnf` – Fedora, RHEL 8+, CentOS Stream**

```bash
sudo dnf install nano
sudo dnf remove nano
sudo dnf update
```

---

## **7.3 `yum` – Older RHEL/CentOS**

```bash
sudo yum install nano
sudo yum remove nano
sudo yum update
```

---

# **8. Editors**

### **8.1 nano (Terminal Editor)**

```bash
nano file.txt
```

Controls:

* Save: **Ctrl + S**
* Exit: **Ctrl + X**
* Search: **Ctrl + W**

### **8.2 gedit (GUI Editor)**

```bash
gedit notes.txt &
```

The `&` lets the terminal continue running.

---

# **9. Getting Help**

Linux has multiple built-in help resources.

### **9.1 `man` – Manual Pages**

```bash
man ls
man tar
```

### **9.2 `info`**

```bash
info coreutils
```

### **9.3 `tldr` – Simplified Examples**

Install:

```bash
sudo apt install tldr
```

Use:

```bash
tldr ls
```

### **9.4 `--help`**

```bash
ls --help
tar --help
```

### **9.5 `apropos` – Search for Commands by Description**

```bash
apropos network
```

---

# **10. Archiving & Compression**

### **10.1 `tar` (Most Common in Linux)**

Create:

```bash
tar -cvf archive.tar folder/
```

Extract:

```bash
tar -xvf archive.tar
```

Compressed with gzip:

```bash
tar -czvf archive.tar.gz folder/
tar -xzvf archive.tar.gz
```

### **10.2 `zip`**

```bash
zip archive.zip file1 file2
unzip archive.zip
```

### **10.3 `7z` (7-Zip)**

Install:

```bash
sudo apt install p7zip-full
```

Compress:

```bash
7z a archive.7z folder/
```

Extract:

```bash
7z x archive.7z
```

---

# **11. Bonus Useful Commands**

### **11.1 `clear`** – clears the terminal

### **11.2 `history`** – shows previous commands

### **11.3 `head` / `tail`** – preview files

```bash
head file.txt
tail file.txt
tail -f log.txt
```

### **11.4 `less`** – view files with navigation

```bash
less file.txt
```

### **11.5 `grep`** – search text

```bash
grep "error" log.txt
```

### **11.6 `whoami`** – current user

### **11.7 `df -h`** – disk usage

### **11.8 `du -sh folder/`** – folder size

---

# **12. Final Tips for Newcomers**

* Practice every day
* Use `tldr` for quick examples
* Avoid `rm -rf` unless absolutely necessary
* Use tab completion
* Use `history` to track commands
* Explore `/etc`, `/home`, `/usr`, `/bin` directories carefully

---

# **Practice Exercises**

1. Create a directory structure:

```
projects/python/basics
```

2. Create three files inside `basics`.

3. Write your name into `info.txt` using `echo`.

4. Compress the folder using:

* tar
* zip

5. Install `tldr` and test 5 commands.

6. View your system kernel version and CPU info using two methods.
