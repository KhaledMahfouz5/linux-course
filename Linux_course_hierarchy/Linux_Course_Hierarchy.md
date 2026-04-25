# Linux Course Hierarchy
## For AI & Robotics Applications (Raspberry Pi + ROS)

> **Course purpose:** A practical Linux foundation for AI and robotics learners, designed for Linux machines/VMs with Raspberry Pi concepts integrated across sessions.
> **Hardware note:** Physical Raspberry Pi is optional.
> **GitHub repository:** https://github.com/KhaledMahfouz5/linux-course

## Requirements

- Basic programming knowledge (variables, conditions, loops, functions)
- Internet connection for searching and installing packages
- 30-50 GB free storage
- A note-taking method during class

---

## Chapter 1: Introduction, Installation, and Embedded Linux Basics

### Session 1: Linux for Robotics & AI

- Learning outcomes
- 1) Why Linux Matters Today
- 2) Understanding Linux: What It Really Is
- 3) Kernel vs OS (embedded perspective)
- 4) The Unix Philosophy
- 5) Linux History (The Simple Version)
- 6) The Free Software Philosophy (Why Linux Exists)
- 7) Why Robotics Engineers Choose Linux
- 8) Linux Distributions for Robotics
- 9) Pros and Cons of Linux in Robotics/AI
- 10) Raspberry Pi Ecosystem Overview (Conceptual)
- 11) How to Think Like a Linux User

### Session 2: Installation & Embedded Setup

- Learning outcomes
- 1) Choosing Your Linux Distribution
- 2) Primary Setup: Full Linux Installation (Dual Boot or VM)
- 3) Headless Setup Concepts
- 4) Post-Install Essentials
- 5) Pi Interfaces (Theoretical)
- Practice

### Session 3: Linux Basics for Robotics

- Learning outcomes
- 1) Introduction to the Linux Command Line
- 2) System Information and Hardware Detection
- 3) Shell Variables and Environment Configuration
- 4) File System Navigation
- 5) Essential Commands
- 6) Paths: Relative vs Absolute
- 7) Package Managers: `apt`, `pip`, `snap`
- 8) Editors: `nano`, `gedit`, `vim` Basics
- 9) Help Tools
- 10) Robotics Context: `/dev/` and `/sys/`
- 11) Explore Virtual Hardware Seen by VM
- 12) Archiving: `tar`, `zip`
- Bonus Useful Commands
- Practice Exercises

---

## Chapter 2: Programming, Development Tools & ROS Foundation

### Session 4: Text Manipulation & Log Analysis

- Learning outcomes
- 1) `grep` — The Search Engine of the Terminal
- 2) `sed` — The Stream Editor
- 3) `awk` — The Text Processor King
- 4) `find` — The Ultimate Search Tool
- 5) Pipes and Redirections
- 6) Practical Robotics Application

### Session 5: Development Environment for AI & Robotics

- Learning outcomes
- 1) Mindset & Setup
- 2) Python Setup (`venv`, `pip`)
- 3) AI/ML Framework Installation
- 4) Compile from Source (Makefiles/Build Systems)
- 5) Git Workflow for Robotics Teams
- 6) Web Development & Servers
- 7) IDE Setup
- 8) Docker for Containerized Workflows
- 9) Resource Optimization for Embedded Targets
- 10) Update System & Repositories

### Session 6: System Configuration & Tools for Robotics

- Learning outcomes
- 1) Filesystem Hierarchy in Robotics Context
- 2) "Everything Is a File" (Linux Philosophy)
- 3) Dotfiles (Hidden Power)
- 4) Permissions and Groups for Hardware Access
- 5) Root Permissions (`sudo`, `su`, `/etc/sudoers`)
- 6) Hard Links and Soft Links
- 7) Shell Aliases
- 8) Font/Theme Customization
- 9) Virtual Device Exploration
- 10) Install Common Software

### Session 7: Process Monitoring & Robotics System Management

- Learning outcomes
- 1) What Is a Process?
- 2) `htop` — Interactive Process Viewer
- 3) `kill` and `pkill` — End Processes
- 4) `ps` + `grep` — Find Processes via CLI
- 5) Background Execution (`&`)
- 6) Command Chaining — `&&`, `||`, `;`
- 7) Embedded Constraints
- 8) Real-Time Resource Management
- 9) Simulation Monitoring

---

## Chapter 3: System Management, Scripting & Networking

### Session 8: Automation with systemd & Cron

- Learning outcomes
- 1) What is systemd? (And Why You Should Care)
- 2) Understanding Units in systemd
- 3) Managing Services with systemctl
- 4) Where Are Unit Files Stored?
- 5) Anatomy of a Service File
- 6) Creating Your Own Service
- 7) Editing & Overriding Units (The Smart Way)
- 8) systemd Timers (Modern Scheduling)
- 9) Example: Send Message to All Users
- 10) Understanding OnCalendar
- 11) Other Timer Options
- 12) Timer vs Cron Comparison
- 13) Debugging Services & Timers
- 14) Real World Use Cases

### Session 9: Storage Management & Performance Optimization

- Learning outcomes
- 1) Why This Session Matters
- 2) Understanding Your Disks
- 3) Mounting and Unmounting Drives
- 4) Persistent Mounts with `/etc/fstab`
- 5) Monitoring RAM Usage
- 6) Understanding Swap
- 7) Swap and zram
- 8) Embedded Storage Choices (SD vs SSD)
- 9) Storage Lifespan Optimization
- 10) AI and Simulation Storage Management
- 11) Troubleshooting Boot Failures (fstab Mistakes)
- 12) Useful Extra Commands
- Practice
- Practical Lab Exercises

### Session 10: Shell Scripting & Robotics Networking

- Learning outcomes
- Part 1: Bash Scripting for Robotics Automation
  - 1) Variables and Data Types
  - 2) Control Flow
  - 3) Loops
  - 4) Functions
  - 5) Error Handling
  - 6) Working with APIs
- Part 2: Networking Essentials
  - 1) Connectivity Testing
  - 2) Network Interface Configuration
  - 3) Data Transfer
  - 4) Remote Access
  - 5) Multi-Robot Network Configuration
  - 6) Static IP Setup for Raspberry Pi Robots
  - 7) SSH Key-Based Authentication

### Session 11: Building Embedded Linux Systems with Buildroot

- Learning outcomes
- 1) Build Systems Overview
- 2) Buildroot Architecture and Workflow
- 3) Configuration Basics
- 4) First Build and Outputs
- 5) Customization
- 6) Practical Exercise

---

## Suggested Projects

1. **System Monitor Script:** Create a Bash monitor script for CPU/RAM with logging and >80% alerts.
2. **Automated Backup:** Build an automated workspace backup script to remote/cloud storage.
3. **SSH Remote Execution:** Practice SSH remote command execution between two machines/VMs (or localhost).
4. **QEMU Emulation:** Run full Raspberry Pi OS emulation in QEMU.
5. **Mobile SSH:** Optional: manage your Linux machine remotely from mobile (Termux + SSH).
6. **Custom Buildroot Image:** Build and document a custom Buildroot image with Python + SSH.
7. **Info Script:** Write a bash script that fetches currency rates, prayer times, or weather forecast using APIs with colored output and error handling.
8. **Rice Your Desktop:** Create a customized desktop environment with documented dotfiles on Git.

---

## Contact the Author

- Email: khaledmhfz2004@gmail.com
- GitHub: https://github.com/KhaledMahfouz5/linux-course

## Copyright

All rights reserved for **hamakRobotTeam** [NOT For Commercial Use]!!
