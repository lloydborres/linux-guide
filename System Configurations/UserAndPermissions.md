# Users and Permissions

## Users

```bash title:"Add a user for samba if it does not exist"
sudo useradd <username>
```

```bash title:"Set a password for the user"
sudo passwd <username>
```

## User Groups

```bash title:"Add user to a group"
sudo usermod -aG groupname $USER
```

```bash title:"Add user to docker group"
sudo usermod -aG docker $USER
```

```bash title:"Check user's group"
group $USER
```

## File Permissions

```bash title:"Set file permission to only read and write for user"
chmod 600 .env
```

```bash title:"Set permission to all files and directories"
chmod -R 600 directory
```

### Permission Structure

For example `644`:

- First digit is for **owner**
- Second is for **group**
- Last is for **others**

| Permission | Description      | Breakdown                          |
| :--------: | :--------------- | :--------------------------------- |
|     7      | Full permissions | Read (4) + Write (2) + Execute (1) |
|     6      | Read and write   | Read (4) + Write (2)               |
|     5      | Read and execute | Read (4) + Execute (1)             |
|     4      | Read only        | Read (4)                           |
|     0      | No permission    |                                    |

```bash title:"Update owner and group for the file"
chown user:group
```

```bash title:"Make scripts executable"
chmod +x Scripts/script.sh
```
