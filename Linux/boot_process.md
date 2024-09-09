# Boot process of Linux
- BIOS -> MBR -> GRUB -> Kernel -> SystemD

<br>
<br>

# BIOS (`Basic Input/Output System`)
- First program that executed which is stored in read-only memory on motherboard of computer.
- Perform POST (**`Power-On Self-Test`**) verify the hardware components and peripheral to ensure if computer is in working condition.
- Check for bootable device like pendrive, hardisk etc.
- Handover control to first sector to device i.e. `MBR`
- **Apart from `BIOS`, UEFI (`Unified Extensible Firmware Interface`) is used.**

<br>
<br>

# MBR (`Master Boot Record`)
- **`512 Bytes`**, first sector of any bootable device contains machine code instruction to boot a machine and having following info:
  - Boot loader (**`446 Bytes`**)
  - Partition Table (**`64 Bytes`**)
  - Error Checking (**`2 Bytes`**)
- It will load the boot loader into the memory and handover to it.

<br>
<br>

# GRUB (`Grand Unified Bootloader`)
- Load `/boot/grub2/grub.cfg` at boot time.
- At this stage, User will see GUI asking different OS or kernel configured to boot.
- Once you selected the kernel, it locates the corresponding kernel binary.
```
/boot/vmlinuz-<kernel-version>
```
- Main job is to load kernel and `initrd/initramfs` image into memory.
- Once load kernel in RAM, it passes control to it.

<br>

```
In RHEL7

Default boot loader is GRUB2.
GRUB is for x86 architecture, it could be different for others arch like for Intel Itanium - ELILO.
```
<br>
<br>

# Kernel
- First kernel is loaded into read-only mode.
- `Initramfs/initrd` gets decompressed and then it first loads temporary file system.
- Initrd then detects and load the drivers from temporary filesystem to load actual file system.
- Mount other partitions like LVM, RAID etc. and unmount itself.
- Once main filesystem is mounted, kernel initialize the first process `init/SystemD`.
- You can find these images under `/boot` folder.

<br>
<br>

# SystemD 
- First service loaded with process ID 1
- Start all required processes
```
/etc/systemd/system/default.target
```
- To bring the system to the `run-level/target (0-6)`

<br>

```
# You can find the different runlevels files under
/usr/lib/systemd/system

ls -l runlevel*
```

<br>
<br>

# Targets
```
$ systemctl get-default
```
- To check the current default target (run-level)