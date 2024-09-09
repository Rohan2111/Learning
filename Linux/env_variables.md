# What are ENV Variables?
- Environment variables in Linux are system-level settings that store configuration information. They are used by the operating system and applications to access important system data. Environment variables define the operating environment for a user session or process, such as the user's home directory, shell preferences, and system paths. They provide a convenient way to customize the user's computing environment without modifying application code.
```
VAR_NAME=VALUE
```
<br>

## How to see the existing ENV Variables?
- printenv
- env

<br>

## There are two environment variable types in the bash shell:
- Global Variable
- Local Variable

<br>

### How to create local user-defined variables that are visible within your shell process:
```
$ MY_VAR=Hello
$ echo $MY_VAR
```

<br>

## Local ENV Variables
- You can set environment variables in your terminal session as follows:
```
$ export DB_HOST=localhost
$ export DB_USER=myuser
$ export DB_PASS=mypassword
```
- These variables will be accessible to any program or script run from this terminal session.

<br>

- Example Usage in a Script:
```
#!/bin/bash
echo "Connecting to database at $DB_HOST with user $DB_USER"
```
<br>

## Global ENV Var using profile
### Set ENV Variable permanent for a user:
---
- Edit `~/.profile` (**Ubuntu**)
- Edit `~/.bashrc_profile` (**CentOS**)

<br>

#### And Set Variables
---
```
$ export MyVAR=VALUE
$ source ~/.profile                 # (To apply immediately)
```
<br>

```
$ vi ~/.profile
----------------------
# User specific environment and startup programs
export NEWVAR=Linux
----------------------

# Permanently save
$ source ~/.profile

# Check the variable
$ echo $NEWVAR
```
<br>

### Set ENV variable permanent for all users:
---
- Edit `/etc/profile/`

<br>

#### And Set Variables
---
```
$ export MyVAR=VALUE
$ source /etc/profile/              # (To apply immediately)
```