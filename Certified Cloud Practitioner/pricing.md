# How AWS Pricing Works

[AWS Pricing Whitepaper](http://d1.awsstatic.com/whitepapers/aws_pricing_overview.pdf)

## Introduction

AWS offers on-demand, pay-as-you-go, and reservation-based payment models, 
enabling you to obtain the best return on your investment for each specific use case.

## Key Principles

### Fundamentals of Pricing

There are three fundamental drivers of cost in AWS:

1. Compute
1. Storage
1. Outbound data transfer

- No charge for inbound data transfer
  - In most cases, but there are exceptions!
- Outbound data transfer is aggregated across services
  - Charged at the outbound data transfer rate
  - Appears on the statement as "AWS Data Transfer Out"
  - The more data transferred, the less you pay per GB
- You pay hourly for compute resources
  - From the time you launch until the time you terminate
  - Unless using a reservation with agreed upon cost
- Data storage and transfer is typically pay per GB

### Cost Optimization

When it comes to understanding pricing and optimizing your costs, it’s never
too early to start.

#### Cost Management Services

Use Cases | Capabilities | AWS Resources
--- | --- | ---
Organize | Cost allocation and governance via tagging strategy   | AWS Cost Allocation \| AWS Cost Categories
Report   | Awareness and accountability with detailed cost data  | AWS Cost Explorer \| AWS Cost and Usage Report
Access   | Track billing information across the organization     | AWS Consolidated Billing \| AWS Credits
Control  | Establish effective governance mechanisms             | AWS IAM \| AWS Organizations \| AWS Control Tower
Forecast | Estimate your resource utilization and spend          | AWS Cost Explorer (self-service) \| AWS Budgets (event driven)
Budget   | Custom budget thresholds and auto alert notifications | AWS Budgets
Inspect  | Resource deployment and cost optimization             | AWS Cost Explorer

### Power of Flexibility

AWS services are priced independently and transparently.

- Choose and pay for exactly what you need
- No minimum commitments or long term contracts
  - Unless saving money through a reservation model
- Don't pay for resources that are not running
  - Turn off instances that you don't use to reduce cost

### Use the Right Pricing Model

AWS offers several pricing models depending on product. These include:

- On Demand
  - Pay for compute or database capacity with no long term commitments or
  upfront payments
- Dedicated Instances
  - Run in a VPC on hardware that is dedicated to a single customer
- Spot Instances
  - Purchase spare computing capacity at discount hourly rates
- Reservations
  - Receive a greater discount by paying for capacity ahead of time
  - Reservation options include:
    - EC2 Reserved Instances
    - DynomoDB Reserved Capacity
    - ElastiCache Reserved Nodes
    - RDS Reserved Instances
    - Redshift Reserved Nodes

### Free Tier

The AWS Free Tier enables you to gain free, hands-on experience with the AWS
platform, products, and services. AWS Free Tier includes offers that expire 12
months after sign-up and others that never expire.

The following free-tier offers are only available to new AWS customers, and
are available for 12 months following your AWS sign-up date:

- Elastic Compute Cloud (EC2)
- Simple Storage Service (S3)
- Relational Database Service (RDS)
- CloudFront

The following free-tier offers do not automatically expire at the end of your
12-month AWS Free Tier term and are available to all AWS customers:

- DynamoDB
- Glacier
- Lambda

### Pricing Details for Individual Services

Different types of services lend themselves to different pricing models. For
example, Amazon EC2 pricing varies by instance type, while the Amazon Aurora
database service includes charges for data input/output (I/0) and storage.

#### Elastic Compute Cloud (EC2)

There are four ways to pay for Amazon EC2 instances:

- On-Demand Instances
  - Pay for compute capacity per hour or second based on instance
  - No long term commitments of upfront payments
  - On-Demand Instances are recommended for:
    - Users who prefer low cost and flexibility without upfront payment or
    long-term commitments
    - Applications with short-term, spiky, or unpredictable workloads that
    cannot be interrupted
    - Applications being developed or tested on Amazon EC2 for the first time
- Spot Instances
  - Request spare EC2 computing capacity for a significant discount
  - If your maximum bid exceeds the current Spot price, your bid request is fulfilled
  - Instances will run until either you choose to terminate them or the Spot
  price exceeds your maximum bid
  - Spot Instances are recommended for:
    - Applications that have flexible start and end times
    - Applications that are only feasible at very low compute prices
    - Users with urgent computing needs for a lot of additional capacity
- Reserved Instances
  - Provide significant discounts over On-Demand Instance pricing
  - Reserved Instances are recommended for:
    - Applications with steady-state usage
    - Applications that require reserve capacity
    - Customers who can commit to a 1- or 3-year term
- Dedicated Host
  - A physical EC2 server dedicated for your use
  - Help reduce costs by allowing use of existing server-bound software licenses
  - Can also help meet compliance requirements

##### Per-Second Billing

Per-second billing is available for Linux instances across On-Demand,
Reserved, and Spot Instances. Similarly, provisioned storage for EBS volumes
is billed in one-second increments.

It is particularly effective for resources that have periods of low and high
usage such as development and testing, data processing, analytics, batch
processing, and gaming applications.

##### Estimating EC2 Costs

When you begin to estimate the cost of using Amazon EC2, consider the following:

- Clock hours of server time
  - Resources incur charges when they are running
- Instance type
  - EC2 provides a wide selection of instance types
  - Varying combinations of CPU, memory, storage, and networking capacity
- Pricing model
  - On-Demand
  - Reserved
  - Spot
- Number of instances
  - Provision multiple instances of EC2/ELB to handle peak loads
- Load balancing
  - An Elastic Load Balancer (ELB) can be used to distribute traffic across Ec2
  instances
  - Hours run and data processed of ELB contribute to monthly cost
- Detailed monitoring
  - For a fixed monthly rate, detailed monitoring can be enabled
- Auto Scaling
  - Adjusts the number of instances in a deployment based on defined conditions
  - No additional charge for service beyond cloudWatch fees
- Elastic IP addresses
  - One Elastic IP address associated with a running instance at no charge
- OS and software
  - Operating system prices are included in instance prices
    - Unless you choose to bring your own license
  - Nonstandard operating systems, Oracle, and Windows Server applications
  require a separate license

#### Lambda

With AWS Lambda, you pay only for what you use.

- Charged based on the number of requests and time to execute code
- A request is registered each execution starts in response to an event
notification or invoke call
  - Includes test invokes from the console
- Charged for the total number of requests across all functions
- Execution time is rounded up to the nearest 100 milliseconds
- Price depends on amount of memory allocated to function

#### Elastic Block Store (EBS)

Amazon EBS volumes are off-instance storage that persists independently from
the life of an instance. They are analogous to virtual disks in the cloud.
Amazon EBS provides two volume types:

- SSD-backed volumes
  - Optimized for transactional workloads
- HDD-backed volumes
  - Optimized for large streaming workloads

Amazon EBS pricing includes three factors:

- Volumes
  - Charged by the amount of GB provisioned per month
- Snapshots
  - Based on the amount of space snapshot data consumes in S3
  - Empty blocks are not saved as part of a snapshot
  - Copying is charged based on volume of data transferred across regions
- Data transfer
  - Inbound data transfer is free
  - Outbound data transfer charges are tiered

#### Simple Storage Service (S3)

With Amazon S3, you pay only for the storage you use, with no minimum fee.
Prices are based on the location of your Amazon S3 bucket. When you begin to
estimate the cost of Amazon S3, consider the following:

- Storage class
  - Cost varies based on the selected storage class
  - Often a trade-off between availability, data retrieval times, and
  frequency of data retrieval
- Storage
  - Along with the type of storage, the number and size of objects in S3
  buckets impact cost
- Requests
  - The number and type of requests
  - GET requests incur different charges than PUT or COPY requests
- Data transfer
  - The amount of data transferred out of the Amazon S3 region

#### Relational Data Service (RDS)

Amazon RDS is a web service that makes it easy to set up, operate, and scale a
relational database in the cloud.  The factors that drive the costs of Amazon
RDS include:

- Clock hours of server time
  - Resources incur charges when they are running
- Database characteristics
  - Charges vary depending on engine, size, and memory
- Database purchase type
  - On-Demand vs Reserved
- Number of database instances
  - Provision multiple DB instances to handle peak loads
- Provisioned storage
  - No additional charge for backup storage of active DB instance
    - Up to 100 percent of your provisioned database storage
  - Billed per GB for backup storage or terminated DB instance
- Additional storage
  - Amount of backup storage in addition to the provisioned storage amount is
  billed per GB per month
- Requests
  - Number of input and output requests
- Deployment type
  - Single availability zone vs multiple availability zones
- Data transfer
  - Inbound data transfer is free
  - Outbound data transfer costs are tiered

#### DynamoDB

Unlike traditional NoSQL deployments that ask you to think about memory, CPU,
and other system resources that could affect your throughput, DynamoDB simply
asks you to specify the target utilization rate and minimum to maximum
capacity that you want for your table. DynamoDB handles the provisioning of
resources to achieve your target utilization of read and write capacity, then
auto-scales your capacity based on usage. Optionally, you can directly specify
read and write capacity if you prefer to manually manage table throughput.

##### Indexed data storage

Amazon DynamoDB is an SSD-backed indexed datastore

Amazon DynamoDB measures the size of your billable data by adding up the raw
byte size of the data you upload, plus a per-item storage overhead of 100
bytes to account for indexing. You do not need to “provision” storage with
Amazon DynamoDB. You are simply billed for what you use.

##### Data transfer

There is no additional charge for data transferred between Amazon DynamoDB and
other Amazon Web Services within the same Region. Data transferred across
Regions (e.g., between Amazon DynamoDB in the US East (Northern Virginia)
Region and Amazon EC2 in the EU (Ireland) Region) will be charged on both
sides of the transfer.

##### Global Tables

Global Tables builds on DynamoDB’s global footprint to provide you with a
fully managed, multiregion, and multimaster database that provides fast local
read and write performance for massively scaled, global applications. Global
Tables replicates your Amazon DynamoDB tables automatically across your choice
of AWS regions.

When using Global Tables, you are charged based on the resources associated
with each replica table.

#### CloudFront

Amazon CloudFront charges are based on the data transfers and requests used to
deliver content to your customers.

When you begin to estimate the cost of Amazon CloudFront, consider the following:

- Traffic distribution
  - Data transfer and request pricing varies across geographic regions
  - Pricing is based on the edge location through which content is served
- Requests
  - Number and type of requests (HTTP or HTTPS) made
  - The geographic region in which the requests are made
- Data transfer out
  - Amount of data transferred out of edge locations
