# Vim Editor
<br>

## Creating New File and Edit
- Make a new file
> vim (filename)

- Insert mode or edit mode
> Press (i) button

- Exit from insert mode
> Press (esc) button

- To Save and Exit file
> :wq

- Exit without saving file
> :q!

- To jump to last line of the file
> Press (Shift + G) button

- To jump to top of the file
> Press (gg) button

## Reverse & Forward Search in File
- To search word in your file
> Press (/word) button
- For next occurance of the searched word
> Press (n) button

- To search the word in reverse direction (Buttom to Top)
> Press (?word) button

- To search the word in forward direction (Your cursor on that word you want to search)
> Press (*) button

- To search the word in reverse direction (Your cursor on that word you want to search)
> Press (#) button

## Replacing a Word in our File
- To globally replace the word1 from word2
> Type (:%s/word1/word2/g)

## Undo and Redo in File
- To undo the last change made
> Press (u) button

- To undo all the changes
> Type (:e!)

- To Redo the changes
> Press (CTRL + R) button

- To start editing in next line from your cursor
> Press (o) button

- To start editing from the start of the line
> Press (SHIFT + I) button

- To start editing from the end of the line
> Press (SHIFT + A) button

- To delete character where cursor is present
> Press (x) button

## Cut Paste - Copy Paste
- To delete a line (Acctually it's cut the line)
> Press (dd) button

- To paste the cut/copied text
> Press (p) button

- To paste above the cursor
> Press (SHIFT + p) button

- To select whole line
> Press (SHIFT + v) button

- To select a single character
> Press (v) button

- To copy the selected text
> Press (y) button

## Set line number in our File
- To print the line numbers in file
> Type (:set nu)

- To remove the line numbers
> Type (:set nonu)

## Color scheme in file
- Color ON/OFF
> Type (:syntax off or on)

## Directly Jump to a given line
- To directly jump
> Type (:number_of_line)

## Working with multiple files
- To read multiple files at once
> Type (vim -o file1 file2)

- To change the file selected
> Press (CTRL + w (twice))

## Compare Files
> Type (vim -d file1 file2)