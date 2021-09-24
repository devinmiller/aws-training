# Databases on AWS

## Relational Database Service (RDS)

Amazon Relational Database Service (Amazon RDS) is a web service that makes it easier to set up, operate, and scale a relational database in the AWS Cloud. It provides cost-efficient, resizable capacity for an industry-standard relational database and manages common database administration tasks.

### Features

RDS takes over many of the difficult and tedious management tasks of a relational database:

- If you need more CPU, less IOPS, or more storage, you can easily allocate them.
- Amazon RDS manages backups, software patching, automatic failure detection, and recovery.
- You can have automated backups performed when you need them, or manually create your own backup snapshot. You can use these backups to restore a database.
- You can use the database products you are already familiar with: MySQL, MariaDB, PostgreSQL, Oracle, Microsoft SQL Server.
- You can get high availability with a primary instance and a synchronous secondary instance that you can fail over to when problems occur.
- In addition to the security in your database package, you can help control who can access your RDS databases by using AWS Identity and Access Management (IAM) to define users and permissions.

[What is RDS?](https://docs.aws.amazon.com/AmazonRDS/latest/UserGuide/Welcome.html#Welcome.Concepts.DBInstance)

## DynamoDB

Amazon DynamoDB is a fully managed NoSQL database service that provides fast and predictable performance with seamless scalability. DynamoDB lets you offload the administrative burdens of operating and scaling a distributed database so that you don't have to worry about hardware provisioning, setup and configuration, replication, software patching, or cluster scaling. DynamoDB also offers encryption at rest, which eliminates the operational burden and complexity involved in protecting sensitive data.

### Features

- Create database tables that can store and retrieve any amount of data and serve any level of request traffic
- Scale up or scale down your tables' throughput capacity without downtime or performance degradation 
- Create full, on-demand backups of your tables for long-term retention and archival for regulatory compliance needs
- Create on-demand backups and enable point-in-time recovery for your Amazon DynamoDB tables
  - Point-in-time recovery helps protect your tables from accidental write or delete operations
- Allows you to delete expired items from tables automatically to help you reduce storage usage and the cost of storing data that is no longer relevant

[What is DynamoDB](https://docs.aws.amazon.com/amazondynamodb/latest/developerguide/Introduction.html)

## Redshift

Amazon Redshift is a fully managed, petabyte-scale data warehouse service in the cloud. You can start with just a few hundred gigabytes of data and scale to a petabyte or more. This enables you to use your data to acquire new insights for your business and customers. 

[What is Redshift?](https://docs.aws.amazon.com/redshift/latest/mgmt/welcome.html)

## Aurora

Amazon Aurora (Aurora) is a fully managed relational database engine that's compatible with MySQL and PostgreSQL.

[What is Aurora?](https://docs.aws.amazon.com/AmazonRDS/latest/AuroraUserGuide/CHAP_AuroraOverview.html)

## Elasticache

Amazon ElastiCache allows you to seamlessly set up, run, and scale popular open-source compatible in-memory data stores in the cloud. Build data-intensive apps or boost the performance of your existing databases by retrieving data from high throughput and low latency in-memory data stores.

[What is Elasticache for Redis?](https://docs.aws.amazon.com/AmazonElastiCache/latest/red-ug/WhatIs.html)

[What is Elasticache for Memcached?](https://docs.aws.amazon.com/AmazonElastiCache/latest/mem-ug/WhatIs.html)

## Database Migration Service (DMS)

AWS Database Migration Service (AWS DMS) is a cloud service that makes it easy to migrate relational databases, data warehouses, NoSQL databases, and other types of data stores. You can use AWS DMS to migrate your data into the AWS Cloud or between combinations of cloud and on-premises setups. 

[What is DMS?](https://docs.aws.amazon.com/dms/latest/userguide/Welcome.html)

## Elastic Map Reduce (EMR)

Amazon EMR (previously called Amazon Elastic MapReduce) is a managed cluster platform that simplifies running big data frameworks, such as Apache Hadoop and Apache Spark, on AWS to process and analyze vast amounts of data. Using these frameworks and related open-source projects, you can process data for analytics purposes and business intelligence workloads. Amazon EMR also lets you transform and move large amounts of data into and out of other AWS data stores and databases, such as Amazon Simple Storage Service (Amazon S3) and Amazon DynamoDB. 

[What is EMR?](https://docs.aws.amazon.com/emr/latest/ManagementGuide/emr-what-is-emr.html)

## Exam Tips

- Databases
  - RDS (Online Transaction Processing)(OLTP)
    - SQL
    - MySQL
    - PostgreSQL
    - Oracle
    - Aurora
    - MariaDB
  - DynamoDB (No SQL)
  - Red Shift (Online Analytics Processing)(OLAP)
    - Used for Business Intelligence or Data Warehousing
  - ElastiCache
    - Used to speed up performance of existing databases
      - Memcached
      - Redis
- RDS
  - RDS runs on virtual machines
    - You cannot log in to these virtual machines however
  - Patching of the RDS operating system and database is Amazon's responsibility
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
- DynamoDB
  - Serverless
  - Stored on SSD storage
  - Spread across 3 geographically distinct data centers
  - Eventual Consistent Reads (Default)
    - If you repeat your read request after a short time (1 second), the response should return the latest data
  - Strongly Consistent Reads
    - When you request a strongly consistent read, DynamoDB returns a response (less than 1 second) with the most up-to-date data, reflecting the updates from all prior write operations that were successful.
  - DynamoDb Accelerator (DAX)
    - Fully managed, highly available, in-memory cache
    - 10x performance improvement
    - Reduces request time from milliseconds to microseconds
  - Transactions
    - Multiple "all-or-nothing" operations
      - Financial Transactions
      - Fullfilling Orders
    - Two underlying reads or writes (prepare/commit) for every item in transaction
    - Operate on up to 25 items or 4MB or data
  - On-Demand Capacity
    - Pay-per-request pricing
      - Balance cost and performance
    - No minimum capacity
    - No charge for read/write - only storage and backups
    - Pay more per request than with provisioned capacity
    - Use for new product launches with unknown comsumption
  - On-Demand Backup and Restore
    - Full backups at any time
    - Zero impact on table performance or availability
    - Consistent within seconds and retained until deleted
    - Operates within the same region as the source table
      - No cross region backups
  - Point-in-Time Recovery (PITR)
    - Protects against accidental writes or deletes
    - Restore to any point in the last 35 days
    - Incremental backups
    - Not enabled by default
    - Latest restorable: 5 minutes in the past
  - Streams
    - Time-ordered sequence of item-level changes in a table
    - Stored for 24 hours
    - Inserts, updatedm and deletes
    - Combine with Lambda functions for functionality like stored procedures
  - Global Tables
    - Managed multi-master, multi-region replication
    - Globally distributed applications
    - Based on DynamoDB streams
    - Multi-region redundancy for DR or HA
    - No application rewrites
    - Replication latency under one second
  - Security
    - Encryption at rest using KMS
    - Site-to-site VPN
    - Direct Connect (DX)
    - IAM policies and roles
    - Fine-grained access
    - CloudWatch and CloudTrail
    - VPC endpoints
- Redshift
  - Used for business intelligence
  - Available in only 1 availability zone
  - Backups
    - Enabled by default with a one day retention period
    - Maximum retention peroid is 35 days
    - Always attempts to maintain at least three copies of your data
    - Can also asynchronously replicate your snapshots to S3 in another region for disaster recovery
- Aurora
  - Two copies of your data are contained in each availabiliy zone
    - Minimum of three availability zones
    - Total of six copies of your data
  - You can share Aurora Snapshots with other AWS accounts
  - Three types of replicas are available
    - Aurora replicas
    - MySQL replicas
    - PostgreSQL replicas
  - Automated failover is only available with Aurora replicas
  - Use Aurora Serverless if you want a simple, cost-effective option for infrequent, intermitten, or unpredictable workloads
- Elasticache
  - Used Elasticache to increase database and web application performance
  - Redis is Multi-AZ
  - You can do back ups and restores of Redis
- Database Migration Service (DMS)
  - DMS allows you to migrate databases from one source to AWS
  - You can do homogenous migrations (same DB engines) or heterogeneous migrations
  - The source can either be on-premises, or inside AWS itself or another cloud provider such as Azure
  - If you do a heterogeneous migration, you will need the AWS Schema Conversion Tool (SCT)
- Caching
  - Services with caching capabilities
    - CloudFront
    - API Gateway
    - Elasticache (Memcached and Redis)
    - DynamoDB Accelerator (DAX)
  - Balancing act between up-to-date, accuration information and latency
- Elastic Map Reduce (EMR)
  - Used for big data processing
  - Consists of a master node, a core node, and (optionally) a task node
  - By default, log data is stored on the master node
  - Can configure replication to S3 on five-minute intervals for all log data from the master node
    - Can only be configured when creating the cluster for the first time