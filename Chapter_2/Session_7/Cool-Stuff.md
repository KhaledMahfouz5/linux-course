# 📘 Cool Stuff on Linux — A Reference Guide for Adventurous Newcomers

*27-12-2025*

---

## 🔎 1) Research Skills & Problem Solving

**Goal:** Learn how to find answers fast when the terminal throws tantrums.
**What to do:**

* Search the **man pages** (`man rsync`, `man bash`) — the classic built-in Linux docs.
* Use `apropos`, `man -k`, `--help` flags.
* Stack Exchange (Unix & Linux) , distro forums and reddit are gold mines.
  **Tips:** always check dates & distro versions — old scripts can break what you have achieved.
  👉 Unix & Linux Q&A sorted by votes: *awesome community answers* ([Learn By Example][1])

---

## 🎥 2) Learn **FFmpeg**

FFmpeg is your **multimedia Swiss Army knife** — convert, cut, encode audio & video from the terminal.

📗 **Tutorial:** *Install and Use ffmpeg in Linux* — super clear with examples.
👉 [https://itsfoss.com/ffmpeg/](https://itsfoss.com/ffmpeg/) ([It's FOSS][2])
   **Main Documentation**
   [https://ffmpeg.org/ffmpeg.html](https://ffmpeg.org/ffmpeg.html)

**Basics:**

```bash
# convert an MKV to MP4
ffmpeg -i input.mkv output.mp4
```

Fun hack: use FFmpeg to record your screen or trim clips like a wizard. 🧙‍♂️

---

## 🔄 3) FOSS Alternatives for Common Software

Why pay or use closed source when Linux offers freedom (and bragging rights)?

**Check out:**

* LibreOffice → Office suite
* GIMP → Photoshop replacement
* Inkscape → vector graphics
* Blender → 3D beast
* Audacity → audio editing
* Krita → painting/art

👉 Neowin guide on top FOSS apps for Linux → [https://www.neowin.net/guides/top-10-foss-apps-to-make-your-linux-experience-more-enjoyable/](https://www.neowin.net/guides/top-10-foss-apps-to-make-your-linux-experience-more-enjoyable/) ([Neowin][3])
   
Also use **AlternativeTo.net** for more suggestions.

---

## 🎮 4) Run Windows Apps/Games with Bottles, Wine, Proton & Lutris

Welcome to **Windows software on Linux** land!

**Tech stack:**

* **Wine** — compatibility layer to run many Windows apps and games. ([Wikipedia][4])
* **Bottles** — GUI wineprefix & dependency manager. ([GamingOnLinux][5])
* **Proton** — Wine optimized for games, built into Steam. ([Wikipedia][6])
* **Lutris** — game launcher & scripts installer. ([Wikipedia][7])

📘 Tutorials & resources:

* Bottles + Wine on YouTube: [https://youtu.be/xGbQZt96q54?si=FgQJ__YMpISs7L1c](https://youtu.be/xGbQZt96q54?si=FgQJ__YMpISs7L1c) ([YouTube][8])
* Lutris: [https://youtu.be/JXHvGjiJJG0?si=1fI81xIr7zichNDy](https://youtu.be/JXHvGjiJJG0?si=1fI81xIr7zichNDy)
* ProtonDB (community compatibility data — must bookmark).

💡 Tip: Steam + Proton is often easiest for games; Lutris handles other launchers & installers.

---

## 💾 5) Learn **rsync**

**rsync** is a *super efficient* file sync tool — perfect for backups and transfers.

📗 **Guide:** DigitalOcean tutorial — concise, example-rich.
👉 [https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories](https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories) ([DigitalOcean][9])

   **Youtube Tutorial** 
   [Backing up a Linux Server with rsync](https://youtu.be/GqSxR93xK6E?si=c2TvpU8R-53SXDty)

**Key command patterns:**

```bash
# basic local sync
rsync -av /src/ /dest/

# remote sync
rsync -avz /src/ user@host:/dest/
```

Learn the difference trailing slash makes — it’s the “slash of power” 🗡️.

---

## 🤖 6) Using AI on Linux

AI tools are popping up everywhere — including Linux!

* GPT models locally: GPT4All, Ollama, etc.
* Online AI models.
* AI helpers can summarize logs, optimize scripts, and suggest commands.

**Notable tools:**

* GPT4All (local transformers)
* Ollama (local LLM host)
* Bard/ChatGPT in the browser

---

## 🛠️ 7) Install Common GUI Apps

Use `apt`, **Flatpak**, or **Snap**:

**APT (Debian/Ubuntu):**

```bash
sudo apt update
sudo apt install vlc gnome-tweaks
```

**Flatpak:**

```bash
sudo apt install flatpak
flatpak install flathub com.obsproject.Studio
```

**Snap:**

```bash
sudo apt install snapd
snap install spotify
```

*Snaps auto-update, are sandboxed, and sometimes bigger in size.* ([Linux Commando][10])

---

## 📦 8) Flatpak & Snap (Universal Packaging)

**Flatpak** — universal, distro-agnostic, sandboxed.
**Snap** — Canonical’s system with auto-updates and confinement.
Tutorial: Linux learning guide covers both package systems.

**Example commands:**

```bash
flatpak search editor
snap find browser
```

Pro tip: *Flatpak often has newer versions than distro repos.*

---

## 💻 9) Shell Aliases & Customizations

Aliases save time — like macros for your shell.

```bash
alias ll='ls -la'
alias gs='git status'
```

Add to `~/.bashrc` or `~/.zshrc` and `source ~/.bashrc` to reload.

You’ll thank yourself later when typing gets lazy 😊

---

## 🧰 10) Install & Configure Common Software

Here’s a quick starter pack for Ubuntu:

```bash
sudo apt update
sudo apt install \
    git htop tmux neofetch \
    gufw gnome-tweaks
```

Want a script? Store it in `setup.sh` and run `bash setup.sh`.

Also check **Perfect Ubuntu Guide** on GitHub for curated apps & setup tips.
👉 [https://github.com/mikeroyal/Perfect-Ubuntu-Guide](https://github.com/mikeroyal/Perfect-Ubuntu-Guide) ([GitHub][12])

---

## 🎨 11) Fonts & Themes

Make your desktop *pop*:

* Install custom fonts (`sudo apt install fonts-roboto`)
* GNOME Tweaks for themes
* Flatpak themes from Flathub

Fonts + themes = aesthetic ~100% more hipster points 😎

**Youtube Tutorial**
[https://mmbesar.github.io/Tutorials/Best-Arabic-Font-in-Linux/](https://mmbesar.github.io/Tutorials/Best-Arabic-Font-in-Linux/)

---

## 🚀 12) Cool Command Line Utilities

Let’s finish with **fun CLI tools** you’ll use all the time:

* `fzf` — fuzzy finder wizard
* `broot` — better directory tree explorer
* `bat` — cat with syntax highlighting
* `htop` / `btop` — fancy process views
* `ddgr` — DuckDuckGo in terminal

See a huge curated list of utilities (bookmarks worthy).
👉 [https://github.com/Tinram/Linux-Utilities](https://github.com/Tinram/Linux-Utilities) ([GitHub][13])
**Youtube Video**
[12 GREAT command line programs YOU recommended!](https://youtu.be/nCS4BtJ34-o?si=T6gagbT5k71H5BNE)

---

## 🐧 Wrap-Up

You now have a **jumpstart roadmap** for fun, practical, and beginner-friendly Linux exploration — with links to **quality tutorials** and docs. Dive in, google everything (searching is half the skill 😄), and don’t be afraid to break stuff — *that’s how mastery happens*.

If you want, I can turn this into a **multi-page PDF or structured course outline** next 🚀.

Happy hacking! 🧠💻

## Helpful Links
[1]: https://learnbyexample.github.io/scripting_course/Linux_curated_resources.html?utm_source=chatgpt.com "Linux CLI and Shell scripting | scripting_course"
[2]: https://itsfoss.com/ffmpeg/?utm_source=chatgpt.com "Install and Use ffmpeg in Linux [Complete Guide]"
[3]: https://www.neowin.net/guides/top-10-foss-apps-to-make-your-linux-experience-more-enjoyable/?utm_source=chatgpt.com "Top 10 FOSS apps to make your Linux experience more enjoyable - Neowin"
[4]: https://en.wikipedia.org/wiki/Wine_%28software%29?utm_source=chatgpt.com "Wine (software)"
[5]: https://www.gamingonlinux.com/2021/12/use-wine-for-gaming-on-linux-try-out-bottles/page%3D2/?utm_source=chatgpt.com "Use Wine for gaming on Linux? Try out Bottles | GamingOnLinux"
[6]: https://en.wikipedia.org/wiki/Proton_%28software%29?utm_source=chatgpt.com "Proton (software)"
[7]: https://en.wikipedia.org/wiki/Lutris?utm_source=chatgpt.com "Lutris"
[8]: https://www.youtube.com/watch?v=xrWSZXJbR2I&utm_source=chatgpt.com "How to setup Lutris & Bottles in 2025! (UPDATED GUIDE) - YouTube"
[9]: https://www.digitalocean.com/community/tutorials/how-to-use-rsync-to-sync-local-and-remote-directories?utm_source=chatgpt.com "How To Use Rsync to Sync Local and Remote Directories"
[10]: https://linuxcommando.blogspot.com/2018/?utm_source=chatgpt.com "Linux Commando: 2018"
[11]: https://learnezy.dev/posts/learn-linux-100-days/?utm_source=chatgpt.com "Learn linux in 100 days | LEARNEZY Guides"
[12]: https://github.com/mikeroyal/Perfect-Ubuntu-Guide?utm_source=chatgpt.com "GitHub - mikeroyal/Perfect-Ubuntu-Guide: Ubuntu Guide. Learn about getting your Ubuntu Desktop/Server ready for development. Including Ubuntu Security, Graphics (AMD/NVIDIA/Intel ARC), and Software Apps."
[13]: https://github.com/Tinram/Linux-Utilities?utm_source=chatgpt.com "GitHub - Tinram/Linux-Utilities: 'Useful' Linux programs/packages – personal reference list."

