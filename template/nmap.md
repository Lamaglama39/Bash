***
## Install
***
```
# RedHat
sudo yum install nmap
# Debian
sudo apt-get install nmap
```
***

## Command List
***
### Port scan check to the appropriate host
```
nmap <IP Address>
```
### Host discovery within the network
```
nmap -sP <IP Address/Subnetmask>
```
### Check OS of the host in question
```
nmap -O <IP Address>
```
### Check hostname of the host in question
```
nmap -sL <IP Address/Subnetmask>
```
### Scan for basic TCP/UDP ports
```
nmap -sS -sU -Pn <IP Address>
```
### Scan for all TCP/UDP ports
```
nmap -sS -sU -Pn -p 1-65535 <IP Address>
```
### Check TCP connections to the appropriate host
```
nmap -sT <IP Address>
```
### High-speed scan
```
nmap -T4 -F <IP Address>
```
### Examine the details of each service running with the "-A" option to display detailed information about each service.
```
nmap -T4 -A localhost  
```
### With the "-v" option to examine all detailed information, detailed information can be displayed.
```
nmap -T4 -A -v localhost  
```
***

# オプション一覧
- -sS	[ SYN scan ]
- -sT	[ STCP connect() scan(Default TCP scan type if SYN scan cannot be selected) ]
- -sU	[ UDP scan ]
- -sN ,-sF ,-sX	TCP Null、FIN、[ Xmas scan ]
- -sA	[ ACK scan ]
- -sW	[ Window scan ]
- -sM	[ Maimon scan ]
- --scanflags	[ Custom TCP scan ]
- -sI	[ Idle scan ]
- -sO	[ IP Protocol scan ]
- -b	[ FTP bounce scan ]
- -p	[ Scan on specified ports ]
- -F	[ Fast scan on specified ports ]
- -r	[ Do not randomize port specification ]