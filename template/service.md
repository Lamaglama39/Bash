***
# template unit file
## filename: /etc/systemd/system/XXXX.service

```
[Unit]
Description = example
After=XXXX_XX.service
ConditionPathExists=/home/user/script

[Service]
ExecStart=/home/user/script/XXXX.sh
Restart=no
Type=simple

[Install]
WantedBy=multi-user.target
```

***
# Option List
## [Unit]
- Description= explanatory note
- After= Run after activation of the specified unit list
- Before= Run before the specified unit list
- Requires= Executed after successful activation of the specified unit list (dependent units are also activated at the same time as lower-level items are activated, but not if upper-level units fail)
- Wants= Execute even if the specified unit list fails to start (dependent units are started together when the subordinate items are started, and are also started when the upper unit fails).

## [Service]
- Environment= Environment Variable List
- EnvironmentFile= Environment Variable File
- Type=simple|forking|oneshot
- ExecStart= Startup Commands
- ExecStop= Stop command
- ExecReload= Reload Command
- Restart= always|on-abort|on-watchdog|on-abnormal|on-failure|on-success|no
- RemainAfterExit=yes|no
- PIDFile= PID file path of main process
- User= User executing ExecXX
- SuccessExitStatus= List of EXIT codes (other than 0) to be considered as normal termination of the main process

## [Install]
- Alias= Service alias list
- WantedBy= Target List
- Also= List of units installed together

***
# service command list
- Permission Setting
```
chown root:root /etc/systemd/system/XXXX.service
chmod 644 /etc/systemd/system/XXXX.service
```
- Service start-stop
```
systemctl daemon-reload
systemctl enable|disable XXXX.service
systemctl start XXXX.service
systemctl status XXXX.service
```
- Dependency Output
```
systemctl show XXXX.service
systemctl list-dependencies XXXX.service
systemctl list-dependencies XXXX.service -a
systemctl list-dependencies XXXX.service --reverse -a
systemd-analyze dot | dot -Tsvg > systemd.dependencies.svg
```
- Confirmation of startup sequence
```
systemd-analyze time
systemd-analyze blame
systemd-analyze critical-chain XXXX.service
systemd-analyze plot > systemd.sequence.svg 
```
- Dump of all unit status
```
systemd-analyze dump
```
- Load and verify unit files
```
systemd-analyze verify /etc/systemd/system/XXXX.service
```