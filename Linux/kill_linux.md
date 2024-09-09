# What is kill command in linux?
- Used to terminate a process manually.

<br>

## Syntax
- `kill [option] [PID]`
  - Option - Signal Name or Number
  - PID - Process ID

<br>

## To see all the signal names
```
$ kill -l
```

<br>

## Most widely used kill commands
- kill PID

<br>

- To restart the process
```
$ kill -1 [PID]
```
<br>

- Interrupt from keyboard like `CTRL+C`
```
$ kill -2 [PID]
```
<br>

- Forcefully terminate the process
```
$ kill -9 [PID]
```
<br>

- Kill process gracefully
```
$ kill -15 [PID]
```