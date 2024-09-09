# What is Type of files in linux?
- Files are categorized into different types based on their structure and purpose.

<br>

## Regular File (`-`)
- The most common file type, used to store text, data, binary, or program files.
- **Example:** Documents, scripts, images (e.g. `file.txt`, `image.jpg`).

<br>

## Directory File (`d`)
- A folder that contains other files or directories.
- **Example:** `/home`, `/etc`, `/var`

<br>

## Symbolic Link (`Symlink`) File (`l`)
- A shortcut or reference pointing to another file or directory.
- **Example:** `shortcut -> /path/to/target`

<br>

## Character Device File (`c`)
- Represents devices that handle data character by character (e.g., keyboards, serial ports).
- **Example:** `/dev/tty1`, `/dev/console`

<br>

## Block Device File (`b`)
- Represents devices that transfer data in blocks, like hard drives or USB drives.
- **Example:** `/dev/sda1`, `/dev/loop0`

<br>

## FIFO (Named Pipe) File (`p`)
- A special file for inter-process communication, allowing data to flow in a first-in, first-out manner.
- **Example:** Used in shell commands like mkfifo mypipe.

<br>

## Socket File (`s`)
- Used for communication between processes, often in network programming.
- **Example:** `/var/run/docker.sock`