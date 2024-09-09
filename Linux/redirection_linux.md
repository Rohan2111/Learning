# What is Redirection in linux?
- Redirection in Linux refers to the process of sending the output of commands (like `stdout`) or the input (like `stdin`) to different locations. By default, most Linux commands read input from the keyboard and send output to the terminal screen. Redirection allows you to manipulate this behavior to direct input or output to/from files, other commands, or devices.

<br>

## File Descriptors
- In Linux, a file descriptor is an integer that represents an open file. There are Three Standards file descriptors:
1. Standard Input (`stdin`):    File descriptor 0
2. Standard Output (`stdout`):  File descriptor 1
3. Standard Error (`stderr`):   File descriptor 2
- These descriptors help the system understand where to send or receive data.

<br>

## Type of Redirections
### Standard Output (`stdout`) Redirection:
---
- Output of a command is shown on terminal
```
command > file
```
- **Example:** Redirecting the output of `ls` to a file called `output.txt`
```
ls > output.txt
```
- **Note:** Using a single `>` overwrites the file. If you want to append data to the file instead of overwriting, use `>>`:
```
command >> file
```
<br>

### Standard Input (`stdin`) Redirection:
---
- This takes input from a file instead of the keyboard.
```
command < file
```
- **Example:** Redirecting the contents of `input.txt` as input to the `cat` command
```
cat < input.txt
```
<br>

### Standard Error (`stderr`) Redirection:
---
- If any command gives you error then it is considered as stderr - 2
```
command 2> file
```
- **Example:** Redirecting error messages from a command to `error.log`
```
ls non_existent_file 2> error.log
```
<br>

### Redirecting (`stdout`) and (`stderr`) Together:
---
- Sometimes, you may want to redirect both normal output and error messages to the same file.
```
command > file 2>&1
```
- **Example:** Redirecting both output and errors from `ls` to a single file
```
ls > output.log 2>&1
```
<br>

### Use Cases
---
- Merging multiple files into a single file
```
cat file1 file2 > file3
```
<br>

- Split a big file into a small file with relevant data
```
grep keyword filename > keyword_filename
```
<br>

