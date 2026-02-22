# Debian

My personal guide to install Debian for my headless server.

Official website: https://www.debian.org

## 1. Preparation

Download ISO
https://www.debian.org/distrib

## 2. Installation (Debian 13)

```
nano /etc/apt/sources.list
```

```
# Packages from usb
# deb [trusted=yes] file:/mnt/usb trixie main non-free-firmware contrib non-free
```

```
sudo apt install network-manager

sudo systemctl enable NetworkManager
sudo systemctl start NetworkManager

systemctl status NetworkManager
```

```
nmtui
```

```
ipaddr
```

## 3. Post Setup

### SSH Hardening

This will disable password login and use public keys for login instead.

```bash title:"Edit SSH Configs"
sudo nano /etc/ssh/sshd_config
```

```title:"Update the following in sshd_config"
Port 2233
PermitRootLogin no
PubkeyAuthentication yes
PasswordAuthentication no
```

```bash title:"Add public keys here"
mkdir .ssh
nano .ssh/authorized_keys
```

```bash title:"Restart SSHD"
sudo systemctl restart sshd
```

### Updating Package Source List

```title:"Add the following in /etc/apt/sources.list"
## If you want access to contrib and non-free components,   
## add " contrib non-free" after every "non-free-firmware" in this file:   
deb https://deb.debian.org/debian trixie main non-free-firmware contrib non-free   
deb-src https://deb.debian.org/debian trixie main non-free-firmware contrib non-free

deb https://security.debian.org/debian-security trixie-security main non-free-firmware contrib non-free
deb-src https://security.debian.org/debian-security trixie-security main non-free-firmware contrib non-free

deb https://deb.debian.org/debian trixie-updates main non-free-firmware contrib non-free
deb-src https://deb.debian.org/debian trixie-updates main non-free-firmware contrib non-free
```

### Docker

https://docs.docker.com/engine/install/debian

### Firewall

```bash title:"Allow SSH port and enable UFW"
sudo ufw allow 2222
sudo ufw enable
sudo systemctl enable --now ufw
```

```bash title:"Checking status and deleting a rule"
sudo ufw status numbered
sudo ufw delete 2
```

### CRON

```bash title:"Edit cron jobs"
sudo crontab -e
```

```title:"Add the following cron job to shutdown everyday at 1 AM"
0 1 * * * shutdown -h now
```
