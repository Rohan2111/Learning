# What is File Archive?
- A file archive in Linux is a single file that contains a collection of files, directories, and their metadata (like permissions, timestamps, etc.) packaged together. It’s often used for backup, sharing, or storage purposes. Archives themselves do not compress files, but they are commonly used together with compression tools to create compressed archives.

<br>

# What is File Compression?
- File compression reduces the size of files by encoding their data more efficiently. This is especially useful for Backups, Storage, and File Transfer.

<br>

## Common File Compression Tools
### `Gzip`
---
- `gzip` compresses only files and replaces the original file with a compressed version, usually with a `.gz` extension
- **Compressing a file:**
```
gzip filename.txt
```
<br>

- **Decompressing a file:**
```
guzip filename.txt.gz
```
<br>

- **This command displays the contents of file.gz to the terminal without extracting it**
```
zcat file.gz
```
<br>

### `Tar` (Tape Archive):
---
- The `tar` command gathers files and directories into a single archive file, with a `.tar` extension
- **Creating a tar archive**
```
tar -cvf archive_name.tar file1.txt file2.txt file3.txt
```
<br>

- **Compressing the tar archive with gzip**
```
tar -czvf archive_name.tar.gz file1.txt file2.txt file3.txt
```
<br>

- **Decompressing a tar.gz archive**
```
tar -xzvf archive_name.tar.gz
```
<br>

- **Decompressing a tar.bz2 archive**
```
tar -xjvf archive_name.tar.bz2
```
<br>

- **The command lists the detailed contents of a compressed tar archive without extracting it, showing file names, permissions, sizes, and timestamps**
```
tar -tzvf archive_name.tar.gz
```
<br>

### `Zip` and `Unzip`
---
- The `zip` command is also commonly used for creating compressed archives in a format compatible with Windows also
- **Compressing Multiple files**
```
zip archive_name.zip file1.txt file2.txt file3.txt
```
<br>

- **Decompressing a zip archive**
```
unzip archive_name.zip
```
<br>

- **This command provides detailed information about the contents of a ZIP archive, including file names, sizes, and permissions.**
```
zipinfo file.zip
```