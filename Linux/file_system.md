# What is File System in Linux?
- OS store and manage data on disk or partitions using a structure called `Filesystem`. `Filesystem` includes files, directories, and it's related permissions.

<br>

# What is inode?
- An `inode` in Linux is a data structure that stores metadata about a file or directory. The `filesystem` uses the inode number to locate the inode, which then contains pointers to the data blocks where the actual file data is stored.

<br>

## Location/Path Format
### Windows
---
- `C:\Program Files\Java`

<br>

### Linux
---
- `/etc/folder`

<br>

## Types of File System
### ext3 (`Third Extended Filesystem`)
---
- Common in older Linux systems.
- Introduced journaling to enhance reliability.

<br>

### ext4 (`Fourth Extended Filesystem`)
---
- An improvement over ext3 with better performance, scalability, and reduced fragmentation.
- Widely used in modern Linux systems.

<br>

### XFS (`High Performance Scalable File System`)
---
- Ubuntu, Debian, Fedora, CentOS, RedHat
- High-performance file system with support for large files and parallel I/O.
- Ideal for handling large volumes and throughput.
- Enterprise servers, data-heavy applications.

<br>

### BtrFS (`B-tree Filesystem`)
---
- OpenSUSE and SUSE Linux Enterprise Server
- Focuses on advanced features like snapshots, dynamic subvolumes, and self-healing.
- Great for data integrity and large storage management.

<br>

### FAT (`File Allocation Table`)
---
- Old but simple and widely compatible with most operating systems.
- USB drives, flash memory, and devices requiring cross-platform compatibility (e.g., Windows, macOS, Linux).

<br>

## How to check your Linux Filesytem?
```
# Displays block devices with filesystem details.
$ lsblk -f

# Shows disk usage with human-readable sizes and filesystem types.
$ df -Th

# Lists filesystem mount points and options for boot.
$ cat /etc/fstab
```
<br>
<br>

# File System Structure
## / (`root`) Directory
- The Linux filesystem starts at the root directory, denoted by a single slash (`/`), from which all other files and directories branch out.

<br>

## `/bin` (Binary)
- Contains essential command binaries (executables) needed for system operation, like `ls`, `cp`, and `mv`.

<br>

## `/sbin` (System Binary)
- Contains essential system management programs like `ifconfig`, generally accessible only by the root user.

<br>

## `/boot` Directory
- Holds boot loader files, including the Linux kernel, bootloader configuration, and boot-related data.

<br>

## `/etc` (Configuration Files)
- Stores configuration files and scripts for system administration, like network settings, service files, and user accounts.

<br>

## `/home` Directory
- Contains user-specific files and directories. Each user has a subdirectory, like `/home/username`, for personal data and configurations.

<br>

## `/var` (Variable Data)
- Holds files that frequently change in size, such as log files, databases, and spool files like mail queues.

<br>

## `/tmp` (Temporary Files)
- Stores temporary files created by programs, often cleared on reboot.

<br>

## `/dev` (Device Files)
- Contains device files that represent hardware components like disks (`/dev/sda`), terminals, and USB devices.

<br>

## `/lib` (Libraries)
- Holds shared libraries and kernel modules needed by programs in `/bin` and `/sbin`.

<br>

## `/mnt` Directory
- Temporarily mounts filesystems or other media, often used for manually mounting devices.

<br>

## `/usr` (User Binaries and Data)
- Contains user programs, libraries, and documentation. Key subdirectories include `/usr/bin` for general user commands and `/usr/local` for locally installed software.

<br>

## `/proc` Directory
- A virtual filesystem that represents system and process information, providing details about system processes and resources.

<br>

## `/opt` Directory
- Intended for the installation of add-on application software packages. Large software packages that are not part of the default installation can be placed here to avoid cluttering the system directories.

<br>

## `/run` Directory
- A temporary filesystem that stores transient state files, like process IDs or lock files, since it is cleared and recreated at every boot.

<br>

## `/sys` Directory
- Similar to `/proc`, this is another virtual filesystem that provides an interface to the kernel. It contains information and settings about the system's devices, drivers, and some kernel features.

<br>

## `/svr` Directory
- Contains data which servers hosted on the system may need, such as web pages served by a web server.