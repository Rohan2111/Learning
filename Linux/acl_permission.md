# What is ACL in Linux?
- **Access Control Lists** (`ACLs`) allows you to give more specific set of permissions to a file or directory without changing the base ownership and permissions.
- Commands: **`setfacl`** & **`getfacl`**

<br>

# Why Use ACLs?
- While standard permissions are limited to owner, group, and others, ACLs allow specific users and groups to have custom permissions on a file or directory. This is especially useful when multiple users or groups require different levels of access.

<br>
<br>

## ACL Commands
### View ACLs:
---
- Use `getfacl` to display the ACL of a file or directory:
```
$ getfacl filename
```
<br>

### Set ACLs:
---
- Use `setfacl` to set ACLs:
```
$ setfacl -m u:username:rwx filename
```
- Here, `-m` modifies the ACL, `u:username` specifies the user, and `rwx` defines the permissions.

<br>

```
$ setfacl -m g:groupname:rwx filename
```
- Here, `-m` modifies the ACL, `g:groupname` specifies the group, and `rwx` defines the permissions.

<br>

### Remove ACLs:
---
- Remove specific ACL:
```
$ setfacl -x u:username filename
```
<br>

- Remove all ACLs:
```
$ setfacl -b filename
```
<br>

### Default ACL for Directories:
---
- For adding permission for user in all the files inside a folder
```
$ setfacl -Rm "entry" <target_file/folder>
```
<br>

- Set a default ACL that applies to all new files created in a directory:
```
$ setfacl -m d:u:username:rwx directoryname
```
<br>

## Viewing ACL Details
- When you list files using `ls -l`, if a file has an ACL, a `+` symbol appears at the end of the permission string:
```
$ ls -l
-rw-rw-r--+ 1 user1 developers 4096 Aug 26 10:00 filename
```
- You can then use `getfacl filename` to see the detailed ACL settings.