<img src="https://www.iplocation.net/assets/images/blog/featured/ssh.jpg" style=" margin:33px 350px;">

# SSH (Secure Shell)
<br/>

### What is SSH?
- **SSH (Secure Shell)** is a network communication protocol that enables secure communication between two computers or devices over an unsecured network. It is primarily used for remote login and command execution on servers, securely transmitting data between the client and the host.

### Why it is called as Secure Shell?
- **Encryption:** The communication between the SSH client and the server is encrypted, ensuring confidentiality, data integrity, and authenticity.

### More about SSH
- **Default Port:** SSH typically uses Port **22** for client connections. However, this can be changed to any port between 1024 and 32,767 for added security.
- **SSH Command:** SSH is also a command in Linux, used to securely access and manage remote servers.
```
Syntax: ssh username@hostname_or_IP_address
```
<br/>

## Using SSH

### SSH Configuration File `sshd_config`
- The main configuration file for the SSH service on the server is located at `/etc/ssh/sshd_config`. This file allows you to customize various SSH settings, including the port number, authentication methods, and more.

### Installing SSH
- To use SSH, the SSH service (OpenSSH) must be installed on the server. Below are the installation steps for different Linux distributions:
- For Ubuntu/Debian:
```
$ sudo apt install openssh-client openssh-server -y
```
- For CentOS/Fedora:
```
$ sudo yum install openssh-clients openssh-server -y
# or
$ sudo dnf install openssh-clients openssh-server -y
```

### Enabling and Managing the SSH Service
- After installing SSH, you need to start and enable the SSH service so that it runs automatically on boot.
  - Check SSH Status:
    ```
    $ sudo systemctl status sshd
    ```
  - Start SSH Service:
    ```
    $ sudo systemctl start sshd
    ```
  - Enable SSH Service:
    ```
    $ sudo systemctl enable sshd
    ```
<br/>

## SSH Key Management

### Generating SSH Keys with `ssh-keygen`
- SSH keys provide a more secure way of logging into an SSH server than using passwords alone. The `ssh-keygen` command is used to generate SSH key pairs (public and private keys).
  - Generating SSH Keys:
    ```
    $ ssh-keygen -t rsa -b 4096 -C "username or your_email@example.com"
    ```
    - **-t:** Specifies the type of key to create (e.g., `rsa`)
    - **-b:** Specifies the number of bits in the key (e.g., `4096` for strong encryption).
    - **-C:** Adds a comment or label to the key.
  - The generated public key (`id_rsa.pub`) can be added to the `~/.ssh/authorized_keys` file on the remote server for passwordless login.

### Copying the Public Key to the Server
- The `ssh-copy-id` command is used to copy the public key to the server, automating the process of setting up key-based authentication.
```
$ ssh-copy-id username@hostname_or_IP_address
```

### Common SSH Commands
- SSH Login to Remote Server:
```
$ ssh username@hostname_or_IP_address
```

- Remote Command Execution:
```
$ ssh username@hostname_or_IP_address 'command_to_execute'
```
<br/>

## Copying Files and Directories with SCP

### Copying a File
- Copy a file from the local machine to the remote server:
```
$ scp /path/to/localfile username@hostname:/remote/path/
```

- Copy a file from the remote server to the local machine:
```
$ scp username@hostname:/remote/path/file /local/path/
```

### Copying a Directory
- Copy a directory and its contents from the local machine to the remote server:
```
$ scp -r /path/to/localdir username@hostname:/remote/path/
```

- Copy a directory and its contents from the remote server to the local machine:
```
$ scp -r username@hostname:/remote/path/dir /local/path/
```