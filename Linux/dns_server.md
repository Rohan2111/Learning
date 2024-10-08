# DNS Server

## What is DNS?
- DNS, or Domain Name System, is the internet service that translates human-friendly domain name likes **www.example.com** into machine readable IP addresses.

## Setting UP apache webserver
- Installation (CentOS or RedHAT)
  - Package we need to install 
    ```
    $ sudo yum install httpd -y
    $ systemctl start/stop/status httpd             # (httpd is the process or service name)
    ```

  - Enable the service in firewall
    ```
    $ firewall-cmd --add-service=http --permanent
    $ firewall-cmd --reload
    ```

  - Webserver config file under
    - /var/www/html/index.html
    - /etc/httpd/conf/httpd.conf

## DNS Server Setup
- Installation (CentOS or RedHAT)
  - Package we need to install for the DNS is BIND (Berkeley Internet Name Domain)
    ```
    $ sudo yum install bind bind-utils -y
    $ systemctl start/stop/status named             # (named is the process or service name)
    ```

  - Enable the serivce in firewall
    ```
    $ firewall-cmd --add-service=dns --permanent
    $ firewall-cmd --reload
    ```

  - DNS config file under
    - /etc/named.conf
    - /var/named                                    # (Directory where all the zone file are present where you define hostname to IP address)
  
## DNS Server Config Changes
> To check the conf file, run this command: `named-checkconf`
> nano /etc/named.conf
```
option {
    listen-on port 53 { 127.0.0.1; <server-IP>; };
    listen-on-v6 port 53 { ::1; };
    directory       "/var/named"
    dump-file       "/var/named/data/cache_dump.db";
    statistics-file "/var/named/data/named_stats.txt";
    memstatistics-file  "/var/named/data/named_mem_stats.txt";
    secroots-file   "/var/named/data/named.secroots";
    recursing-file  "/var/named/data/named.recursing";
    allow-query     { localhost; };

    /*
    - If you are building an AUTHORITATIVE DNS server, do NOT enable recursion.
    - If you are building a RECURSIVE (caching) DNS server, you need to enable (recursion).
    - If your recursive DNS server has a Public IP address, you MUST enable access control to limit queries to your legitimate users. Failing to do so will cause your server to become part of large scale DNS amplification attacks. Implementing BCP38 within your network would greatly reduce such attacks surface
    /*
    recursion yes;

    dnssec-validation yes;

    managed-keys-directory "/var/named/dynamic";
    geoip-directory "/usr/share/GeoIP";

    pid-file "/run/named/named.pid";
    session-keyfile "/run/named/session.key";

    /* https://fedoraproject.org/wiki/Changes/CryptoPolicy */
    include "/etc/crypto-policies/back-ends/bind.config";
};

logging {
        channel default_debug {
                file "data/named.run";
                severity dynamic;
        };
};

zone "." IN {
        type hint;
        file "named.ca";
};

zone "mywebapp.com" IN {
        type master;
        file "mywebapp.com.fzone";
        allow-query { any; };
};

include "/etc/named.rfc1912.zones";
include "/etc/named.root.key";
```

> To create fzone (forward zone) file in `/var/named` directory and you can check this conf file using this command `named-checkzone <domain_name> <fzone_file_name>`
```
$ touch mywebapp.com.fzone
$ nano mywebapp.com.fzone

# File content
$TTL  2d  ; default TTL for zone

@       IN      SOA     ns1.example.com. hostmaster.example.com. (
                                800        ; serial number
                                12h        ; refresh
                                15m        ; update retry
                                3w         ; expiry
                                2h         ; minimum
                                )
; name server RR for the domain
        IN      NS      ns1.example.com.
www     IN      A       <server-IP>
```

## Verify DNS Setup
- Edit `/etc/resolv.conf` file for changes in nameserver
```
# Generated by NetworkManager
search localdomain
nameserver <DNS_server_IP>
```

## DNS Translate
- Hostname to IP address  (Called `A` Record)
- IP address to Hostname  (Called `PTR` Record)
- Hostname to Hostname    (Called `CNAME` Record)

## Zones Files
- Forward Zone - Resolve Domain to IP Address
- Reverse Zone - Resolve IP address to Domain