# Relational Database Service (RDS)

Amazon Relational Database Service (Amazon RDS) is a web service that makes it easier to set up, operate, and scale a relational database in the AWS Cloud. It provides cost-efficient, resizable capacity for an industry-standard relational database and manages common database administration tasks.

## Features

RDS takes over many of the difficult and tedious management tasks of a relational database:

- If you need more CPU, less IOPS, or more storage, you can easily allocate them.
- Amazon RDS manages backups, software patching, automatic failure detection, and recovery.
- You can have automated backups performed when you need them, or manually create your own backup snapshot. You can use these backups to restore a database.
- You can use the database products you are already familiar with: MySQL, MariaDB, PostgreSQL, Oracle, Microsoft SQL Server.
- You can get high availability with a primary instance and a synchronous secondary instance that you can fail over to when problems occur.
- In addition to the security in your database package, you can help control who can access your RDS databases by using AWS Identity and Access Management (IAM) to define users and permissions.

[What is RDS?](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html#Welcome.Concepts.DBInstance)

## Exam Tips

- RDS (Online Transaction Processing)
  - SQL
  - MySQL
  - PostgreSQL
  - Oracle
  - Aurora
  - MariaDB
- DynamoDB (No SQL)
- Red Shift (Online Analytics Processing)
  - Used for Business Intelligence or Data Warehousing
- ElastiCache
  - Used to speed up performance of existing databases
    - Memcached
    - Redis

- RDS runs on virtual machines
  - You cannot log in to these virtual machines however
- Pathcing of the RDS operating system and database is Amazon's responsibility
- RDS is _not_ serverless
- Aurora Serverless _is_ serverless

- Two types of _backups_ for RDS
  - Automated Backups
    - Scheduled
  - Database Snapshots
    - Manual

- Read Replicas
  - Can be Multi-Az
  - Used to increase performance
  - Must have _backups_turned on
  - Can be in different regions
  - Can be MySQL, PostgreSQL, MariaDB, Oracle, Aurora
  - Can be promoted to master
    - Will break the read replica
- Multi-Az
  - Used for disaster recovery
  - Force a failure over by rebooting the RDS instance
- Encryption at rest is supported by:
  - MySQL
  - PostgreSQL
  - MariaDB
  - Oracle
  - Aurora
- Encryption is done using the AWS KMS service
  - Once done, the following are encrypted:
    - Data stored at rest in underlying storage
    - Automated backups
    - read replicas
    - snapshots
