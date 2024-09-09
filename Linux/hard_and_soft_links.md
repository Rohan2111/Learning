# What are Links?
- A connection between a file name and actual data on the disk. We can call it a shortcut.

<br>

## Types of link
- Soft Link
- Hard Link

<br>

### Soft Link
---
- Link will be removed if original file is deleted or removed.
```
ln -s myfile myfile_link
```
<br>

### Hard Link
---
- Deleting, renaming or removing the original file will not effect the link.
```
ln myfile myfile_link
```