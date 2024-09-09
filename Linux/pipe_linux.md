# What is a Pipe?
- Pipes are used to redirect a stream from one program to another program.
- The output of one command redirect it to the input of another.

<br>

## Pipe Syntax
- We use `|` symbol to separate two commands.
- Output of first command passed/redirected to second command.
```
$ command1 | command2
```

<br>

## TEE Command
- Tee reads standard input and copies it both to `stdOutput` and to a file.
- We can see the information going through pipeline.
```
$ ls | tee file.txt
```

<br>

## Xargs
- It convert the `stdInput` into command line argument.
```
$ cat filename.txt | xargs touch
```