<img src="https://miro.medium.com/v2/resize:fit:1400/1*HSY8ZqGFxxFjCLBcmj_19Q.png" style=" position: relative; bottom: 6.4px; margin-top:33px; margin-left:13.5%">

<span style="font-size:30px; display: block; margin-top: 50px;">**What is the Nebula Overlay Network?**</span>
- <span span style="font-size:25px; line-height: 1; margin-bottom: 0;"> *Nebula is an overlay networking tool designed to be fast, secure and scalability. Connect any number of hosts with on-demand, encrypted tunnels that work across any IP networks and without opening firewall ports. Nebula is an overlay networking tool designed to be fast, secure and scalability. Connect any number of hosts with on-demand, encrypted tunnels that work across any IP networks and without opening firewall ports.*</span>

<span style="font-size:30px; display: block; margin-top: 50px;">**How Lighthouse server works in nebula network?**</span>
- <span span style="font-size:25px; line-height: 1; margin-bottom: 0;"> *A lighthouse is a Nebula host that is responsible for keeping track of all of the other Nebula hosts, and helping them find each other within a Nebula network.*</span>

<span style="font-size:30px; display: block; margin-top: 50px;">**What is Node server and How it's works in nebula network?**</span>
- <span span style="font-size:25px; line-height: 1; margin-bottom: 0;"> *Nebula host represents any node like a server, laptop, phone, or tablet. The **Certificate Authority** (CA) is pivotal, signing certificates for each host added to the network. These certificates include details like name, IP address, and group membership. Hosts cannot modify their certificates, preventing impersonation. Each host has a private key, enhancing security during Nebula tunnel creation. The trust mechanism relies on CA-signed certificates, ensuring the authenticity of hosts and preventing unauthorised access within the Nebula network.*</span>
---
<br>

## <span style="font-size:50px; display: block; text-align: center; margin-top: 50px;">**Installation and Configuration**</span>
- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Downloading nebula tar file on server**</span>
```
wget https://github.com/slackhq/nebula/releases/download/v1.9.3/nebula-linux-amd64.tar.gz
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Untar downloaded nebula tar file and paste binary file into { `/usr/local/bin` } folder**</span>
```
tar -xvzf nebula-linux-amd64.tar.gz -C /usr/local/bin
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Creating nebula working directory in { `/etc` } folder. All certs and config file creating in this directory**</span>
```
mkdir /etc/nebula && cd /etc/nebula
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Create `ca.crt` and `ca.key` file for Nebula**</span>
> **Note**: This will create files named `ca.key` and `ca.cert` in the current directory. The `ca.key` file is the most sensitive file you'll create, because it is the key used to sign the certificates for individual nebula hosts. Please store this file somewhere safe, preferably with strong encryption.
```
nebula-cert ca -name "nebula-network"
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Download a copy of the nebula example configuration file**</span>
```
curl -o config.yml https://raw.githubusercontent.com/slackhq/nebula/master/examples/config.yml
```
<br>

## <span style="font-size:50px; display: block; text-align: center; margin-top: 50px;">**Lighthouse Server Configuration**</span>
- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Creating lighthouse certificate file**</span>
> **Note**: Creating this certs in { `/etc/nebula/` } directory. Change name and IP Address according to the infrastructure.
```
nebula-cert sign -name "lighthouse" -ip "192.168.100.1/24"
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Create lighthouse server config.yml file**</span>
> **Note:** Creating this files in { `/etc/nebula/` } directory. Please make changes according to you in this config file.
```
cd /etc/nebula/ && nano config.yml
```
<br>

```
### Lighthouse
---

# PKI defines the location of credentials for this node
pki:
  ca: /etc/nebula/ca.crt
  cert: /etc/nebula/lighthouse.crt
  key: /etc/nebula/lighthouse.key

# Static host map defines hosts with fixed IP addresses on the internet
static_host_map:
  "192.168.100.1": ["Lighthouse-IP-1:4242"]
  "192.168.100.2": ["Lighthouse-IP-2:4242"]

# Lighthouse setting
lighthouse:
  am_lighthouse: true
  serve_dns: true
  dns:
    host: "[::]"
    port: 53
  interval: 60

# Remote_allow_list controls IP ranges for handshaking with other nodes
remote_allow_list:
  "192.168.100.0/24": true

# Listening port configuration
listen:
  # To listen on both IPv4 and IPv6 use "::"
  host: "[::]"
  port: 4242
  batch: 64
  read_buffer: 20971520
  write_buffer: 20971520

# Static_map is how to interpret static_host_map. It defaults to ip4, trying to connect to the lighthouse using only ipv4.
static_map:
  network: ip4

# Continues to punch inbound/outbound at a regular interval to avoid expiration of firewall NAT mappings
punchy:
  punch: true
  punch_back: true
  respond: true
  delay: 1s
  respond_delay: 5s

# List of relay nodes to forward traffic
relay:
  relays:                    # List of relay IPs to route traffic through 
    - 192.168.100.1
    - 192.168.100.2          # Add additional relay IPs as needed
  am_relay: true             # Indicates this node is a relay
  use_relays: true           # Enables relays for routing traffic

# Configure the private interface. Note: address is baked into the Nebula certificate
tun:
  # Disables tun for lighthouse without local interface (rootless)
  disabled: false
  # Device name; default chosen by OS if not set
  dev: nebula-net
  # Toggles forwarding of local broadcast packets (address depends on pki.cert)
  drop_local_broadcast: false
  # Toggles forwarding of multicast packets
  drop_multicast: false
  # Sets the transmit queue length; default is 500
  tx_queue: 500
  # Default MTU; safe setting is 1300 for internet traffic
  mtu: 1300

# Configure logging level
logging:
  # Log level: panic, fatal, error, warning, info, or debug. Default is info
  level: info
  # Log format: json or text. Default is text
  format: json

# Specifies the type of metrics exporter
stats:
  type: prometheus          # Use Prometheus for metrics collection
  # Address and port where Prometheus metrics are exposed
  listen: 127.0.0.1:8080    # Bind to localhost on port 8080
  # Path where metrics can be accessed
  path: /metrics            # URL path for metrics endpoint
  # Namespace for metrics to avoid name collisions
  namespace: prometheusns   # Custom namespace for metrics
  # Subsystem for grouping related metrics
  subsystem: nebula         # Subsystem name for metrics
  # Interval for metric collection
  interval: 10s             # Collect metrics every 10 seconds
  # Include metrics related to messages
  message_metrics: true     # Enable message-related metrics
  # Include metrics related to the lighthouse service
  lighthouse_metrics: true  # Enable lighthouse-related metrics

# Nebula security group configuration
firewall:
  # Action for packets not allowed by firewall rules
  # `drop` (default): silently drop the packet
  # `reject`: send a reject reply
  outbound_action: drop
  inbound_action: drop

  conntrack:
    tcp_timeout: 12m
    udp_timeout: 3m
    default_timeout: 10m


  outbound:
    # Allow all outbound traffic
    - port: any
      proto: any
      host: any

  inbound:
    # Allow ICMP between any Nebula hosts
    - port: any
      proto: icmp
      host: any

    # Allow UDP port 53 from any group
    - port: 53
      proto: udp
      group: any

    # Allow TCP port 22 from any host
    - port: 22
      proto: tcp
      groups:
        - k8s
        - swarm
      #cidr: 192.168.100.0/24
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Configure nebula service through systemctl service**</span>
> **Note:** Create nebula.service in { `/etc/systemd/system` }  then systemctl service contentpaste in nebula.service file and reload the daemon & start the service.
```
nano /etc/systemd/system/nebula.service
```
```
[Unit]
Description=Nebula overlay networking tool
Wants=basic.target network-online.target nss-lookup.target time-sync.target
After=basic.target network.target network-online.target
Before=sshd.service

[Service]
SyslogIdentifier=nebula
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/nebula -config /etc/nebula/config.yml
Restart=always
StandardOutput=file:/var/log/nebula.log
StandardError=file:/var/log/nebula.log

[Install]
WantedBy=multi-user.target
```
```
systemctl daemon-reload && systemctl enable --now nebula
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Creating certificate files for node servers with or without dedicated groups**</span>
```
nebula-cert sign -name "laptop" -ip "192.168.100.2/24" -groups "user,ssh"
nebula-cert sign -name "server" -ip "192.168.100.3/24" -groups "servers"
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Copy the created cert files for node server { `remote server` } and the `ca.cert` file too to connect with the lighthouse.**</span>
> **Note:** Firstly, create nebula folder on your node server in { `/etc/` } directory then run this command.
```
scp ca.crt server.crt server.key root@remote_ip:/etc/nebula/
```
<br>

## <span style="font-size:50px; display: block; text-align: center; margin-top: 50px;">**Node Server Configuration**</span>
- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Downloading nebula tar file on node server too**</span>
```
wget https://github.com/slackhq/nebula/releases/download/v1.9.3/nebula-linux-amd64.tar.gz
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Untar downloaded nebula tar file and paste binary file into { `/usr/local/bin` } folder**</span>
```
tar -xvzf nebula-linux-amd64.tar.gz -C /usr/local/bin
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Create node server config.yml file**</span>
> **Note:** Create this file in { `/etc/nebula/` }. Please make changes according to you in this config file.
```
cd /etc/nebula/ && nano config.yml
```
```
### Node
---

# PKI defines the location of credentials for this node
pki:
  ca: /etc/nebula/ca.crt
  cert: /etc/nebula/server.crt
  key: /etc/nebula/server.key

# Need a static host map, using the DNS name of the lighthouse
static_host_map:
  # Put all of your lighthouses IP’s here
  "192.168.100.1": ["Lighthouse-IP-1:4242"]
  "192.168.100.2": ["Lighthouse-IP-2:4242"]

# Lighthouse server IP config for clients
lighthouse:
  am_lighthouse: false
  dns:
    host: 192.168.100.1
    port: 53
  interval: 60
  hosts:
    - "192.168.100.1"
    - "192.168.100.2"

# Remote_allow_list controls IP ranges for handshaking with other nodes
remote_allow_list:
  "192.168.100.0/24"

# local_allow_list defines IP ranges that are allowed for local communication
local_allow_list:
  "192.168.100.0/24": true

# Listening port
listen:
  # To listen on both any ipv4 and ipv6 use "::"
  host: '[::]'
  port: 0

# Static_map is how to interpret static_host_map. It defaults to ip4, trying to connect to the lighthouse using only ipv4.
static_map:
  network: ip4

# Continues to punch inbound/outbound at a regular interval to avoid expiration of firewall NAT mappings
punchy:
  punch: true
  punch_back: true
  respond: true
  delay: 1s
  respond_delay: 5s

# List of relay nodes to forward traffic
relay:
  relays:                 # List of relay IPs to route traffic through
    - 192.168.100.1
    - 192.168.100.2       # Add additional relay IPs as needed
  am_relay: false         # Indicates this node is a relay
  use_relays: true        # Enables relays for routing traffic

# Configure the private interface. Note: addr is baked into the nebula certificate
tun:
  # When tun is disabled, a lighthouse can be started without a local tun interface (and therefore without root)
  disabled: false
  # Name of the device. If not set, a default will be chosen by the OS
  dev: nebula-net
  # Toggles forwarding of local broadcast packets, the address of which depends on the ip/mask encoded in pki.cert
  drop_local_broadcast: false
  # Toggles forwarding of multicast packets
  drop_multicast: false
  # Sets the transmit queue length, if you notice lots of transmit drops on the tun it may help to raise this number. Default is 500
  tx_queue: 500
  # Default MTU for every packet, safe setting is (and the default) 1300 for internet based traffic
  mtu: 1300

# Configure logging level
logging:
  # panic, fatal, error, warning, info, or debug. Default is info
  level: info
  # json or text formats currently available. Default is text
  format: json

# Specifies the type of metrics exporter
stats:
  type: prometheus          # Use Prometheus for metrics collection
  # Address and port where Prometheus metrics are exposed
  listen: 127.0.0.1:8080    # Bind to localhost on port 8080
  # Path where metrics can be accessed
  path: /metrics            # URL path for metrics endpoint
  # Namespace for metrics to avoid name collisions
  namespace: prometheusns   # Custom namespace for metrics
  # Subsystem for grouping related metrics
  subsystem: nebula         # Subsystem name for metrics
  # Interval for metric collection
  interval: 10s             # Collect metrics every 10 seconds
  # Include metrics related to messages
  message_metrics: true     # Enable message-related metrics
  # Include metrics related to the lighthouse service
  lighthouse_metrics: true  # Enable lighthouse-related metrics


# Nebula security group configuration
firewall:
  # Action to take when a packet is not allowed by the firewall rules
  #   `drop` (default): silently drop the packet.
  #   `reject`: send a reject reply.
  outbound_action: drop
  inbound_action: drop

  conntrack:
    tcp_timeout: 12m
    udp_timeout: 3m
    default_timeout: 10m

  outbound:
    # Allow all outbound traffic from this node
    - port: any
      proto: any
      host: any

  inbound:
    # Allow icmp (Ping) between any nebula hosts
    - port: any
      proto: any
      groups: any
      #cidr: 10.10.1.0/24
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Configure nebula service through systemctl service**</span>
> **Note:** Create nebula.service in { `/etc/systemd/system` }  then systemctl service contentpaste in nebula.service file and reload the daemon & start the service.
```
nano /etc/systemd/system/nebula.service
```
```
[Unit]
Description=Nebula overlay networking tool
Wants=basic.target network-online.target nss-lookup.target time-sync.target
After=basic.target network.target network-online.target
Before=sshd.service

[Service]
SyslogIdentifier=nebula
ExecReload=/bin/kill -HUP $MAINPID
ExecStart=/usr/local/bin/nebula -config /etc/nebula/config.yml
Restart=always
StandardOutput=file:/var/log/nebula.log
StandardError=file:/var/log/nebula.log

[Install]
WantedBy=multi-user.target
```
```
systemctl daemon-reload && systemctl enable --now nebula
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Now test, everything running fine or not**</span>
> Firstly, ping your lighthouse nebula IP { in my case it's `192.168.100.1` }  if ping successfully all OK, otherwise check the config file again. 

## <span style="font-size:50px; display: block; text-align: center; margin-top: 50px;">**Nebula Commands**</span>
- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Follow (`tail`) the Nebula service logs in real-time**</span>
```
journalctl --unit=nebula --follow
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Print the details and contents of the `server/node.crt` Nebula certificate**</span>
```
nebula-cert print -path node.crt
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Perform a DNS lookup against the specified lighthouse IP for the given hostname**</span>
```
dig @lighthouse-IP +short node_server_name
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Query TXT record for Nebula IP certificate info**</span>
```
dig @lighthouse-IP +short "Node-IP" TXT
```
<br>

- <span span style="font-size:22px; line-height: 1; margin-bottom: 0;"> **Test the Nebula configuration for syntax errors**</span>
```
nebula -test -config /etc/nebula/config.yml
```
