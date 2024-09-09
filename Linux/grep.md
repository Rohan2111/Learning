# What is Grep?
- `Global Regular Expression Print` Grep command search for a particular string/keyword from a file and print lines matching a pattern.
- It check line by line and print lines matching given pattern. We can use `grep` anywhere like with files, searching for files, directories etc.

<br>

## grep command syntax
```
grep [option] pattern [file]
```
<br>

## Some Cases and Use of grep command
### Case1
---
- To ignore the upper and lower case while searching
```
grep -i "keyword" filename
```
<br>

### Case2
---
- To search everything except given pattern/keyword
```
grep -v "keyword" filename
```
<br>

### Case3
---
- To print how many time **(Count)** given keyword present in the file
```
grep -c "keyword" filename
```
<br>

### Case4
---
- To search for exact match of given keyword in a file
```
grep -w "keyword" filename
```
<br>

### Case5
---
- To print the line no. of matches of given keyword in a file
```
grep -n "keyword" filename
```
<br>

### Case6
---
- To search a given keyword in multiple files
```
grep "keyword" filename1 filename2
```
- **Note:** By default result of multiple files shows file name in output.

<br>

### Case7
---
- To suppress file names while search a given keyword in multiple files
```
grep -h "keyword" filename1 filename2
```
<br>

### Case8
---
- To search multiple keywords in a file
```
grep -e "keyword1" -e "keyword2" filename
```
<br>

### Case9
---
- To only print file names which matches given keywords
```
grep -l "keyword" filename1 filename2 
```
<br>

### Case10
---
- To get the keywords/pattern from a file and match with a another file
```
grep -f keyword.txt filename
```
<br>

### Case11
---
- To print the matching line which start with given keyword
```
grep "^keyword" filename
```
<br>

### Case12
---
- To print the matching line which end with given keyword
```
grep "keyword$" filename
```
<br>

### Case13
---
- Suppose we have 100 files in a directory `dirA` and we need to search a keyword in all the files
```
grep -R "keyword" dirA/
```
<br>

### Case14
---
- We can use egrep command for the multiple keywords search
```
egrep "key1|key2|key3" filename
```
<br>

### Case15
---
- If you just wanna search but don't want to print on terminal
```
grep -q "keyword" filename
```

- If you want to suppress error message
```
grep -s "keyword" filename
```
<br>
<br>

# Grep Variants Explained with Examples
- Variants of grep include **`egrep`**, **`fgrep`**, **`pdfgrep`**, **`zgrep`**, and **`pgrep`**, each with specific use cases.

<br>

## egrep (Extended Grep)
- **egrep** is equivalent to `grep -E`. It supports extended regular expressions, which include additional metacharacters like `+, ?, |,` and `()`, making it easier to search for patterns.
```
egrep "key1|key2|key3" filename
```
- This command searches for any of the keywords key1, key2, or key3 in the file and prints the matching lines.

<br>

## fgrep (Fixed Grep)
- **fgrep** is equivalent to `grep -F`. It searches for fixed strings rather than interpreting them as regular expressions. This makes `fgrep` faster for simple string searches since it doesn't process metacharacters.
```
fgrep "keyword" filename
```
- This searches for the exact string `"keyword"` in the file without treating any special characters in the keyword as part of a regular expression.

<br>

## pdfgrep (Grep for PDFs)
- **pdfgrep** is a version of grep that searches within `PDF` files. It works similarly to grep but is specifically designed to handle the PDF format.
```
pdfgrep "keyword" document.pdf
```
- This command searches for the keyword `"keyword"` in the PDF file `document.pdf` and prints the matching lines.

<br>

## zgrep (Grep for Compressed Files)
- **zgrep** is used to search through compressed files (e.g., `.gz` files). It automatically decompresses the files, searches them, and then outputs the results.
```
zgrep "keyword" file.gz
```
- This searches for `"keyword"` within the compressed file `file.gz` without needing to manually decompress it.

<br>

## pgrep (Process Grep)
- **pgrep** searches for processes running on the system that match a given pattern. It returns the process IDs (`PIDs`) of the matching processes.
```
pgrep -l "bash"
```
- This lists all running processes with names that match "bash", along with their PIDs.