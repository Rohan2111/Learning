# What is Dmesg? (Display Message or Driver Message)
- Linux utility that displays kernel-related messages retrived from the kernel ring buffer.

<br>

## What is in kernel ring buffer?
- The ring buffer stores information about hardware, device driver initialization, and messages from kernel modules that take place during system startup.

<br>

## Key Feature of `dmesg`
- Display kernel-related messages during the system's boot process.
- Useful for diagnosing hardware issue, driver errors, or any system-related kernel logs.
- Message include information about device initialization, system hardware, kernel panic, and more.

<br>

## Usage and Common Commands
- Basic `dmesg` command:
  - Display the contents of the kernel ring buffer.
```
$ dmesg
```
<br>

- View output with `less`
  - Since the output can be long, you can pipe it through `less` for easier navigation.
```
$ dmesg | less
```
<br>

- Follow Kernel Message in Real-Time
  - For live Monitoring use `-w`
```
$ dmesg -w
```
<br>

- Clear the Kernel Ring Buffer
  - This can be useful if you want to start fresh without old messages cluttering the output.
```
$ dmesg -c
```
<br>

- Human-Readable
  - Use the `-H` (**human-readable**) option to display output in an easy-to-read format with color and structure
```
$ dmesg -H
```
<br>

- Timestamp
  - Use the `-T` (**timestamps**) option to show human-readable timestamps instead of seconds since boot.
```
$ dmesg -T
```
<br>

- Decode
  - Use the `-x` (**exclude extra info**) option to omit log levels, facility, and other metadata for cleaner output.
```
$ dmesg -x
```
<br>

- To filter the messages based on different level
```
$ dmesg -l emerg/alert/crit/err/warn/notice/info
```

## Dmesg Command
```
$ dmesg | grep <search_string>
```
- You can search related to
  - memory
  - usb
  - sda
  - ram
  - tty
  - error

