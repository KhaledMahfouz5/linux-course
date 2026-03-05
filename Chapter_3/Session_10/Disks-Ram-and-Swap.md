# Session 10 - Managing Disks, RAM Usage, and Swap on Linux

> 02-03-2026

# 1️⃣ Why This Session Matters

Before we touch commands, understand this:

* Your **disk** stores data permanently.
* Your **RAM** is fast temporary memory.
* **Swap** is emergency backup memory.
* **zram** is compressed RAM swap (smart trick for low-memory systems).

If you understand this session, you’ll:

* Mount extra drives safely
* Fix broken boot issues
* Add a second disk like a pro
* Understand RAM pressure
* Boost low-RAM machines using zram

This is not theory. This is real Linux power.

---

# 2️⃣ Checking If `zram-tools` Is Installed

On Debian/Ubuntu/Mint, zram is handled by:

```bash
sudo apt install zram-tools
```

To check if it's installed:

```bash
dpkg -l | grep zram
```

To check if it's active:

```bash
swapon --show
```

If you see something like `/dev/zram0`, it’s working.

To check service status:

```bash
systemctl status zramswap
```

---

# 3️⃣ Understanding Your Disks

Let’s meet your disks.

## 🔍 `lsblk` — The Disk Tree Viewer

```bash
lsblk
```

Example output:

```
sda
├─sda1
├─sda2
└─sda3
sdb
└─sdb1
```

### What it shows:

* Disk names (`sda`, `sdb`)
* Partitions (`sda1`, `sda2`)
* Mount points
* Size
* Type

More detailed output :

```bash
lsblk -f
```

This shows:

* Filesystem type (ext4, vfat, ntfs)
* UUID
* Mountpoint

🔥 Use this before and after plugging a USB.

---

## `blkid` — UUID Finder

```bash
sudo blkid
```

It shows something like:

```
/dev/sda1: UUID="1A2B-3C4D" TYPE="vfat"
```

Why important?

Because in `/etc/fstab`, we use **UUID**, not `/dev/sda1`.

Why?

Because device names can change on boot. UUID never lies.

---

# 4️⃣ Mounting and Unmounting Drives

Unlike Windows , Linux does not auto-use disks unless mounted.

## 📂 Manual Mount

Step 1 — Create mount point:

```bash
sudo mkdir /mnt/mydrive
```

Step 2 — Mount:

```bash
sudo mount /dev/sdb1 /mnt/mydrive
```

Step 3 — Check:

```bash
ls /mnt/mydrive
```

---

## 🔓 Unmount

```bash
sudo umount /mnt/mydrive
```

OR

```bash
sudo umount /dev/sdb1
```

⚠️ If busy error:

```bash
lsof | grep sdb1
```

---

# 5️⃣ Making Mount Permanent — Editing `/etc/fstab`

This file controls what mounts at boot.

Open it:

```bash
sudo nano /etc/fstab
```

Example entry:

```
UUID=1a2b3c4d-xxxx-xxxx-xxxx-xxxxxxxxxxxx  /mnt/mydrive  ext4  defaults  0  2
```

Columns explained:

| Column      | Meaning           |
| ----------- | ----------------- |
| UUID        | Disk identifier   |
| Mount point | Where it appears  |
| Filesystem  | ext4, ntfs, vfat  |
| Options     | defaults, noatime |
| Dump        | usually 0         |
| fsck order  | usually 2         |

---

## 🧪 Test Before Reboot

After editing:

```bash
sudo mount -a
```

If no errors → safe to reboot.

If error → FIX IT before rebooting.

---

## 🎯 Practical Example: Adding Second Drive

[mmbesar-2nd-drive](https://mmbesar.github.io/Tutorials/2nd-drive/)

---

# 6️⃣ Monitoring RAM Usage

RAM = short-term memory.

## 🧠 `free`

```bash
free -h
```

Example:

```
              total   used   free  shared  buff/cache  available
Mem:           7.6G   3.1G   1.2G     500M     3.3G       3.8G
Swap:          2.0G   0B     2.0G
```

Important columns:

* **used** → currently used
* **available** → real usable memory
* **buff/cache** → Linux using RAM smartly

⚠️ Linux uses RAM aggressively. That’s GOOD.

Unused RAM = wasted RAM.

---

## 🧠 Real-time View

```bash
watch -n 1 free -h
```

Updates every second.

---

# 7️⃣ Understanding Swap

Swap = disk used as overflow memory.

When RAM fills up → inactive pages move to swap.

But swap is slower than RAM.

Check swap:

```bash
swapon --show
```

or

```bash
cat /proc/swaps
```

---

# 8️⃣ Creating a Swap File (Manual Way)

If no swap exists:

Step 1:

```bash
sudo fallocate -l 2G /swapfile
```

Step 2:

```bash
sudo chmod 600 /swapfile
```

Step 3:

```bash
sudo mkswap /swapfile
```

Step 4:

```bash
sudo swapon /swapfile
```

Make permanent:

Add to `/etc/fstab`:

```
/swapfile none swap sw 0 0
```

---

# 9️⃣ zram — Compressed RAM Swap

zram creates compressed swap in RAM.

Instead of writing to disk:

* It compresses pages
* Stores them in RAM
* Faster than disk swap

Great for:

* 4GB RAM laptops
* Old machines
* Low-resource VPS

---

## Install on Debian/Ubuntu/Mint

```bash
sudo apt install zram-tools
```

Check config:

```bash
cat /etc/default/zramswap
```

You can adjust:

```
PERCENT=70 
```

Meaning: use 70% of RAM for zram.
You can change it but it is recommended to adjust it to [70%-80%].

Restart:

```bash
sudo systemctl restart zramswap
```

Check:

```bash
swapon --show
```

You should see `/dev/zram0`.

🎯 Checkout This Practical Example in the link below :
[mmbesar-RAM-SWAP-ZRAM](https://mmbesar.github.io/Tutorials/RAM-SWAP-ZRAM/)

---

# 🔬 Swap vs zram Comparison

| Feature     | Disk Swap     | zram    |
| ----------- | ------------- | ------- |
| Speed       | Slow          | Faster  |
| Uses disk   | Yes           | No      |
| Best for    | Large systems | Low RAM |
| Compression | No            | Yes     |

Best practice for laptops:

* Use zram
* Keep small disk swap

---

# 🔟 Troubleshooting Boot Failures (fstab Mistakes)

If system won’t boot:

1. Boot into recovery mode
2. Mount root
3. Edit `/etc/fstab`
4. Fix or comment broken line

Pro tip:

Use this option in fstab for external drives:

```
nofail
```

So system doesn’t panic if drive missing.

---

# 1️⃣1️⃣ Useful Extra Commands

Check disk usage:

```bash
df -h
```

Check disk space by folder:

```bash
du -sh *
```

See mount points:

```bash
mount | grep sdb
```

---

# 🧪 Practical Lab Exercises

### Exercise 1

Plug USB → identify it using `lsblk`.

### Exercise 2

Mount it manually in `/mnt/testusb`.

### Exercise 3

Make it permanent in fstab.

### Exercise 4

Create 1GB swap file.

### Exercise 5

Install zram and compare swap usage.

---

# 🎥 Suggested Video References

* [https://www.youtube.com/watch?v=yWuHI7uoftY](https://www.youtube.com/watch?v=yWuHI7uoftY)
* [https://youtu.be/CPvJvY79vEw](https://youtu.be/CPvJvY79vEw)

(You should watch after hands-on practice.)

---

# 🏁 Final Advice

Disk and memory management is not optional knowledge.

It’s what separates:

* “Linux user”
  from
* “Linux operator”

Break things in a VM.
Test everything with `mount -a`.
Never reboot blindly after editing fstab.

You’re building serious Linux skills now.
