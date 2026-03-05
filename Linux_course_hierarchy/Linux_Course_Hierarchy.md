# **Linux Course Hierarchy**

## **Chapter 1: Introduction, Installation, and Basics**

### **Session 1: Intro**

* Linux history and Linux distros
* Unix philosophy
* Kernel vs OS
* Free Software Philosophy
* Why programmers love Linux
* Pros and cons

### **Session 1: Installation**

> Before the session : Install a VirtualBox or prepare a bootable USB.

* Choosing your distro
* Install your Linux system
* Dual booting with Windows
* VirtualBox VM setup
* Post-install (drivers – firewall – backup and restore system)

### **Session 2: Basics**

* System information
* Shell variables
* Commands: uname, inxi, ls, cd, cat, mkdir, cp, mv, rm, echo, sleep, pwd
* Paths: relative and absolute
* Package managers: apt, dnf, yum
* Editors: nano, gedit
* Help commands: man, info, tldr, --help, apropos
* Archiving and compression: tar, zip, 7z

### **Session 3: Text Manipulation**

* grep
* sed
* awk
* find
* Pipes and redirections (> , >> , | , <)

### **Session 4: User Permissions and File System**

* File system hierarchy (/ , /home , /etc , /var , /usr)
* “Everything is a file”
* Dot files
* File ownership and permissions (rwx)
* Root permissions: sudo, su, editing /etc/sudoers
* Hard links and soft links
* Common beginner mistakes

---

## **Chapter 2: Software and Development and Cool Stuff**

> Note: These are suggested topics and can be adapted.

### **Session 5: Software and Development**

* Compile suckless tools (st, dmenu)
* Run a simple server and share files
* PHP / XAMPP
* Node.js and basic React app
* Java basics
* Browsers, VS Code, Arduino IDE
* Compilers and debugging tools
* Makefiles and AVR toolchain
* Install Python (venv, pip)
* Use .AppImage and create a desktop shortcut
* Update system and change repositories
* Add Kali repos (with discussion)
* Install Docker and run containers

### **Session 6: Cool Stuff**

* Research skills and problem solving
* Learn ffmpeg
* FOSS alternatives
* Run Windows apps with Bottles and Wine/Proton/Lutris
* Install Git and clone a repo
* Learn rsync
* Using AI
* Install common GUI apps
* flatpak and snap
* Shell aliases
* Install and configure common software
* Fonts and themes

---

## **Chapter 3: Building and Maintaining Your System**

### **Session 7: Process Monitoring and Management**

> Check That `htop` package is installed on your system

* htop
* kill and pkill
* ps with grep
* Run in background (&)
* Command chaining (&& , || , ;)

### **Session 8: Scheduling with systemd**

* systemd services
* systemd timers
* Basic unit files

### **Session 9: Managing Disks, RAM Usage, and Swap**

> Check That `zram-tools` package is installed on your system

* lsblk
* blkid
* mount and umount
* Editing /etc/fstab
* Monitoring RAM (free)
* Adding swap or using zram

### **Session 10: Shell Scripting and Networking Tools**

> Check That `curl`, `aria2`, `ssh` packages are installed on your system

* Bash scripting basics
* Networking tools: ping, ifconfig/ip, curl, wget, aria2, ssh, scp
* Ricing Linux with tiling window managers (optional)

#### **Homework for Session 10**

* Write a script (bash + curl) that shows currency rates, prayer times, and weather forecast
* Install Termux (Android) or iSH (iOS) and SSH into your PC

---

## **Final Project**

**At home:**

* Install Linux
* Make your own customized (riced) desktop
* Desktop environments and window managers allowed
* Share results with the group

