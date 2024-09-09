# What is file permission?
- File permissions in Linux determine who can read, write, or execute a file or directory. These permissions are crucial for maintaining the security and integrity of the system by controlling access to files and directories.

<br>
<br>

## Viewing Permissions
- You can view the files and directories with detailed information, sorted by modification time in ascending order (oldest to newest) with this `ls -ltr` command:
```
$ ls -ltr
drwxr-xr-x  4 rohan rohan 4096 Aug 24 21:12 Desktop
```
- Here, the first column (`drwxr-xr-x`) shows the permissions.

<br>

## File Permission Categories
- Permission are divided into three categories:

<br>

1. **User** (`Owner`): The person who owns the file.
2. **Group**: A set of users who share the same access privileges.
3. **Others**: All other users on the system.

<br>

## Permission Types
- For each category, there are three types of permissions:

<br>

1. **Read** (`r`): Allows viewing the contents of a file or listing the contents of a directory.
2. **Write** (`w`): Allows modifying a file or creating, renaming, and deleting files in a directory.
3. **Execute** (`x`): Allows executing a file (if it’s a script or program) or accessing a directory (like entering it with `cd`).

<br>

## Permission Representation
- Permissions are represented in two main ways:

<br>

1. **Symbolic Notation**: Uses characters to represent permissions.
- **Example**: `-rwxr-xr--`
  - `-`: Indicates a regular file (or `d` for directory).
  - `rwx`: The owner can read, write, and execute.
  - `r-x`: The group can read and execute.
  - `r--`: Others can only read.

<br>
<br>

2. **Numeric (`Octal`) Notation**: Uses numbers to represent permissions.
- Each permission is represented by a number:
  - `4` = Read
  - `2` = Write
  - `1` = Execute
- Combined permissions are represented by adding the numbers:
  - `7` = `rwx` (4+2+1)
  - `5` = `r-x` (4+1)
  - `4` = `r--` (4)
- Example: `chmod 755 file.txt` would set permissions to `rwxr-xr-x`.

<br>

## Modifying Permissions
- Permissions can be changed using the `chmod` command:

<br>

1. **Symbolic Mode**
- `chmod u+x file.txt` adds execute permission for the owner.
- `chmod g-w file.txt` removes write permission for the group.
- `chmod o=r file.txt` sets read-only permission for others.

<br>

2. **Numeric Mode**
- `chmod 644 file.txt` sets `rw-r--r--`.
- `chmod 755 file.txt` sets `rwxr-xr-x`.

<br>

## Special Permissions
1. **Setuid** (`s`): Allows users to run a file with the permissions of the file owner.
- **Setting Setuid:**
  - Symbolic: `chmod u+s filename`
  - Numeric: `chmod 4755 filename`

<br>

2. **Setgid** (`s`): Similar to Setuid but applies to the group. In directories, it makes new files inherit the group of the directory.
- **Setting Setgid:**
  - Symbolic: `chmod g+s directoryname`
  - Numeric: `chmod 2755 directoryname` 

<br>

3. **Sticky Bit** (`t`): Used on directories to allow only the owner to delete or rename files within the directory.
- **Setting Sticky Bit:**
  - Symbolic: `chmod +t directoryname`
  - Numeric: `chmod 1755 directoryname`

<br>

- These special permissions can be set using numeric values (e.g., `chmod 4755` to set Setuid) or with symbolic notation (e.g., `chmod u+s file.txt`).