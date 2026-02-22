# Arch Linux

My personal guide to install Arch in an RoG Zephyrus G14 2020.

Official website: https://archlinux.org

## 1. Preparation

Download ISO
https://archlinux.org/download

## 2. Installation

```bash title:"Connect to a WiFi network"
iwctl --passphrase 'wifi password' station wlan0 connect "wifi ssid"
```

```bash title:"Start archinstall"
archinstall
```

## 3. Post Setup

```bash title:"Fix installing some packages freeze by disabling udev hook"
cd /usr/share/libalpm/hooks
```

```bash title:"Disable udev hook"
sudo mv 30-systemd-udev-reload.hook 30-systemd-udev-reload.hook.disable
```

```bash title:"Enable udev hook"
sudo mv 30-systemd-udev-reload.hook.disable 30-systemd-udev-reload.hook
```

Edit `/etc/pacman.conf` and uncomment `[multilib]` portion. Then run `sudo pacman -Syu`

```bash title:"Install Nvidia drivers"
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils
```

### ROG Control

https://asus-linux.org

```bash
sudo pacman-key --recv-keys 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --lsign-key 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
sudo pacman-key --finger 8F654886F17D497FEFE3DB448B15A6B0E9A3FA35
```

```bash
nano /etc/pacman.conf
```

```bash
# Add the at the end
[g14]
Server = https://arch.asus-linux.org
```

```bash
sudo pacman -Syu
```

```bash
sudo pacman -S asusctl power-profiles-daemon rog-control-center

systemctl enable --now power-profiles-daemon.service
```

### Other Packages

Install the packages via `pacman`

- `ufw` - Firewall
- `base-devel git less` - For AUR and Git
- `docker docker-compose` - Docker
- `libreoffice-still` - Office
- `steam` - Games
- `pacman-contrib` - For paccache

### AUR

```bash title:"Clone AUR"
git clone <url>
```

```bash title:"Install via AUR"
makepkg -si
```

### AUR Packages

Install the following

- https://aur.archlinux.org/packages/vscodium-bin

### Using TPM to unlock LUKS

https://wiki.archlinux.org/title/Systemd-cryptenroll

```bash
sudo pacman -S tpm2-tss
```

```bash title:"List the keyslots"
sudo systemd-cryptenroll /dev/nvme0n1p2
```

```bash
sudo nano /etc/mkinitcpio.conf
```

```bash
# Edit the following
# Replace base udev to systemd
# Replace keymap to sd-vconsole
# Replace encrypt to sd-encrypt

# It should look like this
HOOKS=(systemd autodetect microcode modconf kms keyboard sd-vconsole consolefont block sd-encrypt filesystems fsck)
```

```bash
sudo mkinitcpio -P
```

```bash title:"Enroll key to TPM and LUKS volume"
sudo systemd-cryptenroll --tpm2-device=auto --tpm2-pcrs=7 /dev/nvme0n1p2
```

```bash title:"Get the UUID of disk"
lsblk -f
```

```bash
sudo nano /etc/crypttab.initramfs
```

```title:"Add the disk UUID here"
root  UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  none  tpm2-device=auto
```

```bash
sudo mkinitcpio -P
```

### Steam

https://github.com/GloriousEggroll/proton-ge-custom
https://www.protondb.com

### Affinity

https://github.com/seapear/AffinityOnLinux/blob/main/Guides/Bottles/Guide.md

## Other

```bash title:"Cleanup uninstalled packages"
sudo paccache -ruk0
```
