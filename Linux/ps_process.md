# What is ps (`Process Status`)?
- Used to display all the running process in the linux system.

<br>

## Syntax
- `ps` [option]
- `ps` - Shows the process of current shell
  - `PID` - Unique Process ID
  - `TTY` - Terminal type of user logged in to
  - `TIME` - Amount of CPU in min and sec that process has been running
  - `CMD` - Name of the command that launched the process

<br>

## Most widely used command
- To see all the running processes
```
$ ps -e
$ ps -A

$ ps -ef        # For Full Format
```
<br>

- To see all the running process in BSD (`Berkley Software Distribution`) format. Ideally it gives you more information.
```
$ ps aux
```
<br>

- To see the process by username
```
$ ps -u <user_name>
$ ps -G <group_name>
```
<br>

- To see the process tree
```
$ ps -ejH
```