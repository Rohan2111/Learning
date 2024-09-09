# What are Wildcards?
- Wildcards are special characters that represent one or more characters in filenames or commands, allowing users to select multiple files at once.

<br>

## Wildcard Patterns:
- **Asterisk (`*`)**
  - **Description**: The asterisk (*) matches any number of characters, including none. This wildcard is commonly used to match filenames or patterns in shells like Bash.
  - **Example**: 
   ```
   ls *.txt
   ```
   This command will list all files that end with `.txt`, such as `file.txt`, `document.txt`, and `notes.txt`. It matches any file with any name before `.txt`.

<br>

- **Question Mark (`?`)**
  - **Description**: The question mark (?) matches exactly one character. It is useful for matching patterns where you expect only one unknown character.
  - **Example**: 
   ```
   ls file?.txt
   ```
   This command will match files like `file1.txt`, `file2.txt`, or `fileA.txt`, but not `file10.txt` or `file.txt` (since these do not have exactly one character in place of the ?).

<br>

- Square Brackets `([])`
  - **Description**: Square brackets ([]) allow you to match any one character from the set of characters enclosed within the brackets. It is typically used for more specific character matches.
  - **Example**: 
   ```
   ls file[12].txt
   ```
   This will match `file1.txt` and `file2.txt`, but not `file3.txt` or `fileA.txt`. Only the characters `1` or `2` can be in the place specified by `[12]`.

<br>

- Braces (`{}`)
  - **Description**: Braces ({}) allow you to specify a group of patterns, and the command will match any of them. It is often used to create shortcuts for multiple similar patterns.
  - **Example**: 
   ```
   ls file{1,2}.txt
   ```
   This will match both `file1.txt` and `file2.txt`, as the brace pattern expands to `file1.txt` and `file2.txt`. It is a powerful way to match multiple filenames or patterns.

<br>

## Use Cases
- How to file all the `XML` files in a directory
```
ls *.xml
```

<br>

- Create 20 files like file1, file2, ... file20
```
touch file{1..20}
```
<br>

- Delete 20 file like file1, file2, ... file20
```
rm file{1..20}
```
<br>

- Find all the files with the name `_123` (Where _ can be any character)
```
ls ?123
```
<br>

- Find all the files whose name is exactly 4 characters ex. `a123`, test....
```
ls ????
```
<br>

- Find files whose name start with a, b, or c
```
ls [abc]*
```

<br>

- Find files whose name included numeric
```
ls *[1-9]*
```
<br>

- Find files whose name only alphabets
```
ls *[a-z]*
```
<br>

- Find all files that start with "test" and have exactly 6 characters in their name (e.g. test01, test99)
```
ls test??
```
<br>

- Find all files that have at least one underscore in their name
```
ls *_*
```
<br>

- List all files that do not contain the letter "e" in their name
```
ls | grep -v 'e'
```
<br>

- Find all files that start with a capital letter [A-Z]
```
ls [A-Z]*
```
<br>