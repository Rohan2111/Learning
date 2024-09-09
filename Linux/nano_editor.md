<img src="https://ih1.redbubble.net/image.3775090720.2524/st,small,507x507-pad,600x600,f8f8f8.u1.jpg" width=300px style="position:relative; left:38%;" >

<br>

## What is Nano editor?
- Nano is a simple, easy-to-use command-line text editor often found in Unix-like operating systems, including Linux and macOS. It's a user-friendly Alternative to more complex editors like Vim or Emacs, making it ideal for beginners and quick edits. Nano is lightweight, yet it includes many features necessary for text editing, such as syntax highlighting, search and replace, spell checking, and undo/redo functionality.

<br>

## Basic Usage
### Opening a File:
  - To open a file in nano, use the command:
    ```
    $ nano filename
    ```
  - If the file doesn't exist, Nano will create it.

<br>

### Basic Navigation:
  - **Arrow Keys:** Move the cursor up, down, left, or right.
  - **Page Up/Down:** Move one page up or down.
  - **CTRL + _ (underscore):** Jump to a specific line and column.
---
<br>

## Common Nano Shortcuts
### File Operations:
---
- **CTRL + O:** Write (save) the file. You'll be prompted to confirm the filename.
- **CTRL + X:** Exit nano. If you have unsaved changes, nano will prompt you to save them.

<br>

### Editing Text:
---
- **CTRL + K:** Cut the current line and store it in the cutbuffer.
- **CTRL + U:** Uncut (paste) the contents of the cutbuffer at the cursor position.
- **CTRL + ^ (caret):** Start selecting text (set a mark). Move the cursor to highlight text.

<br>

### Searching and Replacing:
---
- **CTRL + W:** Search for a string of text.
- **CTRL + \ (backslash):** Search and replace text.
- **Alt + R:** Toggle the 'replace all' mode during a search and replace operation.

<br>

### Undo/Redo:
---
- **CTRL + _ (underscore):** Undo the last action.
- **Alt + E:** Redo the last undone action.

<br>

### Indentation:
---
- **Alt + }:** Indent the current line.
- **Alt + {:** Unindent the current line.

<br>

### File Navigation:
---
- **CTRL + G:** Display the help screen, which includes a list of commands and shortcuts.
- **CTRL + Y:** Move up one page.
- **CTRL + V:** Move down one page.

<br>

### Other Useful Shortcuts:
---
- **CTRL + T:** Invoke the spell checker (if installed).
- **Alt + C:** Display the cursor position in the file.
- **CTRL + L:** Refresh the screen, which can be helpful if the display becomes garbled.