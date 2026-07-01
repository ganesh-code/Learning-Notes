1. Amazon S3
   What is it?

Amazon S3 (Simple Storage Service) is AWS's object storage service used to store files.

Definition

Amazon S3 is a highly scalable, durable, and secure object storage service used to store and retrieve any amount of data from anywhere.

Real-Life Usage

Companies store:

Instagram → Photos
Netflix → Movies
Amazon → Product Images
Hospitals → Patient Reports
Banks → Statements
Companies → Backups 2. Bucket
What is it?

A bucket is a container inside S3.

Definition

A bucket is a logical container used to store objects (files) in Amazon S3.

Real-Life Usage

Example:

company-images

logo.png

product1.jpg

product2.jpg

Every company creates separate buckets for:

Images
Backups
Logs
Documents 3. Object
What is it?

An object is simply a file stored inside an S3 bucket.

Definition

An object consists of the file, metadata, and a unique key inside an S3 bucket.

Real-Life Usage

Examples:

invoice.pdf
photo.jpg
backup.zip
video.mp4 4. Versioning
What is it?

Keeps multiple versions of the same object.

Definition

Versioning protects data by preserving previous versions of objects even after modification or deletion.

Real-Life Usage

If a developer accidentally deletes customer invoices,

Versioning allows recovery.

Used in:

Hospitals
Banks
Enterprise Applications 5. Lifecycle Rules
What is it?

Automatically moves old files to cheaper storage or deletes them.

Definition

Lifecycle Rules automate object transitions between storage classes and object expiration based on age.

Real-Life Usage

Example:

30 Days

↓

Standard-IA

↓

90 Days

↓

Glacier

↓

365 Days

↓

Delete

Used to reduce AWS storage costs.

6. Bucket Policy
   What is it?

Rules that decide who can access the bucket.

Definition

A Bucket Policy is a resource-based IAM policy attached directly to an S3 bucket.

Real-Life Usage

Allow:

EC2
CloudFront
Another AWS Account

Deny:

Everyone else 7. ACL (Access Control List)
What is it?

Old permission system for buckets and objects.

Definition

ACL is a legacy permission mechanism that grants basic read/write permissions to AWS accounts.

Real-Life Usage

Rarely used today.

Most companies prefer:

IAM
Bucket Policies 8. Block Public Access
What is it?

Prevents buckets from becoming public.

Definition

Block Public Access prevents public access to S3 buckets and objects, even if a policy or ACL accidentally grants public permissions.

Real-Life Usage

Enabled for:

Hospitals
Banks
HR Documents
Customer Data

Almost always ON in production.

9. S3 Standard
   What is it?

Default storage class.

Definition

Standard Storage is designed for frequently accessed data.

Real-Life Usage
Website Images
User Photos
Mobile App Assets 10. Standard-IA
What is it?

Infrequent Access Storage.

Definition

Storage class for data accessed less frequently but requiring immediate access.

Real-Life Usage
Monthly Backups
Old Reports
Previous Month Invoices 11. Glacier Instant Retrieval
What is it?

Archive storage with instant access.

Definition

Low-cost archive storage that still provides millisecond retrieval.

Real-Life Usage
Insurance Documents
Medical Records
Audit Files 12. Glacier Deep Archive
What is it?

Cheapest storage class.

Definition

Long-term archival storage with retrieval times of several hours.

Real-Life Usage
Government Records
Legal Documents
10-Year Backups 13. Pre-Signed URL
What is it?

Temporary secure URL.

Definition

A Pre-Signed URL grants temporary access to a specific object in a private S3 bucket.

Real-Life Usage

Amazon:

Customer downloads invoice.

Hospital:

Doctor downloads patient report.

Bucket remains private.

14. aws s3 sync
    What is it?

Synchronizes files.

Definition

AWS CLI command that synchronizes a local directory and an S3 bucket by copying only new or modified files.

Real-Life Usage
Website Deployment
Daily Backups
Static Website Hosting 15. --delete
What is it?

Deletes extra files.

Definition

Removes files from the destination that don't exist in the source.

Real-Life Usage

Keeps production website exactly the same as the latest build.

16. S3 Access Logging
    What is it?

Records bucket access.

Definition

Server Access Logging records requests made to an S3 bucket.

Real-Life Usage

Audit:

Who downloaded files?

Who uploaded files?

Who deleted files?

17. CloudWatch
    What is it?

AWS Monitoring Service.

Definition

Amazon CloudWatch collects metrics, logs, and events to monitor AWS resources and applications.

Real-Life Usage

Monitor:

CPU
Network
Disk
Application Logs 18. Metrics
What is it?

Performance numbers.

Definition

A metric is a numerical measurement collected over time.

Real-Life Usage

CPU:

75%

Memory:

60%

Network:

500 MB

19. Log Groups
    What is it?

Container for logs.

Definition

A Log Group is a collection of log streams that share the same retention and monitoring settings.

Real-Life Usage

Separate logs for:

Nginx
Application
Payment Service
Database 20. Metric Filters
What is it?

Searches logs for patterns.

Definition

Metric Filters convert matching log patterns into CloudWatch metrics.

Real-Life Usage

Count:

ERROR
Exception
Login Failed

Automatically create alarms.

21. Dashboard
    What is it?

Monitoring screen.

Definition

CloudWatch Dashboards display metrics and alarms in a single view.

Real-Life Usage

DevOps teams monitor:

CPU
Memory
Errors
Requests 22. CloudWatch Alarm
What is it?

Automatic monitoring alert.

Definition

A CloudWatch Alarm watches a metric and performs actions when thresholds are crossed.

Real-Life Usage

CPU

80%

↓

Email

↓

DevOps Engineer

23. SNS
    What is it?

Notification Service.

Definition

Amazon SNS sends notifications through Email, SMS, Lambda, HTTP endpoints, and other AWS services.

Real-Life Usage

CloudWatch Alarm

↓

SNS

↓

Email

24. CloudWatch Agent
    What is it?

Log collection software.

Definition

The CloudWatch Agent collects operating system metrics and log files from EC2 instances and sends them to CloudWatch.

Real-Life Usage

Collect:

Nginx Logs
Apache Logs
System Logs
Application Logs 25. GuardDuty
What is it?

Threat Detection Service.

Definition

Amazon GuardDuty continuously monitors AWS environments for malicious or suspicious activity using AWS threat intelligence and log analysis.

Real-Life Usage

Detect:

Malicious IPs
Stolen Credentials
Crypto Mining
Port Scanning 26. Security Hub
What is it?

Central Security Dashboard.

Definition

AWS Security Hub aggregates and prioritizes security findings from multiple AWS security services into a single dashboard.

Real-Life Usage

Shows findings from:

GuardDuty
Inspector
Macie
IAM Access Analyzer 27. RDS Multi-AZ
What is it?

High Availability feature.

Definition

Multi-AZ creates a synchronously replicated standby database in another Availability Zone and automatically fails over if the primary database fails.

Real-Life Usage

Banking

E-commerce

Healthcare

Any production application requiring high availability.

28. Read Replica
    What is it?

Read Scaling feature.

Definition

Read Replicas use asynchronous replication to create read-only copies of a database for handling read traffic.

Real-Life Usage

Netflix

Amazon

Instagram

Millions of users reading data.

29. Automated Backups
    What is it?

Automatic database backup.

Definition

RDS Automated Backups create daily snapshots and transaction log backups, allowing point-in-time recovery within the configured retention period.

Real-Life Usage

Recover database after:

Accidental deletion
Data corruption
Failed deployment 30. Backup Window
What is it?

Scheduled backup time.

Definition

The Backup Window is the preferred daily time during which RDS performs automated backups.

Real-Life Usage

Usually scheduled during:

Midnight
Low Traffic Hours

To reduce impact on users.

31. Parameter Groups
    What is it?

Database configuration settings.

Definition

Parameter Groups are collections of database engine configuration values that control how an RDS database behaves.

Real-Life Usage

Configure:

Maximum Connections
Query Timeout
Logging
Memory Settings
Character Sets
