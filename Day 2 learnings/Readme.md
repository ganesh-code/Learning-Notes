# Day 2 – Linux Processes, Systemd & Monitoring (README)

## 🎯 Objective

Learn how Linux runs programs, manages services, monitors processes, and automates operations using `systemd` and shell scripting.

---

# 📚 Topics Covered

## 1. Process Management

### What is a Process?

A process is a **running instance of a program**.

Example:

```text
Nginx Installed

↓

Nginx Running

↓

Process
```

Every running process has a unique **PID (Process ID)**.

---

## Commands

```bash
ps
ps aux
top
htop
kill
killall
jobs
bg
fg
nohup
nice
```

---

## Important Concepts

### `ps`

Shows running processes.

```bash
ps aux
```

Example output:

```text
USER     PID   %CPU   %MEM   COMMAND
root       1    0.0    0.3   systemd
root     623    0.1    0.4   sshd
```

---

### `top`

Live system monitoring.

Shows:

- CPU usage
- Memory usage
- Running processes

---

### `htop`

Better version of `top`.

- Interactive
- Colorful
- Easier navigation

---

### Kill a Process

```bash
kill PID
```

Force kill

```bash
kill -9 PID
```

---

### Kill by Name

```bash
killall nginx
```

---

### Background Jobs

Run in background

```bash
command &
```

View jobs

```bash
jobs
```

Bring to foreground

```bash
fg
```

Resume in background

```bash
bg
```

---

### Run After Terminal Closes

```bash
nohup command &
```

Useful for long-running scripts.

---

### Process Priority

```bash
nice
```

Lower priority

Higher priority (requires privileges)

---

# 2. Systemd

Linux service manager.

Controls:

- Docker
- Nginx
- SSH
- Jenkins
- Custom scripts

---

## Commands

```bash
systemctl start
systemctl stop
systemctl restart
systemctl status
systemctl enable
systemctl disable
```

---

## Important Difference

```bash
systemctl start nginx
```

Starts **now**.

---

```bash
systemctl enable nginx
```

Starts automatically **after reboot**.

---

# 3. Custom Systemd Service

Created:

```text
/etc/systemd/system/process-monitor.service
```

Example:

```ini
[Unit]
Description=Process Monitor Service
After=network.target

[Service]
Type=simple
ExecStart=/opt/scripts/process-monitor.sh
Restart=always
User=root

[Install]
WantedBy=multi-user.target
```

---

## Reload

```bash
systemctl daemon-reload
```

---

## Start

```bash
systemctl start process-monitor
```

---

## Check Status

```bash
systemctl status process-monitor
```

---

## Enable at Boot

```bash
systemctl enable process-monitor
```

---

# 4. Journalctl

View service logs.

Live logs

```bash
journalctl -fu process-monitor
```

Logs from the last hour

```bash
journalctl --since "1 hour ago"
```

---

# 5. Text Processing

Commands

```bash
grep
awk
sed
cut
sort
uniq
wc
```

---

## Examples

Search

```bash
grep ERROR log.txt
```

Regular Expressions

```bash
grep -E "ERROR|WARNING"
```

---

### awk

Print first column

```bash
awk '{print $1}'
```

---

### sed

Replace text

```bash
sed 's/old/new/g'
```

---

### cut

Extract first field

```bash
cut -d: -f1 /etc/passwd
```

---

### sort

```bash
sort file.txt
```

---

### uniq

```bash
sort file.txt | uniq
```

---

### Count

```bash
wc -l
```

---

# 6. Pipelines

Linux philosophy:

Output of one command becomes input to another.

Example:

```bash
cat /var/log/syslog | grep ERROR | awk '{print $5}' | sort | uniq -c | sort -rn
```

Meaning

```
Read Log

↓

Find ERROR

↓

Extract Column

↓

Sort

↓

Count

↓

Sort by Count
```

---

# 7. Project 1

## process-monitor.sh

Purpose

Continuously monitor Nginx.

If stopped

↓

Restart automatically.

Example

```bash
#!/bin/bash

while true
do
    if pgrep nginx > /dev/null
    then
        echo "$(date): Nginx is running."
    else
        echo "$(date): Restarting Nginx..."
        systemctl restart nginx
    fi

    sleep 60
done
```

Concepts learned

- while loop
- if statement
- pgrep
- sleep
- automation

---

# 8. Project 2

## log-monitor.sh

Purpose

Monitor system logs.

If

```text
ERROR
```

appears

↓

Print alert.

Example

```bash
#!/bin/bash

tail -Fn0 /var/log/syslog |
while read line
do
    if echo "$line" | grep -q "ERROR"
    then
        echo "[$(date)] ALERT: $line"
    fi
done
```

Concepts learned

- tail
- grep
- while read
- log monitoring

---

# 9. Package Management

Ubuntu

```bash
apt update

apt install nginx

apt remove nginx
```

Older command

```bash
apt-get install nginx
```

Hold package version

```bash
apt-mark hold nginx
```

---

## Red Hat

```bash
yum install nginx
```

Modern replacement

```bash
dnf install nginx
```

---

# 10. Sysctl

Kernel tuning.

View

```bash
sysctl -a
```

Search

```bash
sysctl -a | grep swappiness
```

Temporary change

```bash
sysctl -w vm.swappiness=10
```

Permanent

Edit

```text
/etc/sysctl.conf
```

---

## vm.swappiness

Controls how aggressively Linux moves memory pages to swap.

High value

↓

More swapping

Low value

↓

Keep applications in RAM longer

Database servers often use a lower value because disk access is much slower than RAM.

---

# 🛠️ Projects Completed

- `process-monitor.sh`
- `log-monitor.sh`
- Created a custom `systemd` service
- Learned service lifecycle management
- Learned process monitoring
- Learned log monitoring
- Learned Linux pipelines

---

# 🎯 Interview Questions

### Difference between `systemctl start` and `systemctl enable`?

- `start` starts the service immediately.
- `enable` configures it to start automatically after boot.

---

### How do you find which process is listening on port 8080?

```bash
ss -tulpn | grep :8080
```

or

```bash
lsof -i :8080
```

---

### Difference between `apt` and `yum`/`dnf`?

- `apt` → Debian/Ubuntu
- `yum` → Older RHEL/CentOS
- `dnf` → Modern RHEL, CentOS Stream, Fedora, Amazon Linux 2023

---

### What is `vm.swappiness`?

A Linux kernel parameter that controls when the kernel starts using swap space instead of keeping data in RAM. Lower values are commonly preferred for database servers to reduce disk I/O.

---

# 🏁 Day 2 Outcome

By the end of Day 2, you should be able to:

- Inspect and manage Linux processes.
- Start, stop, restart, enable, and disable services with `systemctl`.
- Create and manage your own `systemd` service.
- Read and troubleshoot service logs with `journalctl`.
- Use common text-processing tools (`grep`, `awk`, `sed`, `cut`, `sort`, `uniq`, `wc`).
- Chain commands together using pipelines.
- Write basic monitoring scripts for processes and logs.
- Understand package management across Debian- and Red Hat-based distributions.
- Perform basic kernel tuning with `sysctl`.

These skills form the operational foundation you'll build on in Day 3 with Git and GitHub workflows.
