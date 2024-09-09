# What is Process Management?
- Process management in Linux refers to the methods and tools used to control and manage the execution of processes in the operating system. A process is an instance of a program that is running, and process management ensures that system resources like CPU, memory, and I/O are allocated efficiently to running processes.

<br>

## Commands of process management
### `Jobs`: (**List Background Jobs**)
- List Background jobs running in the current shell session:
```
# Shows all background and suspend jobs
$ jobs
```
<br>

### `bg`: (**Background**)
- Moves a suspended or stopped job to the background
```
$ bg
```
<br>

### `fg`: (**Foreground**)
- Moves a background job to the foreground
```
$ fg
```
<br>

## How to resume a specific job?
- bg %<job_id>
- fg %<job_id>

<br>

## `Nice` Value
- Niceness scale goes from `-20 to 19`. The lower the number more priority that task gets.
- Process priority = nice
  - (ex. `nice -n 5 process`)

<br>

## `Nohup`: (**No Hangup**)
- If you want your process keep running even after closing your terminal, you can use nohup.
- Your process output saves in a `nohup.out` file
```
$ nohup <process> &
$ nohup <process> > /dev/null 2>&1 &
```