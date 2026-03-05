# 🧑‍💻 Software Development on Linux

### A Practical Reference Guide (Debian / Ubuntu)

---

## 0. Before We Start (Mindset & Setup)

Linux for software dev is about **three ideas**:

1. Everything is a tool
2. The terminal is your superpower
3. You *own* your system

Update first. Always.

```bash
sudo apt update && sudo apt upgrade -y
```

Install the essentials:

```bash
sudo apt install -y build-essential curl wget git software-properties-common
```

> 📚 Docs:

* [https://wiki.debian.org/Apt](https://wiki.debian.org/Apt)
* [https://help.ubuntu.com/community/AptGet/Howto](https://help.ubuntu.com/community/AptGet/Howto)

---

## 1. Compiling Suckless Tools (st, dmenu)

Suckless tools are **minimal, fast, and opinionated**. You compile them yourself. No training wheels.

### Install dependencies

```bash
sudo apt install -y libx11-dev libxft-dev libxinerama-dev
```

### Clone and build `st` (simple terminal)

```bash
git clone https://git.suckless.org/st
cd st
sudo make install clean
```

Same idea for `dmenu`:

```bash
git clone https://git.suckless.org/dmenu
cd dmenu
sudo make install clean
```

> 🔥 Pro tip: You *edit config.h and recompile*. That’s the suckless way.

📚 Official docs:

* [https://suckless.org/st/](https://suckless.org/st/)
* [https://suckless.org/dmenu/](https://suckless.org/dmenu/)

---

## 2. Run a Simple Server & Share Files

### Python HTTP server (the classic)

```bash
python3 -m http.server 8000
```

Now anyone on your network can access:

```
http://YOUR_IP:8000
```

> Warning : http.server is not recommended for production. It only implements basic security checks.

### Node.js quick server

```bash
npx serve .
```

📚 Docs:

* [https://docs.python.org/3/library/http.server.html](https://docs.python.org/3/library/http.server.html)
* [https://www.npmjs.com/package/serve](https://www.npmjs.com/package/serve)

---

## 3. PHP & XAMPP (Yes, PHP Still Exists 😄)

> Choose One of the following ways below

### Install PHP

```bash
sudo apt install -y php php-cli php-mysql
```

Run a PHP dev server:

```bash
php -S localhost:8000
```

### XAMPP (All-in-One)

Download from Apache Friends:

* [https://www.apachefriends.org/index.html](https://www.apachefriends.org/index.html)

Install:

```bash
chmod +x xampp-linux-*-installer.run
sudo ./xampp-linux-*-installer.run
```

Start it:

```bash
sudo /opt/lampp/lampp start
```

📚 Docs:

* [https://www.php.net/manual/en/](https://www.php.net/manual/en/)
* [https://www.apachefriends.org/faq_linux.html](https://www.apachefriends.org/faq_linux.html)

---

## 4. Node.js & Your First React App

### Install Node.js (LTS)

```bash
# Download and install nvm:
curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash

# in lieu of restarting the shell
\. "$HOME/.nvm/nvm.sh"

# Download and install Node.js:
nvm install 24
```

Verify:

```bash
# Verify the Node.js version:
node -v # Should print "v24.12.0".

# Verify npm version:
npm -v # Should print "11.6.2".
```

### Create a React app

```bash
npx create-react-app my-app
cd my-app
npm start
```

Boom. Browser opens. Magic.

📚 Docs:

* [https://nodejs.org/en/docs](https://nodejs.org/en/docs)
* [https://react.dev/learn](https://react.dev/learn)

---

## 5. Java Basics on Linux

### Install OpenJDK

```bash
sudo apt install default-jdk
```

You can also install specific versions of OpenJDK (e.g., Java 11 or Java 21) by searching and choosing the one you need:

```bash
apt search openjdk
sudo apt install openjdk-11-jdk
```

Verify:

```bash
java -version
javac -version
```

### Hello World (because tradition)

```java
public class Hello {
    public static void main(String[] args) {
        System.out.println("Hello Linux");
    }
}
```

Compile & run:

```bash
javac Hello.java
java Hello
```

📚 Docs:

* [https://openjdk.org/](https://openjdk.org/)
* [https://docs.oracle.com/javase/tutorial/](https://docs.oracle.com/javase/tutorial/)

---

## 6. Browsers, VS Code & Arduino IDE

### Browsers

```bash
sudo apt install -y firefox
```

Chrome:

* [https://www.google.com/chrome/](https://www.google.com/chrome/)

### VS Code

Download from VS Code official website :

* [https://code.visualstudio.com/](https://code.visualstudio.com/)

### Arduino IDE

```bash
sudo apt install -y arduino
```

📚 Docs:

* [https://code.visualstudio.com/docs/setup/linux](https://code.visualstudio.com/docs/setup/linux)
* [https://docs.arduino.cc/](https://docs.arduino.cc/)

---

## 7. Compilers & Debugging Tools

### C/C++

```bash
sudo apt install -y gcc g++ gdb 
```

Compile:

```bash
gcc main.c -o main
```

Debug:

```bash
gdb ./main
```

📚 Docs:

* [https://gcc.gnu.org/onlinedocs/](https://gcc.gnu.org/onlinedocs/)
* [https://www.gnu.org/software/gdb/documentation/](https://www.gnu.org/software/gdb/documentation/)

---

## 8. Makefiles & AVR Toolchain

### Makefile basics

```makefile
all:
	gcc main.c -o main
```

Run:

```bash
make
```

### AVR toolchain

```bash
sudo apt install -y avr-libc avrdude gcc-avr
```

### Helper Makefile to compile AVR code

```makefile
#MCU name
MCU = atmega16

# CPU frequency
F_CPU = 8000000UL

# Compiler and tools
CC = avr-gcc
OBJCOPY = avr-objcopy
SIZE = avr-size
DIR = build

# Source file
SRC = main.c

# Output files
TARGET = main
ELF = $(DIR)/$(TARGET).elf
HEX = $(DIR)/$(TARGET).hex
# Compiler flags
CFLAGS = -mmcu=$(MCU) -DF_CPU=$(F_CPU) -Os

hex: $(HEX)
elf: $(ELF)

$(ELF): $(SRC)
	mkdir -p $(DIR)
	$(CC) $(CFLAGS) -o $@ $^

$(HEX): $(ELF)
	$(OBJCOPY) -O ihex -R .eeprom $< $@
	$(SIZE) $<

clean:
	rm -rf build/

.PHONY: hex elf clean
```

Used for Arduino & AVR microcontrollers.

Run:

```bash
make elf # make elf binary
make hex # make hex binary
make clean # remove build/ directory
```

📚 Docs:

* [https://www.gnu.org/software/make/manual/](https://www.gnu.org/software/make/manual/)
* [https://www.nongnu.org/avr-libc/](https://www.nongnu.org/avr-libc/)

---

## 9. Python, pip & virtual environments

### Install Python

```bash
sudo apt install -y python3 python3-pip python3-venv
```

### Virtual environment (DO THIS)

```bash
python3 -m venv venv
source venv/bin/activate
```

Install packages:

```bash
pip install requests bs4
```

📚 Docs:

* [https://docs.python.org/3/tutorial/venv.html](https://docs.python.org/3/tutorial/venv.html)
* [https://pip.pypa.io/en/stable/](https://pip.pypa.io/en/stable/)

---

## 10. AppImage & Desktop Shortcuts

Run AppImage:

```bash
chmod +x MyApp.AppImage
./MyApp.AppImage
```

### Desktop shortcut

Create:

```bash
~/.local/share/applications/myapp.desktop
```

```ini
[Desktop Entry]
Name=My App
Exec=/path/MyApp.AppImage
Type=Application
Icon=/path/icon.png
```

📚 Docs:

* [https://docs.appimage.org/](https://docs.appimage.org/)

   Helping Tutorial:

* [mmbesar](https://mmbesar.github.io/Tutorials/appimages/)

---

## 11. Update System & Change Repositories

Edit sources:

```bash
sudo nano /etc/apt/sources.list
```

Update:

```bash
sudo apt update && sudo apt upgrade
```

📚 Docs:

* [https://wiki.debian.org/SourcesList](https://wiki.debian.org/SourcesList)
* [https://help.ubuntu.com/community/Repositories](https://help.ubuntu.com/community/Repositories)

---

## 12. Kali Repositories (⚠️ Read This)

**Don’t mix Kali repos with Ubuntu casually.**
You *will* break things.

Safe use case: **specific tools only**.

```bash
deb http://http.kali.org/kali kali-rolling main non-free contrib
```

Use pinning if you *must*.

📚 Docs:

* [https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/](https://www.kali.org/docs/general-use/kali-linux-sources-list-repositories/)

   Helping Tutorial :

* [Adding Kali linux repos to debian distros](https://youtu.be/YI1Q3R0TEYs?si=TO3KfOz4nq0sSIVw)

---

## 13. Distrobox (Run Any Distro Safely)

```bash
sudo apt install -y podman
```

Create container:

```bash
distrobox create -n arch --image archlinux:latest
distrobox enter arch
```

Now you’re in another distro. No VM. No pain.

📚 Docs:

* [https://distrobox.it/](https://distrobox.it/)

---

## 14. Docker & Containers 🐳

### Install Docker

```bash
sudo apt install -y docker.io
sudo usermod -aG docker $USER
newgrp docker
```

Test:

```bash
docker run hello-world
```

Run a container:

```bash
docker run -it ubuntu bash
```

📚 Docs:

* [https://docs.docker.com/engine/install/ubuntu/](https://docs.docker.com/engine/install/ubuntu/)

   Helping Tutorial :

* [Home Server - Install and Use Docker](https://mmbesar.github.io/Tutorials/HS-Docker/)

---

## Where to Go Next 🚀

* Build a dotfiles repo
* Learn `tmux`
* Automate with bash
* Read man pages (yes, really)
