# Arch Linux

My personal guide to install Arch in an RoG Zephyrus G14 2020.

Official website: https://archlinux.org

## 1. Preparation

Download ISO: https://archlinux.org/download

## 2. Installation

Connect to a WiFI network

```bash
iwctl --passphrase 'wifi_password' station wlan0 connect "wifi_ssid"
```

Install Arch Linux

```bash
archinstall
```

## 3. Post Setup

When installing via pacman, sometimes the system freezes around udev hook. Disabling the following before installation seems to fix the issue. Re-enable and restart after installing.

```bash
cd /usr/share/libalpm/hooks
```

```bash
sudo mv 30-systemd-udev-reload.hook 30-systemd-udev-reload.hook.disable
```

```bash
sudo mv 30-systemd-udev-reload.hook.disable 30-systemd-udev-reload.hook
```

Nvidia Drivers

```bash
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
sudo nano /etc/pacman.conf
```

```bash
# Editing /etc/pacman.conf

# Uncomment [multilib]

# Add the following
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

Install the packages via `pacman`

- `git`
- `docker docker-compose`
- `libreoffice-still`
- `steam`

### AUR

```bash
git clone <url>
```

```bash
makepkg -si
```

Install the following

- https://aur.archlinux.org/packages/vscodium-bin
