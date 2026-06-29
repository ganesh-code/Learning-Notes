# Day 1 – Linux Foundations (README)

## 🎯 Objective

Build a strong Linux foundation for DevOps by learning the Linux filesystem, users, permissions, SSH, basic scripting, process management, and troubleshooting.

---

# 📚 Topics Covered

## 1. Linux Filesystem Hierarchy

Understand where Linux stores everything.

| Directory | Purpose                        | Real DevOps Usage                   |
| --------- | ------------------------------ | ----------------------------------- |
| `/`       | Root of the filesystem         | Starting point of everything        |
| `/etc`    | Configuration files            | Nginx, SSH, Docker, Systemd configs |
| `/home`   | User home directories          | Developer files, SSH keys           |
| `/var`    | Variable data                  | Logs, databases, cache              |
| `/usr`    | Installed software             | Binaries like Docker, Git, Python   |
| `/proc`   | Live kernel/system information | CPU, Memory, Processes              |
| `/sys`    | Hardware & kernel interface    | Kernel/device configuration         |
| `/tmp`    | Temporary files                | Installers, temporary scripts       |

---

## 2. Core Linux Commands

Practice until they become muscle memory.

```bash
ls -la
cd
pwd
mkdir -p
touch
cp
mv
rm -rf
cat
less
head
tail
find
```

---

## 3. File Permissions

Understand:

```
r = Read
w = Write
x = Execute
```

Numeric notation:

```
7 = rwx
6 = rw-
5 = r-x
4 = r--
0 = ---
```

Example:

```
755

Owner  -> rwx
Group  -> r-x
Others -> r-x
```

Commands:

```bash
chmod
chown
chgrp
```

---

## 4. Users & Groups

Commands:

```bash
useradd
userdel
passwd
usermod
groups
id
```

Important files:

```
/etc/passwd
/etc/shadow
/etc/group
```

Understand:

- UID
- GID
- Login shell
- Home directory

---

## 5. SSH (Secure Shell)

Learn:

- What SSH is
- Why DevOps engineers use it
- Password authentication
- Key-based authentication

Generate key:

```bash
ssh-keygen -t ed25519 -C "ganesh@company.com"
```

Files created:

```
~/.ssh/id_ed25519
~/.ssh/id_ed25519.pub
```

Understand:

- Private Key
- Public Key
- authorized_keys

Difference between:

```
Laptop

Private Key
Public Key
```

and

```
Server

authorized_keys
```

Understand the real onboarding workflow:

Developer → Generate Keys → Send Public Key → Admin installs in `authorized_keys` → Passwordless SSH.

---

## 6. Linux Boot Process

Understand:

```
Power ON

↓

BIOS / UEFI

↓

GRUB

↓

Linux Kernel

↓

systemd

↓

Login Shell
```

---

## 7. Process Management

Commands:

```bash
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

Understand:

- PID
- Background jobs
- CPU usage
- Memory usage

---

## 8. Systemd

Commands:

```bash
systemctl start
systemctl stop
systemctl restart
systemctl enable
systemctl disable
systemctl status
```

Understand:

```
start
```

Starts now.

```
enable
```

Starts automatically after reboot.

---

## 9. Logs

Commands:

```bash
journalctl
journalctl -fu ssh
journalctl --since "1 hour ago"
```

Understand:

- Service logs
- Live log monitoring

---

## 10. Text Processing

Commands:

```bash
grep
awk
sed
cut
sort
uniq
wc
```

Example:

```bash
cat file.log | grep ERROR
```

---

## 11. Pipelines

Understand:

```
Command A

↓

Command B

↓

Command C
```

Example:

```bash
cat log.txt | grep ERROR | sort | uniq -c
```

---

## 12. Package Management

Ubuntu:

```bash
apt
apt install
apt remove
apt update
apt upgrade
```

Red Hat:

```bash
yum
dnf
```

---

## 13. Shell Scripting

Create:

```
system-info.sh
```

Print:

- Hostname
- OS
- Kernel
- Uptime
- Disk
- Memory
- Top Processes

Learn:

```
#!/bin/bash
```

Execute permission:

```bash
chmod +x system-info.sh
```

Run:

```bash
./system-info.sh
```

---

## 14. `/proc` Filesystem

Explore:

```bash
cat /proc/cpuinfo

cat /proc/meminfo

cat /proc/net/dev
```

Understand:

Linux exposes system information as files.

---

## 15. Ulimits

Commands:

```bash
ulimit -n

ulimit -u
```

Understand:

- File descriptor limits
- Process limits

---

## 16. SELinux / AppArmor (Awareness)

Know:

- Mandatory Access Control (MAC)
- Difference from file permissions
- Why container platforms and Kubernetes care about them

---

# 🛠️ Hands-on Labs Completed

- Created a Linux user.
- Learned the importance of `useradd -m`.
- Explored `/etc/passwd`.
- Generated an ED25519 SSH key pair.
- Learned the difference between private and public keys.
- Created `.ssh` and `authorized_keys`.
- Understood how SSH trust is established.
- Discussed the real-world onboarding process for DevOps engineers.

---

# 📖 Key Concepts to Remember

- Everything in Linux starts from `/`.
- Configuration lives in `/etc`.
- Logs are commonly stored in `/var/log`.
- Home directories belong under `/home`.
- Permissions determine who can read, write, or execute files.
- Every Linux user has a UID and a home directory.
- SSH keys are more secure than passwords.
- **Never share your private key.**
- `authorized_keys` is the server's list of trusted public keys.
- `systemd` manages services.
- `journalctl` is the first place to look when a service fails.
- Linux tools are designed to work together using pipelines.

---

# 🎯 Day 1 Outcome

By the end of Day 1, you should be able to:

- Navigate the Linux filesystem confidently.
- Manage files and directories.
- Understand and modify file permissions.
- Create and manage users.
- Explain how SSH key authentication works.
- Generate and use an SSH key pair.
- Understand the Linux boot process.
- Monitor running processes.
- Manage services with `systemctl`.
- Read service logs with `journalctl`.
- Use basic text-processing commands.
- Write and execute a simple shell script.

This foundation will make the upcoming topics—Git, Docker, CI/CD, Kubernetes, and cloud platforms—much easier to understand because they all build on these Linux fundamentals.
