# What is system monitoring in linux?
- System monitoring in Linux involves tracking the performance, health, and usage of system resources such as CPU, memory, disk, and network. It helps in identifying issues, optimizing performance, and ensuring the smooth operation of a system.

<br>

## CPU Usage Monitoring
- `top`: Display real-time system information, including CPU usage, memory usage, and running process
```
$ top
```
<br>

- `htop`: A more interactive and user-friendly version of top, offering color-coding and a better interface.
```
$ htop
```
<br>

- `mpstat`: Reports CPU usage, providing details on how much time the CPU spends on user processes, system processes, idle, etc.
```
$ mpstat
```
<br>

## Memory Usage Monitoring
- `free`: Shows the total amount of free and used memory in the system, including swap space.
```
$ free -h                               # The -h option provides human-readable output
```
<br>

- `vmstat`: Provides information about system processes, memory, paging, block I/O, traps, and CPU activity.
```
$ vmstat 1                              # Refreshes every second
```
<br>

## Disk Usage Monitoring
- `df`: Reports file system disk space usage.
```
$ df -h                                 # The -h option provides human-readable output
```
<br>

- `du`: Estimates file space usage in a directory.
```
$ du -sh /path/to/directory             # The -sh option provides a summary in human-readable form
```
<br>

- `iostat`: Provides statistics for CPU usage and I/O devices like hard disks.
```
$ iostat -x 1                           # Detailed statistics with 1-second interval
```
<br>

## Network Usage Monitoring
- `ifconfig`: Displays network interface configuration, including IP addresses and data traffic.
```
$ ifconfig
```
<br>

- `netstat`: Provides networking statistics like active connections, routing tables, interface statistics, masquerade connections, and multicast memberships.
```
$ netstat -tulnp                        # Shows listening ports with TCP/UDP and addresses
```
<br>

- `nload`: Visualizes incoming and outgoing network traffic separately.
```
$ nload
```
<br>

## Process Monitoring
- `ps`: Lists currently running processes
```
$ ps aux                                # Displays detailed information about all running processes
```
<br>

- `pidstat`: Monitors individual tasks currently being managed by the Linux kernel.
```
$ pidstat -u 1                          # Reports CPU usage of each process every second
```
<br>

## System Logs Monitoring
- `dmesg`: Displays kernel ring buffer messages, useful for debugging hardware-related issues
```
$ dmesg
```
<br>

- `tail`: Monitors log files in real-time
```
$ tail -f /var/log/syslog               # Real-time monitoring of the syslog file
```
<br>

## System Load Monitoring
- `uptime`: Shows how long the system has been running, the number of users, and the system load averages.
```
$ uptime
```
<br>

- `sar`: Collects, reports, and saves system activity information
```
$ sar -u 1                              # Reports CPU usage every second
```
<br>

## Temperature Monitoring
- `sensors`: Displays the temperature of the CPU and other hardware components
```
$ sensors
```
<br>

## Advanced Monitoring Tools
- `Nagios`: A powerful tool for monitoring system, network, and infrastructure health.

<br>

- `Zabbix`: Another advanced monitoring tool, often used in enterprise environments for monitoring servers, networks, and applications.