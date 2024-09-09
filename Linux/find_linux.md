# What is Find command?
- Find command search for files in a directory hierarchy.

<br>

## Find command syntax
```
find [option] [path...] [expression]
```
<br>

## Basic Example
```
find /path/ -name <file_name>
```
<br>

## Some Cases and Use of grep command
### Case1
---
- How to search a file based on their size?
```
find /path/ -size 50M
```
- **k** - **KB**
- **M** - **MB**
- **G** - **GB**
- **c** - **Bytes**

<br>

### Case2
---
- How to find only file or only directory in a given path?
```
find /path/ -type f
```
- **f** - **file**
- **d** - **directory**
- **l** - **symbolic link**
- **b** - **block device**
- **s** - **socket**

<br>

### Case3
---
- How to search a file based on it's name?
```
find /path/ -name filename
```
<br>

### Case4
---
- How to ignore upper & lower case in file name while searching files?
```
find /path/ -iname filename
```
<br>

### Case5
---
- How to search files for a given user only?
```
find /path/ -user root
```
<br>

### Case6
---
- How to search a file based on the inode number? ( For check inode no. `ls -li`)
```
find /path/ -inum <inode_number_of_file>
```
<br>

### Case7
---
- How to search a file based on the number of links?
```
find /path/ -links <number_of_link>
```
<br>

### Case8
---
- How to search a file based on their permissions?
```
find /path/ -perm /u=r
find /path/ -perm 777
```
<br>

### Case9
---
- How to search all the files which start with letter a?
```
find /path/ -iname a*
```
<br>

### Case10
---
- How to search all the files which are modified/created after last.txt file?
```
find /path/ -newer last.txt
```
<br>

### Case11
---
- How to search all the empty files in a given directory?
```
find /path/ -empty
```
<br>

### Case12
---
- How to search all the empty files in a given directory and at the same time delete them?
```
find /path/ -empty -exec rm {} \;
```
<br>

### Case13
---
- How to search all the files whose size are between 1-50 MB?
```
find /path/ -size +1M -size -50M
```
<br>

### Case14
---
- How to search 15 days old files?
```
find /path/ -mtime 15
```