# **Install Linux On Your Machine**

**25-11-2025**

## **Topics**

* **Choosing your distro**
  Link : `https://youtu.be/8yVlJEzq2eg?si=SWcgh_Bw51Li3lv6`

* **Install your Linux system**
  Link : `https://www.youtube.com/watch?v=C-a5IamFIuM`

* **Switch to Linux while keeping data from Windows / Dual-booting with Windows**
  Link : `https://youtu.be/XevGfO_vQJQ?si=OBqaM8UlUeH1wjdQ`

* **VirtualBox VM setup**
  Link : `https://youtu.be/wX75Z-4MEoM?si=raCzHOzYJy-GZi9S`

* **Post-install (drivers – firewall – backup and restore system)**
  Link : `https://mmbesar.github.io/Tutorials/Ubuntu-24.04-Post/`


---

# ## **1. Choosing Your Linux Distribution**

Before installing Linux, you must pick the right **distro** (distribution). Think of distros like different flavors of the same operating system — they all share the Linux kernel but differ in user interface, package managers, performance, and philosophy.

### **1.1 What You Should Look For**

When choosing a distro, consider:

| Requirement               | What it means                        | Good Choices                |
| ------------------------- | ------------------------------------ | --------------------------- |
| **Ease of use**           | Beginner-friendly UI, simple updates | Ubuntu, Linux Mint, Pop!_OS |
| **Stability**             | Fewer issues & long-term support     | Ubuntu LTS, Debian          |
| **Performance**           | Works well on older hardware         | Xubuntu, Linux Lite         |
| **Security**              | Good by default, strong community    | Fedora, Ubuntu              |
| **Software availability** | Access to apps & drivers             | Ubuntu, Fedora              |

### **1.2 Recommended Distro for Beginners**

**Ubuntu 24.04 LTS**
Reason: stable, popular, lots of tutorials, works on almost all laptops.

### **1.3 Quick Tips**

* If your PC is older than **10 years**, pick **Xubuntu** or **Linux Mint XFCE** or **MX-Linux** or **Zorin OS**.
* If you’re into **gaming**, choose **Pop!_OS** or **Nobara OS**.
* If you want a macOS-like UI, choose **elementaryOS**.
* Avoid Arch-based systems as your first Linux unless you're ready for deeper learning.

---

# ## **2. Installing Your Linux System**

In This section we will use Ubuntu 24.04 for Explaination .

---

## **2.1 Before You Install – VERY Important**

### **A. Backup Your Files**

The installer will delete the Windows partition if you're switching fully.
Backup all files from:

* Desktop
* Documents
* Pictures
* Music
* Videos

Move them to:

* D:\ (or another partition)
* External HDD
* USB stick

### **B. Check Your Boot Mode**

Open Start → type **System Information** → look for:

* **UEFI** → modern, secure boot
* **Legacy BIOS** → older systems

This affects partitioning and bootloader behavior.

### **C. Download the ISO**

* Ubuntu official website
* Size ~6 GB

### **D. Create a Bootable USB**

Recommended tool: **Ventoy**

* Supports multiple ISOs on the same flash drive
* Very beginner-friendly

---

## **2.2 Try Ubuntu Before Installing**

Boot from the USB and choose:

### **Try Ubuntu (Live Mode)**

You can test:

* Wi-Fi
* Bluetooth
* Sound
* Display
* Keyboard
* Touchpad

If everything works → safe to install.

---

# ## **3. Installing Linux (Manual Partitioning)**

This is the *critical* step — mistakes here delete data.

### **3.1 Choose Manual Installation**

DO NOT choose:

* “Erase disk and install Ubuntu”
* “Install alongside Windows” (unpredictable for beginners)

Instead, choose: **Something Else (Manual Partitioning)**

### **3.2 Identify Windows Partitions to Delete**

In the live session, open a terminal:

```bash
lsblk
```

You will see all disks:

* Windows system partitions
* Data partitions
* USB Ventoy
* Empty space

Delete only:

* The Windows partition (C drive)
* Windows system reserved partitions

**Never delete your data partitions.**

---

### **3.3 Creating Linux Partitions**

Recommended layout:

| Partition          | Size        | Filesystem | Mountpoint   | Notes                |
| ------------------ | ----------- | ---------- | ------------ | -------------------- |
| **EFI/System**     | 512–1024 MB | FAT32      | `/boot/efi`  | Needed only for UEFI |
| **ROOT**           | 40–100 GB+  | EXT4       | `/`          | Main system          |
| **SWAP**           | Optional    | (2–4 GB)   | swap         | Only if RAM < 8GB    |
| **Data (Windows)** | Keep        | NTFS       | `/mnt/data1` | Do *not* format      |

### Beginners Tip

Don’t create a separate `/home` partition.
You can add it later when you’re more experienced.

---

# ## **4. Switching to Linux While Keeping Data (Dual Boot)**

## **4.1 How Dual Boot Works**

Your disk will contain:

* Windows NTFS partitions
* Linux EXT4 partitions
* ESP (bootloader)
* Shared data partitions

GRUB bootloader will let you choose the OS at startup.

---

## **4.2 Before Dual Booting**

* Clean Windows (delete temp, uninstall unused programs)
* Run:

  ```
  chkdsk /f
  ```
* Disable Fast Startup in Windows
* Shrink Windows partition using *Disk Management*

---

## **4.3 Partition Strategy**

You will create:

* EFI partition (use existing one)
* Root partition
* (Optional) Swap partition

Mount Windows data partitions as:

```
/mnt/data1
/mnt/data2
```

**Never check the “format” box.**

---

## **4.4 Accessing Windows Files After Installation**

Open **Files → Other Locations → Ubuntu → mnt**.

Your data partitions appear there.

You can:

* Pin them
* Bookmark them
* Rename them

---

# ## **5. Installing Linux in VirtualBox (VM Setup)**

For students who don’t want to touch their main system .

---

## **5.1 Why a Virtual Machine?**

* Practice Linux commands safely
* Test configurations
* Use Linux tools on a Windows/macOS system
* No risk of data loss

---

## **5.2 Basic Requirements**

* CPU: Dual-Core
* RAM: 6–8 GB system → allocate 3–4 GB to VM
* Disk: 25–40 GB virtual disk
* GPU: Enable 3D Acceleration

---

## **5.3 Recommended VirtualBox Settings**

* **Chipset:** ICH9
* **EFI:** Enabled for Ubuntu 24.04
* **CPU:** 2 cores
* **Display:** 128 MB VRAM
* **Network:** Bridged Adapter (for networking labs)

---

## **5.4 Installing Guest Additions**

Inside VM → Devices → Insert Guest Additions CD

Run:

```bash
sudo apt install build-essential dkms linux-headers-$(uname -r)
sudo sh /media/username/VBox*/VBoxLinuxAdditions.run
```

This enables:

* Auto-resize display
* Clipboard sharing
* Drag & drop
* Better performance

---

# ## **6. Post-Installation Setup (Ubuntu 24.04)**

## **6.1 Update System**

```bash
sudo apt update && sudo apt upgrade -y
```

---

## **6.2 Install Ubuntu Restricted Extras**

Adds codecs for:

* MP3
* MP4
* MOV
* Fonts

```bash
sudo apt install ubuntu-restricted-extras
```

---

## **6.3 Add Flatpak + Flathub**

```bash
sudo apt install flatpak
flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo
```

Install Flatpak support in GNOME Software:

```bash
sudo apt install gnome-software gnome-software-plugin-flatpak
```

---

## **6.4 AppImage Support**

```bash
sudo apt install libfuse2
```

---

## **6.5 GNOME Extensions & Tweaks**

```bash
sudo apt install chrome-gnome-shell gnome-shell-extension-manager gnome-tweaks
```

---

## **6.6 Minimize on Click**

Classic:

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'minimize'
```

Newer behavior:

```bash
gsettings set org.gnome.shell.extensions.dash-to-dock click-action 'focus-minimize-or-appspread'
```

---

## **6.7 Enable New Document Menu**

```bash
touch ~/Templates/new
```

---

## **6.8 Keyboard Layout Switching**

Set:

```bash
gsettings set org.gnome.desktop.wm.keybindings switch-input-source "['<Shift>Alt_L']"
gsettings set org.gnome.desktop.wm.keybindings switch-input-source-backward "['<Alt>Shift_L']"
```

---

## **6.9 System Backups**

### **Timeshift** (System Snapshots)

```bash
sudo apt install timeshift
```

### **Déjà Dup** (User files backup)

Built into Ubuntu.

---

## **6.10 Final System Update**

```bash
sudo apt update && sudo apt upgrade -y && flatpak update -y && sudo snap refresh
```

---

# ## **Conclusion**

By the end of this session, students should be able to:

✔ Choose a Linux distro that fits their hardware and needs
✔ Install Linux safely and correctly
✔ Dual-boot without losing their Windows files
✔ Use Linux inside a Virtual Machine
✔ Apply essential post-install steps for performance, security, and usability

