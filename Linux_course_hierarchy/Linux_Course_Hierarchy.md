# **Linux Course Hierarchy**
## **For AI & Robotics Applications (Raspberry Pi + ROS)**

> **Course Purpose:** This Linux course serves as a foundation for AI and Robotics development, specifically tailored for Raspberry Pi and ROS (Robot Operating System) applications.
> **Hardware Note:** No physical Raspberry Pi required! Physical Pi is optional for advanced exploration.
> **GitHub Repository:** https://github.com/KhaledMahfouz5/linux-course
> **Requirements** 
- You Have to know the basics of programming (variables , conditions ,loops , functions , ..etc).
- You Should have internet connection to be able to search the web and install packages when needed.
- You Must Have At least (30-50)GB free disk space .
- You Should have a sticky note or any tool for anything to take notes .

---

## **Chapter 1: Introduction, Installation, and Embedded Linux Basics**

### **Session 1: Linux for Robotics & AI**

* Linux history and relevance to robotics
* Kernel vs OS: Understanding embedded systems
* Why robotics engineers choose Linux
* Linux distributions for robotics (Ubuntu, Debian, Raspbian/Raspberry Pi OS)
* Pros and cons of Linux in robotics/AI
* **Raspberry Pi ecosystem overview** (conceptual - no hardware needed)

### **Session 2: Installation & Embedded Setup**

> Before the session: Install VirtualBox/VMware. Optional: Download QEMU for Pi emulation.

* Choosing your Linux distro (Desktop Ubuntu/Debian for development)
* **Primary setup:** Full Linux installation on your machine (dual boot or VM)
* Headless setup concepts: SSH, WiFi config, static IP
* Post-install essentials: drivers, SSH server, firewall, system backup
* **Understanding Pi interfaces (theoretical):** Camera, I2C, SPI, UART - what they do and why they matter

### **Session 3: Linux Basics for Robotics**

* System information and hardware detection
* Shell variables and environment configuration
* Essential commands: `uname`, `inxi`, `ls`, `cd`, `cat`, `mkdir`, `cp`, `mv`, `rm`, `echo`, `pwd`
* Paths: relative and absolute (critical for ROS workspaces)
* Package managers: `apt`, `pip`, `snap` (essential for AI/robotics packages)
* Editors: `nano`, `gedit`, `vim` basics
* Help commands: `man`, `info`, `tldr`, `--help`, `apropos`
* **Robotics context:** Understanding `/dev/` for devices, `/sys/` for hardware info
* **Exploring virtual hardware:** Check what devices your VM sees
* Archiving: `tar`, `zip` (for sharing robotics projects and models)

---

## **Chapter 2: Programming, Development Tools & ROS Foundation**

### **Session 4: Text Manipulation & Log Analysis**

* `grep` - searching logs and configuration files
* `sed` - automated text replacement in config files
* `awk` - data extraction from sensor logs
* `find` - locating files in complex ROS workspaces
* Pipes and redirections (`>`, `>>`, `|`, `<`)
* **Practical application:** Parse sensor data logs, filter ROS topic output

### **Session 5: Development Environment for AI & Robotics**

> Check that `python3`, `python3-venv`, `git`, `cmake`, `build-essential` are installed

* **Python setup:** venv, pip, virtual environments 
* **AI/ML frameworks installation:** TensorFlow, PyTorch, OpenCV on Linux
* Compile from source: understanding Makefiles and build systems
* Version control: Git workflow for robotics teams
* IDE setup: VS Code with Python, C++, ROS extensions
* Running a simple server for robot-to-robot communication
* **Resource optimization:** Understanding constraints when deploying to embedded systems (Pi, Jetson, etc.)
* Docker for containerized AI models and robotics simulations

### **Session 6: System Configuration & Tools for Robotics**

* File system hierarchy with robotics context:
  - `/dev/` - device files (sensors, actuators, cameras)
  - `/sys/class/gpio/` - GPIO access concepts (Raspberry Pi specific)
  - `/etc/` - system and ROS configuration
  - `/opt/ros/` - ROS installation directory
* "Everything is a file" philosophy applied to hardware
* Dot files for environment configuration (.bashrc, .profile)
* File permissions for hardware access (dialout, gpio, video groups)
* Root permissions: `sudo`, `su`, editing `/etc/sudoers`
* Hard links and soft links 
* Shell aliases 
* Font and theme customization for long coding sessions
* **Virtual device exploration:** Understanding how simulated devices appear in the system

---

## **Chapter 3: System Management, Scripting & Networking**

### **Session 7: Process Monitoring & Robotics System Management**

> Check that `htop` is installed

* `htop` - monitoring robot compute resources
* `kill` and `pkill` - managing stuck processes
* `ps` with `grep` - finding specific ROS nodes
* Running processes in background (`&`, `screen`, `tmux`)
* Command chaining (`&&`, `||`, `;`) for automation scripts
* **Understanding embedded constraints:** CPU temperature, throttling, memory limits
* Resource management for real-time robotics applications
* **Simulation monitoring:** Track resource usage of robot simulators

### **Session 8: Automation with systemd & Cron**

* systemd services for robotics:
  - Autostart launch files on boot
  - Create custom services for robot initialization
* systemd timers for periodic tasks:
  - Automated data logging
  - systemd VS cron jobs 
  - Regular sensor calibration
  - Scheduled model retraining
* Basic unit files and dependencies
* Cron jobs for repetitive robotics tasks

### **Session 9: Storage Management & Performance Optimization**

> Check that `zram-tools` is installed (optional)

* `lsblk` - understanding storage devices
* `blkid` - identifying drives and partitions
* `mount` and `umount` - external storage for robotics data
* Editing `/etc/fstab` for persistent mounts (external datasets, logs)
* Monitoring RAM usage (`free`, `vmstat`) - critical for resource-constrained systems
* Adding swap or using zram (essential for embedded systems with limited RAM)
* **Understanding embedded storage:** 
  - SD card vs SSD storage concepts
  - Optimizing storage lifespan on embedded devices
  - External storage for large AI model storage
* **AI context:** Managing large datasets and model files efficiently
* **Simulation storage:** Managing disk space for robot simulation environments

### **Session 10: Shell Scripting & Robotics Networking**

> Check that `curl`, `aria2`, `ssh`, `net-tools` packages are installed

* Bash scripting for robotics automation:
  - Sensor data collection scripts
  - Robot health check scripts
* Networking essentials:
  - `ping`, `ip`/`ifconfig` - network diagnostics
  - `curl`, `wget`, `aria2` - downloading datasets and models
  - `ssh`, `scp` - remote robot management
  - `rsync` - efficient large file transfers (datasets, recordings)
* Network configuration for multi-robot systems
* Static IP setup for Raspberry Pi robots
* SSH key-based authentication for automated robot access

### **Session 11: Building Embedded Linux Systems with Buildroot**

> **Requirements:** 20GB+ free disk space, stable internet connection
> **Note:** Focuses on Buildroot; Yocto covered conceptually for comparison
> **Tutorial reference:** https://youtu.be/ey3sKdOmPa8?si=H0kdd-9R5Id4XoXy

* Overview of embedded Linux build systems:
  - **Buildroot**: Simple, fast, ideal for beginners and most projects
  - **Yocto Project**: Powerful but complex, industry standard for commercial products
  - When to choose Buildroot vs Yocto
* Buildroot architecture and workflow:
  - Download, configure, compile, and assemble
  - Cross-compilation toolchain concepts
* Getting and configuring Buildroot:
  - `make defconfig` - using predefined configurations
  - `make menuconfig` - interactive configuration
  - Key options: target architecture, toolchain, init system, filesystem images
* Building your first system:
  - `make` - starting the build
  - Understanding output: rootfs, kernel, bootloader images
* Customization basics:
  - Adding packages via `menuconfig`
  - Root filesystem overlays and post-build scripts
  - Creating custom packages (`.mk` and `Config.in`)
* **Practical exercise:** Build a minimal ARM system for Raspberry Pi emulation with Python and SSH

---

#### **Suggestd Projects**

* Write a bash script that monitors system CPU/RAM usage and logs it, with alerts if resources are over 80%
* Create a script that automatically backs up your workspace to a remote server or cloud storage
* SSH into another VM or teammate's machine and run a command remotely (or practice with localhost)
* QEMU: Full Raspberry Pi OS emulation
* (Optional) Install Termux on mobile and explore remote server management from your phone
* Build a custom embedded Linux system for Raspberry Pi using Buildroot with Python, SSH, and custom configuration

---

#### **Contact the Author**

- Email: khaledmhfz2004@gmail.com
- GitHub: https://github.com/KhaledMahfouz5/linux-course

#### **Copyright**

All rights reserved for **hamakRobotTeam** [NOT For Commercial Use]!!
