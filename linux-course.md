# Linux Course

## For AI & Robotics Applications (Raspberry Pi + ROS)

This course is a practical Linux foundation for AI and robotics learners. It is designed for development on Linux machines and VMs, with Raspberry Pi concepts integrated across sessions.
**GitHub repository:(for detailed info)** https://github.com/KhaledMahfouz5/linux-course

**Course structure:** 3 chapters, 11 sessions  
**Session duration:** 60-90 minutes each  
**Hardware note:** Physical Raspberry Pi is optional

## Requirements

- Basic programming knowledge (variables, conditions, loops, functions).
- internet connection for searching the web and installing packages (most of the time you do not need a huge bandwidth).
- 30-50 GB free storage.
- A note-taking method during class.

---

## Chapter 1: Introduction, Installation, and Embedded Linux Basics

### Session 1: Linux for Robotics & AI

#### Learning outcomes
By the end of this session, students should be able to:
- Explain why Linux dominates robotics and AI workflows
- Distinguish between the kernel and a full operating system
- Choose suitable Linux distributions for robotics learning and deployment
- Evaluate Linux strengths/limitations for embedded and AI use-cases
- Understand the Raspberry Pi ecosystem at a conceptual level

#### 1) Linux history and relevance to robotics
Linux grew from Unix ideas: stability, composability, and scriptability. Over time it became the default platform for servers, cloud infrastructure, embedded devices, and scientific computing.  

For robotics and AI, this matters because the same OS family runs:
- Development laptops
- Edge devices (Pi/Jetson-like boards)
- CI/CD pipelines
- Data and model-serving infrastructure

Linux gives one consistent operational model from prototype to deployment.

#### 2) Kernel vs OS (embedded perspective)
**Kernel** = low-level core that manages CPU, memory, processes, devices, and system calls.  
**Operating system** = kernel + userland tools + services + package system + optional desktop.

Embedded systems usually optimize the userland while relying on the same Linux kernel principles:
- Hardware abstraction through drivers
- Process isolation
- Permission model
- Filesystem-based device interfaces

#### 3) Why robotics engineers choose Linux
- Strong CLI tooling for automation and debugging
- Better compatibility with robotics stacks (ROS ecosystem)
- Native package and build tooling for C/C++/Python workflows
- Reliable remote management over SSH
- Easy scripting for repetitive hardware/software tasks

#### 4) Linux distributions for robotics
**Ubuntu:** most common ROS learning path, huge documentation, easy onboarding  
**Debian:** very stable and lightweight, strong base for long-term systems  
**Raspberry Pi OS (Raspbian):** Pi-focused integration and educational accessibility

Selection criteria:
- Stability and long-term support
- Package availability
- Hardware support
- Team familiarity

#### 5) Pros and cons of Linux in robotics/AI
**Pros**
- High control and transparency
- Excellent automation capabilities
- Strong networking and remote tooling
- Efficient on modest hardware

**Cons**
- Higher learning curve for beginners
- Some device/vendor tooling may be Windows-first
- Requires operational discipline (permissions, services, system config)

#### 6) Raspberry Pi ecosystem overview (conceptual)
Key idea: Raspberry Pi is a compact Linux computer often used for sensing, control, and edge inference.  

Ecosystem concepts:
- GPIO for digital I/O
- Camera and CSI-based vision capture
- I2C/SPI/UART buses for sensors/actuators
- SD-card based storage and boot
- SSH-first/headless management patterns

---

### Session 2: Installation & Embedded Setup

> Before class: install VirtualBox/VMware. Optional: QEMU for Pi emulation.

#### Learning outcomes
- Install Linux via VM or dual boot safely
- Understand headless setup basics (SSH/WiFi/static IP)
- Perform post-install essentials for reliable daily use
- Explain the role of Camera/I2C/SPI/UART in Pi-based systems

#### 1) Choosing your Linux distro
For course delivery, use desktop Ubuntu or Debian for easiest package support and lab consistency.

#### 2) Primary setup: full Linux installation (dual boot or VM)
**VM path (recommended for beginners):**
- Low risk, fast reset, easy snapshots
- Good for command practice and repeatable labs

**Dual-boot path (optional):**
- Better native performance
- Requires careful partitioning and backup discipline

#### 3) Headless setup concepts
Headless means "manage without monitor/keyboard on target device."

Core concepts:
- SSH service enabled on boot
- Network reachability (WiFi/Ethernet)
- Static IP plan for stable robot addressing

#### 4) Post-install essentials
- Update package indexes and security updates
- Install drivers and core tooling
- Enable SSH server
- Configure firewall baseline
- Create backup/snapshot routine

#### 5) Pi interfaces (theoretical)
- **Camera:** image/video input for CV pipelines
- **I2C:** low-speed bus for many sensors
- **SPI:** higher-speed peripheral communication
- **UART:** serial communication for diagnostics/controllers

#### Practice
```bash
sudo apt update && sudo apt upgrade -y
sudo apt install -y openssh-server ufw
sudo systemctl enable --now ssh
sudo ufw allow OpenSSH
sudo ufw enable
ip a
```

---

### Session 3: Linux Basics for Robotics

#### Learning outcomes
- Navigate Linux confidently
- Use core command-line tools for daily robotics development
- Understand path usage for ROS workspaces
- Explore device/hardware-facing paths (`/dev`, `/sys`)

#### 1) System information and hardware detection
Use system tools to identify kernel version, architecture, and hardware summary.

```bash
uname -a
hostnamectl
inxi -F
```

#### 2) Shell variables and environment configuration
Environment variables define runtime behavior for tools and scripts.

```bash
echo "$HOME"
echo "$PATH"
export ROBOT_NAME=alpha1
echo "$ROBOT_NAME"
```

#### 3) Essential commands
`ls`, `cd`, `pwd`, `cat`, `mkdir`, `cp`, `mv`, `rm`, `echo`, `uname`, `inxi` are the baseline daily toolkit.

```bash
mkdir -p robotics_ws/src
cd robotics_ws
pwd
echo "session3" > notes.txt
cat notes.txt
cp notes.txt notes.bak
mv notes.bak archive.txt
```

#### 4) Paths: relative vs absolute
Robotics workspaces fail often because of path mistakes.
- **Absolute:** starts from `/` (stable in scripts)
- **Relative:** from current directory (fast interactive use)

#### 5) Package managers: `apt`, `pip`, `snap`
- `apt` for system packages
- `pip` for Python packages
- `snap` for bundled apps/tooling where appropriate

#### 6) Editors: `nano`, `gedit`, `vim` basics
Students should be comfortable editing files both in terminal and GUI contexts.

#### 7) Help tools
Use `man`, `info`, `tldr`, `--help`, and `apropos` to self-debug and self-learn.

#### 8) Robotics context: `/dev/` and `/sys/`
- `/dev/`: device files (serial ports, cameras, disks)
- `/sys/`: kernel-exposed hardware/state metadata

#### 9) Explore virtual hardware seen by VM
Inspect which virtual disks, network interfaces, and pseudo-devices appear.

#### 10) Archiving: `tar`, `zip`
Archive projects and logs for sharing, reproducibility, and backups.

```bash
tar -czf robotics_ws.tar.gz robotics_ws
zip -r robotics_ws.zip robotics_ws
```

---

## Chapter 2: Programming, Development Tools & ROS Foundation

### Session 4: Text Manipulation & Log Analysis

#### Learning outcomes
- Filter and transform large text/log outputs efficiently
- Extract structured fields from sensor logs
- Locate files quickly in large ROS-style directories
- Chain commands with pipes/redirection

#### 1) `grep` for search
Use `grep` to find errors, warnings, identifiers, and patterns.

```bash
grep -i "error" robot.log
grep -nE "warn|fail|timeout" robot.log
```

#### 2) `sed` for stream edits
Use `sed` for fast replacements and cleanup in config/log text.

```bash
sed 's/WARN/WARNING/g' robot.log > robot_clean.log
sed -n '/camera/p' robot.log
```

#### 3) `awk` for field extraction
Use `awk` to parse CSV/space-delimited telemetry quickly.

```bash
awk -F',' '{print $1, $3}' sensor.csv
awk '$2 > 50 {print $0}' telemetry.txt
```

#### 4) `find` for workspace search
Essential in nested workspaces and mixed code/config trees.

```bash
find ~/robotics_ws -name "*.launch"
find ~/robotics_ws -type f -name "*.py"
```

#### 5) Pipes and redirections
- `|` passes output between commands
- `>` overwrite output file
- `>>` append output file
- `<` feed file as input

#### 6) Practical robotics application
Filter ROS-like outputs, isolate anomalies, and summarize key fields for debugging.

```bash
cat robot.log | grep "camera" | awk '{print $1,$2,$NF}'
grep -i "imu" topics.txt | sort | uniq -c
```

---

### Session 5: Development Environment for AI & Robotics

> Verify installed: `python3`, `python3-venv`, `git`, `cmake`, `build-essential`

#### Learning outcomes
- Set up isolated Python development environments
- Install and manage AI/vision packages
- Understand source-build basics
- Use team Git workflows
- Prepare editor + Docker-based development flow

#### 1) Python setup (`venv`, `pip`)
Use virtual environments to avoid global dependency conflicts.

```bash
python3 -m venv .venv
source .venv/bin/activate
pip install --upgrade pip
```

#### 2) AI/ML framework installation
Start with OpenCV and expand to TensorFlow/PyTorch according to hardware and project scope.

```bash
pip install opencv-python
```

#### 3) Compile from source (Makefiles/build systems)
Understand compile-link pipeline and why build systems are central in robotics C/C++ codebases.

#### 4) Git workflow for robotics teams
Branch, commit, push, and review with reproducible history and rollback capability.

#### 5) IDE setup
VS Code with Python/C++/ROS extensions for integrated linting, debugging, and navigation.

#### 6) Simple server for robot-to-robot communication
Use lightweight local HTTP services for data exchange testing and diagnostics.

```bash
python3 -m http.server 8000
```

#### 7) Resource optimization for embedded targets
Account for CPU, RAM, thermal limits, and storage constraints before deployment.

#### 8) Docker for containerized workflows
Use containers for reproducible environments in model serving and simulation pipelines.

```bash
docker --version
```

---

### Session 6: System Configuration & Tools for Robotics

#### Learning outcomes
- Navigate Linux filesystem with robotics context
- Manage permissions for hardware/device access
- Configure shell environment and productivity shortcuts
- Understand links and safe privilege usage

#### 1) Filesystem hierarchy in robotics context
- `/dev/`: hardware/device nodes (serial, camera, input)
- `/sys/class/gpio/`: GPIO representation (conceptual Pi mapping)
- `/etc/`: system and service configuration
- `/opt/ros/`: ROS installation location

#### 2) "Everything is a file"
In Linux, many hardware/system interfaces are exposed as file-like endpoints.

#### 3) Dotfiles (`.bashrc`, `.profile`)
Used to customize shell behavior, aliases, environment variables, and startup logic.

#### 4) Permissions and groups for hardware access
Typical groups: `dialout`, `gpio`, `video`.  
Correct group membership often resolves "permission denied" with serial/camera devices.

#### 5) Root permissions (`sudo`, `su`, `/etc/sudoers`)
Use least-privilege habits:
- `sudo` for specific admin commands
- avoid persistent root shells unless necessary
- understand sudo policy source in `/etc/sudoers`

#### 6) Hard links and soft links
- Hard link: additional directory entry to same inode
- Soft link: path reference (shortcut-like behavior)

#### 7) Shell aliases
Speed up common workflows with carefully chosen aliases.

```bash
echo "alias ll='ls -lah'" >> ~/.bashrc
```

#### 8) Font/theme customization
Long robotics sessions benefit from readable fonts and reduced visual fatigue.

#### 9) Virtual device exploration
Understand how simulated hardware appears in `/dev` and how tooling discovers it.

---

## Chapter 3: System Management, Scripting & Networking

### Session 7: Process Monitoring & Robotics System Management

> Verify `htop` is installed .

#### Learning outcomes
- Monitor process/resource usage under robotics workloads
- Control or terminate stalled tasks safely
- Use background execution and command chaining
- Reason about embedded constraints (thermal/memory throttling)

#### 1) `htop` monitoring
Real-time CPU, RAM, process state, and quick task targeting.

#### 2) `kill` and `pkill`
- `kill <PID>` for specific process
- `pkill <name>` for name-based process termination

#### 3) `ps` + `grep`
Locate ROS-like processes and confirm runtime state.

```bash
ps aux | grep -i ros
```

#### 4) Background execution
`&`, `screen`, `tmux` keep long tasks active while terminal remains usable.

#### 5) Command chaining
- `&&` run next only if success
- `||` run fallback on failure
- `;` run regardless

#### 6) Embedded constraints
Understand temperature, throttling, and memory pressure behavior on small devices.

#### 7) Real-time resource management
Prioritize critical processes and avoid overload from concurrent jobs.

#### 8) Simulation monitoring
Track simulator CPU/RAM impact and tune settings to maintain responsiveness.

---

### Session 8: Automation with systemd & Cron

#### Learning outcomes
- Create/manage systemd services for robotics startup
- Schedule recurring tasks using timers and cron
- Understand unit dependencies and debugging basics

#### 1) systemd services for robotics
Use services to autostart robot initialization and launch routines at boot.

Minimal service structure:
```ini
[Unit]
Description=Robot Startup Service
After=network-online.target

[Service]
Type=simple
ExecStart=/usr/local/bin/robot_start.sh
Restart=on-failure

[Install]
WantedBy=multi-user.target
```

#### 2) systemd timers for periodic tasks
Useful for recurring logs, health checks, calibration tasks, and scheduled retraining triggers.

#### 3) systemd vs cron
- **systemd timers:** integrated logging/dependencies
- **cron:** simple recurring scheduling with broad familiarity

#### 4) Unit files and dependencies
Understand ordering (`After=`) and requirement links (`Requires=`).

#### 5) Cron jobs for repetitive tasks
Use `crontab -e` for user-level scheduled jobs.

```bash
crontab -l
```

---

### Session 9: Storage Management & Performance Optimization

> `zram-tools` is optional but recommended for low-memory systems.

#### Learning outcomes
- Inspect and mount storage devices correctly
- Configure persistent mounts through `/etc/fstab`
- Monitor memory behavior and choose swap/zram strategy
- Manage datasets/models under embedded storage constraints

#### 1) `lsblk` and `blkid`
Identify disks, partitions, filesystem type, and UUIDs safely before mounting.

#### 2) `mount` and `umount`
Attach/detach external drives used for logs, datasets, and recordings.

#### 3) Persistent mounts with `/etc/fstab`
Use UUID-based entries to ensure stable mount behavior across reboots.

#### 4) RAM monitoring (`free`, `vmstat`)
Measure real memory pressure before deciding on swap strategy.

#### 5) Swap and zram
- Swap: disk-backed overflow memory
- zram: compressed memory-backed swap, often faster on constrained systems

#### 6) Embedded storage choices (SD vs SSD)
- SD: portable and common, but limited endurance
- SSD: better durability/performance for heavy read/write workloads

#### 7) Storage lifespan optimization
Reduce unnecessary writes, rotate logs, and separate high-write data paths where possible.

#### 8) AI and simulation storage management
Organize datasets/models/simulation outputs with clear cleanup and archival policy.

#### Practice
```bash
lsblk
blkid
free -h
vmstat 1 5
df -h
```

---

### Session 10: Shell Scripting & Robotics Networking

> Verify packages: `curl`, `aria2`, `ssh`, `net-tools`

#### Learning outcomes
- Build practical Bash scripts for robotics operations
- Diagnose and configure network connectivity
- Transfer data/models securely and efficiently
- Set up static IP and SSH keys for automation

#### 1) Bash scripting for robotics automation
Typical script use-cases:
- Sensor data collection pipeline
- Robot health-check report

Core script blocks to practice:
- Variables
- Conditions and loops
- Functions
- Exit codes and basic error handling

#### 2) Networking essentials
- `ping`, `ip`, `ifconfig`: connectivity and interface inspection
- `curl`, `wget`, `aria2`: dataset/model download workflows
- `ssh`, `scp`: secure remote management and transfer
- `rsync`: efficient incremental sync for large files

#### 3) Multi-robot network configuration
Plan IP ranges, naming conventions, and role-based segmentation.

#### 4) Static IP setup for Raspberry Pi robots
Stable addressing is critical for predictable remote control and orchestration.

#### 5) SSH key-based authentication
Use keys for secure, passwordless automation across robot fleets.

#### Practice
```bash
ping -c 4 8.8.8.8
ip a
ifconfig
curl -I https://example.com
ssh-keygen -t ed25519
ssh user@robot-host
scp model.bin user@robot-host:/tmp/
rsync -av logs/ user@robot-host:/tmp/logs/
```

---

### Session 11: Building Embedded Linux Systems with Buildroot

> Requirements: 20 GB+ free storage, stable internet
> Tutorial reference: https://youtu.be/ey3sKdOmPa8?si=H0kdd-9R5Id4XoXy

#### Learning outcomes
- Explain Buildroot vs Yocto tradeoffs
- Configure and build a minimal embedded Linux image
- Interpret output artifacts (kernel/rootfs/bootloader)
- Apply basic customization and package integration

#### 1) Build systems overview
- **Buildroot:** simpler, faster, approachable for learning and many practical projects
- **Yocto:** highly flexible and powerful, but steeper complexity

#### 2) Buildroot architecture and workflow
Pipeline:
1. Get source
2. Select base configuration
3. Configure options
4. Build toolchain + packages + images
5. Collect final artifacts

#### 3) Configuration basics
- `make defconfig` for baseline setup
- `make menuconfig` for interactive customization
- Core choices: target architecture, toolchain, init system, filesystem image format

#### 4) First build and outputs
`make` produces images such as:
- Root filesystem
- Kernel image
- Bootloader-related artifacts

#### 5) Customization
- Add packages through menuconfig
- Use rootfs overlays for custom files
- Add post-build scripts
- Create custom packages with `.mk` and `Config.in`

#### 6) Practical exercise
Build a minimal ARM system for Raspberry Pi emulation including Python and SSH support.

#### Practice
```bash
make defconfig
make menuconfig
make
ls output/images
```

---

## Suggested Projects

1. Create a Bash monitor script for CPU/RAM with logging and >80% alerts.
2. Build an automated workspace backup script to remote/cloud storage.
3. Practice SSH remote command execution between two machines/VMs (or localhost).
4. Run full Raspberry Pi OS emulation in QEMU.
5. Optional: manage your Linux machine remotely from mobile (Termux + SSH).
6. Build and document a custom Buildroot image with Python + SSH.

---

## Contact the Author

- Email: khaledmhfz2004@gmail.com
- GitHub: https://github.com/KhaledMahfouz5/linux-course

## Copyright

All rights reserved for **hamakRobotTeam** [NOT For Commercial Use]!!
