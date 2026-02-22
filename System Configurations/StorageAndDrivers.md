# Storage and Drivers

```bash title:"Get drive information like UUID"
lsblk -lf
# or
sudo blkid
```

## Manually mounting a drive

```bash title:"Create a directory to mount the drive"
sudo mkdir /mnt/drivename
```

```bash title:"Mount drive"
sudo mount /dev/sda1 /mnt/drivename
```

## Auto-mounting a drive

```bash title:"Create a directory to mount the drive"
sudo mkdir /media/foldername
```

```bash title:"Edit the fstab file"
sudo nano /etc/fstab
```

```sample fstab
# Add at the end
UUID=<drive-uuid>   /media/foldername       ntfs    defaults        0       0
```

## Formatting a drive

```bash title:"Format a drive in ext4"
sudo mkfs.ext4 -L DriveName /dev/sdb
```

`L` - Add a label for the drive

```bash title:"Format a drive"
sudo shred -vzn 3 /dev/drivename
```

`v` - view what is happening
`z` - finishing the wipe will set everything to zero
`n` - number of the shred will be ran
