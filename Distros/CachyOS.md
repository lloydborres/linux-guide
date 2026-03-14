## 1. Preparation

Download ISO
https://cachyos.org/download

## 2. Installation

Installation is straightforward.

## 3. Post Setup

### Asus Linux

Follow guide in https://asus-linux.org

### Secure Boot

https://wiki.cachyos.org/configuration/secure_boot_setup/

### Using TPM to unlock LUKS

https://wiki.archlinux.org/title/Systemd-cryptenroll

```bash title:"Double check hooks"
# The following should exist
# systemd
# sd-vconsole
# sd-encrypt

# It should look like this
HOOKS=(systemd autodetect microcode modconf kms keyboard sd-vconsole consolefont block sd-encrypt filesystems fsck)
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

```sh title:"Add the disk UUID here"
# Choose the btrfs UUID
root  UUID=XXXXXXXX-XXXX-XXXX-XXXX-XXXXXXXXXXXX  none  tpm2-device=auto
```

```bash
sudo mkinitcpio -P
```

### Bitwarden

```sh title:"Edit fish config"
nano .config/fish/config.fish
```

```sh title:"Add bitwarden SSH sock"
set -x SSH_AUTH_SOCK /home/$USER/.var/app/com.bitwarden.desktop/data/.bitwarden-ssh-agent.sock
```
