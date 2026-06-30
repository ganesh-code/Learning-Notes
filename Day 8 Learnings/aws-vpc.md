# AWS VPC & EC2 Notes (Day 8)

> Date: 30 June 2026

---

# Objective

Build a secure AWS infrastructure from scratch by creating a VPC, public/private subnets, route tables, Internet Gateway, launching an EC2 instance, configuring Security Groups, and attaching an IAM Role without using hardcoded AWS credentials.

---

# AWS VPC

## What is a VPC?

VPC (Virtual Private Cloud) is a logically isolated virtual network inside AWS where you launch your AWS resources.

Think of it as your own private data center inside AWS.

A VPC allows you to control:

- IP Address Range
- Subnets
- Route Tables
- Internet Connectivity
- Security
- Network Access

---

## Why use a VPC?

Without a VPC, all AWS resources would share the same network.

A VPC provides:

- Network Isolation
- Better Security
- Custom Networking
- Traffic Control
- Scalability

---

# CIDR Block

CIDR (Classless Inter-Domain Routing) defines the IP address range available for a network.

Example:

```
10.0.0.0/16
```

Meaning:

- Network Address: 10.0.0.0
- Prefix Length: /16
- Total IPs = 65,536

Formula:

```
2^(32-prefix)
```

Example:

| CIDR | Total IPs |
| ---- | --------- |
| /16  | 65,536    |
| /24  | 256       |
| /28  | 16        |
| /32  | 1         |

AWS reserves the first 4 IPs and the last IP of every subnet.

Example:

```
10.0.1.0/24

Reserved

10.0.1.0
10.0.1.1
10.0.1.2
10.0.1.3
10.0.1.255
```

---

# Subnets

A subnet is a smaller network inside a VPC.

Example

VPC

```
10.0.0.0/16
```

Subnets

```
Public

10.0.1.0/24

Private

10.0.2.0/24
```

## Public Subnet

A subnet is public when its Route Table contains a route to an Internet Gateway.

Usually contains:

- Bastion Host
- Load Balancer
- Public EC2

## Private Subnet

Cannot receive direct internet traffic.

Usually contains:

- Application Servers
- Databases
- Redis
- Internal Services

---

# Route Table

A Route Table determines where network traffic should go.

Public Route

```
Destination

0.0.0.0/0

↓

Internet Gateway
```

Private Route

```
Destination

0.0.0.0/0

↓

NAT Gateway
```

Each subnet must be associated with a Route Table.

---

# Internet Gateway (IGW)

Internet Gateway enables communication between a VPC and the Internet.

Without an Internet Gateway:

- No Incoming Internet Traffic
- No Outgoing Internet Traffic

Flow

```
Internet

↓

Internet Gateway

↓

Public Subnet

↓

EC2
```

---

# NAT Gateway

A NAT Gateway allows private instances to access the Internet without allowing the Internet to initiate connections to them.

Used for:

- yum update
- apt update
- Docker Pull
- Git Clone

Flow

```
Private EC2

↓

NAT Gateway

↓

Internet
```

Key Point

Internet cannot directly access Private EC2.

---

# Security Groups

Security Group acts as a virtual firewall attached to an EC2 instance.

Characteristics

- Stateful
- Instance Level
- Allow Rules Only

Example

| Type | Port |
| ---- | ---- |
| SSH  | 22   |
| HTTP | 80   |

Everything else blocked.

Inbound Rules

Defines who can access the EC2 instance.

Outbound Rules

Defines where the EC2 instance can connect.

---

# NACL (Network ACL)

Network ACL protects an entire subnet.

Characteristics

- Stateless
- Subnet Level
- Supports Allow and Deny Rules
- Uses Rule Numbers

Example

```
100 Allow HTTP

200 Allow SSH

300 Deny All
```

Both inbound and outbound rules must be configured.

---

# Security Group vs NACL

| Feature        | Security Group | NACL                  |
| -------------- | -------------- | --------------------- |
| Level          | Instance       | Subnet                |
| Stateful       | Yes            | No                    |
| Stateless      | No             | Yes                   |
| Allow Rules    | Yes            | Yes                   |
| Deny Rules     | No             | Yes                   |
| Rule Numbers   | No             | Yes                   |
| Return Traffic | Automatic      | Must Allow Explicitly |

---

# Amazon EC2

EC2 (Elastic Compute Cloud) is a virtual server running in AWS.

Uses

- Host Websites
- Run Applications
- Backend APIs
- Databases
- Jenkins
- Docker
- Kubernetes Nodes

---

# EC2 Components

## AMI

Amazon Machine Image

Operating System Template.

Examples

- Ubuntu
- Amazon Linux
- Red Hat
- Windows

---

## Instance Type

Determines CPU, RAM and Network Performance.

Examples

```
t2.micro

t3.micro

m5.large

c7g.large

r7g.large
```

---

## EBS

Elastic Block Storage

Persistent disk attached to EC2.

Data remains even if EC2 is stopped.

Types

- gp3
- io2
- st1
- sc1

---

## Key Pair

Used for SSH authentication.

Private Key

```
.pem
```

Never share the private key.

---

# User Data

A shell script that automatically runs when an EC2 instance starts for the first time.

Example

```bash
#!/bin/bash

yum update -y
yum install httpd -y

systemctl enable httpd
systemctl start httpd

echo "Hello AWS" > /var/www/html/index.html
```

Uses

- Install packages
- Configure servers
- Deploy applications
- Bootstrap EC2 instances

---

# IAM Role

IAM Role provides temporary AWS credentials to EC2 instances.

Benefits

- No Hardcoded Keys
- Temporary Credentials
- Secure
- Automatically Rotated

Flow

```
EC2

↓

IAM Role

↓

AWS STS

↓

Temporary Credentials

↓

S3 / DynamoDB / Secrets Manager
```

Verification

```
aws sts get-caller-identity
```

---

# AWS Architecture Built

```
                    Internet
                        │
                        ▼
               Internet Gateway
                        │
                        ▼
        +-------------------------------+
        |            VPC                |
        |       10.0.0.0/16             |
        |                               |
        | Public Subnet                 |
        | 10.0.1.0/24                   |
        |                               |
        |  EC2 (Web Server)             |
        |        │                      |
        |        │                      |
        | Route Table                   |
        |        │                      |
        |-------------------------------|
        | Private Subnet                |
        | 10.0.2.0/24                   |
        |                               |
        | Database / App Server         |
        |        │                      |
        |        ▼                      |
        |      NAT Gateway              |
        +-------------------------------+
```

---

# Commands Used

## SSH into EC2

```bash
chmod 400 devops-key.pem

ssh -i devops-key.pem ec2-user@PUBLIC_IP
```

---

## Verify AWS CLI

```bash
aws --version
```

---

## Verify IAM Role

```bash
aws sts get-caller-identity
```

---

## Create Script

```bash
touch system-info.sh
```

---

## Give Execute Permission

```bash
chmod +x system-info.sh
```

---

## Execute Script

```bash
./system-info.sh
```

---

## Check Disk Usage

```bash
df -h
```

---

## Check Memory

```bash
free -h
```

---

## Check CPU

```bash
lscpu
```

---

## Check Hostname

```bash
hostname
```

---

## Check IP Address

```bash
hostname -I
```

---

# Screenshots to Capture

- AWS VPC Dashboard
- Public Subnet
- Private Subnet
- Route Tables
- Internet Gateway
- NAT Gateway (if created)
- Security Group Rules
- EC2 Running State
- SSH Login Terminal
- system-info.sh Output
- aws sts get-caller-identity Output
- Excalidraw Architecture Diagram
- GitHub Repository

---

# Interview Questions

### What is a VPC?

A logically isolated virtual network inside AWS used to securely host cloud resources.

---

### Difference between Public and Private Subnet?

Public subnet has a route to an Internet Gateway.

Private subnet does not.

---

### Difference between Internet Gateway and NAT Gateway?

Internet Gateway provides both inbound and outbound internet connectivity for public resources.

NAT Gateway allows only outbound internet access for private resources.

---

### Difference between Security Group and NACL?

Security Group is stateful and applied at the instance level.

NACL is stateless and applied at the subnet level.

---

### Why use IAM Roles instead of Access Keys?

IAM Roles provide temporary credentials automatically, improving security and eliminating the need to store long-term AWS access keys.

---

### How does an EC2 instance securely access S3?

Attach an IAM Role with the required S3 permissions to the EC2 instance. AWS automatically supplies temporary credentials to the instance.

---

### Why is a Security Group stateful?

When inbound traffic is allowed, the corresponding response traffic is automatically permitted without needing an explicit outbound rule.

---

### What is User Data?

A startup script that runs automatically when an EC2 instance boots for the first time, commonly used to install software and configure the server.

---

# Key Takeaways

- VPC provides an isolated network.
- CIDR defines the IP address range.
- Public subnets connect to the Internet through an Internet Gateway.
- Private subnets use a NAT Gateway for outbound internet access.
- Security Groups protect EC2 instances.
- NACLs protect entire subnets.
- EC2 is a virtual server in AWS.
- IAM Roles eliminate the need for hardcoded AWS credentials.
- User Data automates server initialization.
- Route Tables control network traffic flow.
