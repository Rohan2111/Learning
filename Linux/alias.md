# What is Alias in linux?
- An alias is a shortcut or a custom command that allows you to replace a long or complex command with a simpler, more memorable one. Aliases are used to save time and improve productivity by automating repetitive tasks. In Linux, an alias is a shortcut or alternative name that can be assigned to a command or a sequence of commands. Aliases allow users to create custom commands or modify existing ones, making the command line more efficient and personalized.

<br>

## Syntax of alias
```
$ alias short_name='your command'

# Example
$ alias l='ls -ltr'
```
<br>

## To check alias (Alredy exist or Newly created)
```
$ alias -p
```
<br>

## Use Case of alias
### Customizing Commands
```
$ alias grep='grep --color=auto'

# This alias ensures that your grep output is always color-highlighted.
```
<br>

### Shortening Lengthy Commands
```
$ alias duh='du -h --max-depth=1'

# This alias allows you to quickly check the disk usage of directories in a human-readable format with a simple duh command.
```
<br>

### Navigating Directories
```
$ alias myscript='cd /home/rohan/Documents/Production_Scripts/Bash_Script'

# Typing myscript will take you directly to the path you given in alias
```
<br>

### Personalzing Commands
```
$ alias update='sudo apt update && sudo apt upgrade -y'
```
<br>

## Making Aliases Permanent in Bash
### Open `.bashrc`:
```
$ nano ~/.bashrc
```
<br>

### Add your aliases:
```
alias alias grep='grep --color=auto'
alias duh='du -h --max-depth=1'
alias myscript='cd /home/rohan/Documents/Production_Scripts/Bash_Script'
alias update='sudo apt update && sudo apt upgrade -y'
```
<br>

### Save the file and then source it:
```
$ source ~/.bashrc
```