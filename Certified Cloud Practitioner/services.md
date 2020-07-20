# Overview of Amazon Web Services

Amazon Web Services offers a broad set of global cloud-based products
including compute, storage, databases, analytics, networking, mobile,
developer tools, management tools, IoT, security, and enterprise applications:
on-demand, available in seconds, with pay-as-you-go pricing

## What is Cloud Computing

Cloud computing provides a simple way to access servers, storage, databases
and a broad set of application services over the Internet. A cloud services
platform, such as Amazon Web Services, owns and maintains the network
connected hardware required for these application services, while you provision
and use what you need via a web application.

## Six Advantage of Cloud Computing

1. Trade capital expense for variable expense
1. Benefit from massive economies of scale
1. Stop guessing capacity
1. Increase speed and agility
1. Stop spending money running and maintaining data centers
1. Go global in minutes

## Types of Cloud Computing

Understanding the differences between Infrastructure as a Service, Platform as
a Service, and Software as a Service, as well as what deployment strategies
you can use, can help you decide what set of services is right for your needs.

### Cloud Computing Models

<details>

<summary>Infrastructure as a Service (IaaS)</summary>

> Think EC2.
>
> Infrastructure as a service (IaaS) is an instant computing infrastructure,
> provisioned and managed over the internet

</details>

<details>

<summary>Platform as a Service (IaaS)</summary>

> Think Elastic Beanstalk or Lightsail.  
>
> Platform as a service (PaaS) is a complete development and deployment
> environment in the cloud, with resources that enable you to deliver
> everything from simple cloud-based apps to sophisticated, cloud-enabled
> enterprise applications.

</details>

<details>

<summary>Software as a Service (SaaS)</summary>

> Think Gmail.  
>
> Software as a service (SaaS) allows users to connect to and use
> cloud-based apps over the Internet.

</details>

### Cloud Computing Deployment Models

<details>

<summary>Cloud</summary>

> A cloud-based application is fully deployed in the cloud and all parts of
> the application run in the cloud.

</details>

<details>

<summary>Hybrid</summary>

> A hybrid deployment is a way to connect infrastructure and applications
> between cloud-based resources and existing resources that are not located
> in the cloud.

</details>

<details>

<summary>On-Premises</summary>

> The deployment of resources on-premises, using virtualization and resource
> management tools, is sometimes called the “private cloud.”

</details>

## Global Infrastructure

The AWS Cloud infrastructure is built around AWS Regions and Availability
Zones.

<details>

<summary>AWS Region</summary>

> A physical location in the world with multiple (at least two) Availability > Zones.

</details>

<details>

<summary>AWS Availability Zone</summary>

> One or more discrete data centers, each with redundant power, networking,
> and connectivity housed in separate facilities

</details>

## Security and Compliance

### Security

The AWS Cloud enables a shared responsibility model.

![Shared Responsibility Model](images/Shared_Responsibility_Model.jpg)

Below are examples of controls that are managed by AWS, AWS Customers and/or both.

<details>

<summary>Inherited Controls</summary>

> Controls which a customer fully inherits from AWS.
>
> - Physical and Environmental controls

</details>

<details>

<summary>Shared Controls</summary>

> Controls which apply to both the infrastructure layer and customer layers.
>
> - Patch Management
> - Configuration Management
> - Awareness & Training

</details>

<details>

<summary>Customer Specific</summary>

> Controls which are solely the responsibility of the customer
>
> - Service and Communications Protection or Zone Security

</details>

#### Penetration Testing

AWS customers are welcome to carry out security assessments or penetration
tests against their AWS infrastructure without prior approval for 8 services,
listed below:

- EC2 Instances, NAT Gateways, and Elastic Load Balancers
- RDS
- CloudFront
- Aurora
- API Gateways
- Lambda and Lambda Edge functions
- Lightsail resources
- Elastic Beanstalk environments

#### Security Resources

- [Shared Responsibility Model](https://aws.amazon.com/compliance/shared-responsibility-model/)

### Compliance

AWS Cloud Compliance enables you to understand the robust controls in place
at AWS to maintain security and data protection in the cloud.

AWS Artifact is the central resource for compliance-related information. It
provides on-demand access to security and compliance reports and select online
agreements. Reports available in AWS Artifact include our Service Organization
Control (SOC) reports, Payment Card Industry (PCI) reports, and certifications
from accreditation bodies across geographies and compliance verticals that
validate the implementation and operating effectiveness of AWS security
controls.

## Amazon Web Services Cloud Platform

There are three ways to access AWS services -

1. Management Console
1. Command Line Interface (CLI)
1. Software Development Kits (SDKs)

### Analytics

<details>

<summary>Athena</summary>

> Run SQL queries against data stored in S3 without the need for complex
> extract, transform, and load (ETL) jobs to prepare the data for analysis.

</details>

<details>

<summary>Elastic Map Reduce (EMR)</summary>

> A big data platform for processing vast amounts of data in the cloud using
> popular open source tools.

</details>

<details>

<summary>CloudSearch</summary>

> A fully managed service for adding simple and cost effective search
> solutions to websites or applications.

</details>

<details>

<summary>Elasticsearch Service</summary>

> A service to deploy, operate and manage Elasticsearch to provide search,
> analyses, and visualization of data in real-time.

</details>

<details>

<summary>Kinesis</summary>

> A service for collecting, processing, and analyzing real-time, streaming data.

</details>

<details>

<summary>Redshift</summary>

> A fast, scalable data warehouse for analyzing data.

</details>

<details>

<summary>QuickSight</summary>

> A business intelligence (BI) service.

</details>

<details>

<summary>Data Pipeline</summary>

> A web service for moving data between different cloud sources and
> on-premise sources at specified intervals.

</details>

<details>

<summary>Glue</summary>

> A fully managed extract, load, and transform (ETL) service to prepare and
> load data for analytics.

</details>

<details>

<summary>Lake Formation</summary>

> A service to help with setting up a secure data lake.

</details>

### Application Integration

<details>

<summary>Step Functions</summary>

> Allows multiple services to be combined into serverless workflows.

</details>

<details>

<summary>Simple Queue Service (SQS)</summary>

> A fully managed message queuing service.
>
> SQS offers two types of message queues:
>
> 1. Standard queues
> 1. First In First Out (FIFO) queues

</details>

<details>

<summary>Simple Notification Service (SNS)</summary>

> A Fully managed pu/sub messaging service.

</details>

<details>

<summary>Simple Workflow (SWF)</summary>

> A service to help build, run, and scale background jobs that have sequential
> or parallel steps.

</details>

### Cost Management

<details>

<summary>Cost Explorer</summary>

> Used to visualize, understand, and manage costs and usage over time.  This
> is accomplished with the following:
>
> - Monthly costs by AWS service
>   - Includes a default report that helps you visualize the costs and usage
>   associated with your top five cost-accruing AWS services
>   - Gives you a detailed breakdown on all services in the table view
> - Hourly and resource level granularity
>   - Helps you visualize, understand, and manage your AWS costs and usage
>   over a daily or monthly granularity
>   - Lets you dive deeper using granular filtering and grouping dimensions
>   such as Usage Type and Tags
>   - Can also access your data with further granularity by enabling hourly\
>   and resource level granularity
>
> Provides Reserved Instance (RI) purchase recommendations based on past usage
> to indicate potential saving opportunities over On-Demand instances.

</details>

<details>

<summary>Budgets</summary>

> Used for the following:
>
> - Set custom budgets that alert you when your costs or usage exceed or are
forecasted to exceed your budgeted amount.
> - Set Reserved Instance (RI) utilization targets that alert when
> utilization drops below the defined threshold.
> - View current estimated charges and charges from predicted usage.
>
> Types of budgets:
>
> - Cost budgets
> - Usage budgets
> - RI utilization budgets
> - RI coverage budgets

</details>

<details>

<summary>Cost & Usage Report</summary>

> - Contains the most comprehensive set of cost and usage data available
> - Contains line items for each unique combination of AWS products, usage
> type, and operation
> - Receive reports that break down costs:
>   - By the hour or month
>   - By product or product resource
>   - By cost allocation tags that you define yourself
> - Deliver billing report files to S3 buckets in CSV format
>   - Can be loaded into Athena, Redshift, Quicksight, etc. for analysis
> - Can track your Reserved Instance utilization, charges, and allocations

</details>

### Compute

<details>

<summary>Elastic Cloud Compute (EC2)</summary>

Think virtual machines in the cloud.

A service that provides secure, resizable computer capacity in the cloud.

#### Instance Types

- On-Demand
  > Pay for compute capacity by the hour with no long-term commitments
- Reserved Instances
  > Offer significant cost saving over On-Demand for a 1 or 3 year commitment
  >
  > Choose between three payment options:
  >
  > 1. All Upfront
  > 1. Partial Upfront
  > 1. No Upfront
  >
  > Reserved Instance Types:
  >
  > - Convertible
  >   - Capability to change the attributes of the RI as long as the exchange
  >     results in the creation of RIs of equal or greater value.
  >   - Change Availability Zone, instance size (for Linux OS), networking type
  >   - Change instance families, operating system, tenancy, and payment option
  > - Scheduled
  >   - Are available to launch within the reserved time windows.
  >   - Allows matching capacity reservation to a predictable recurring
  >     schedule that only requires a fraction of a day, a week, or a month.
  >
- Spot
  > Allow for bidding on spare or unused EC2 compute capacity for a
  > significant discount.
- Dedicated Host
  > A physical server with EC2 instance capacity fully dedicated to a single
  > customer's use.
  >
  > Supports use of existing per-socket, per-core, or per-VM software licenses.

</details>

<details>

<summary>EC2 Auto Scaling</summary>

> Maintains application availability by automatically adding or removing EC2
> instances according to defined conditions.
>
> Types of scaling:
>
> - Scheduled
>   - Scale applications ahead of known load changes
> - Dynamic
>   - Scale applications based on a particular metric
> - Predictive
>   - Scale applications using machine learning traffic predictions

</details>

<details>

<summary>Elastic Container Registry (ECR)</summary>

> A fully managed Docker container registry.

</details>

<details>

<summary>Elastic Container Service (ECS)</summary>

> A container orchestration service that supports docker containers.

</details>

<details>

<summary>Elastic Container Service for Kubernetes (EKS)</summary>

> A service to deploy, manage, and scale containerized applications on AWS
> using Kubernetes.

</details>

<details>

<summary>Lightsail</summary>

> An easy way to launch and manage a virtual private server, includes a
> virtual machine, SSD storage, data transfer, DNS management, and a static IP
> address.

</details>

<details>

<summary>Batch</summary>

> Enables developers, scientists, and engineers to easily and efficiently run
> hundreds of thousands of batch computing jobs.

</details>

<details>

<summary>Elastic Beanstalk</summary>

> A service for deploying and scaling web applications and services developed
> with Java, .NET, PHP, Node.js, Python, Ruby, Go, and Docker on familiar
> servers such as Apache, Nginx, Passenger, and IIS.  
>
> Leverages the automation capabilities of CloudFormation to build out
> application architectures.

</details>

<details>

<summary>Quick Starts</summary>

> Quick Starts are built by AWS solutions architects and partners to help you
> deploy popular technologies on AWS, based on AWS best practices for security
> and high availability.

</details>

<details>

<summary>Lambda</summary>

> Serverless functions.

</details>

### Customer Engagement

<details>

<summary>Connect</summary>

> A self-service, cloud-based contact center service.

</details>

<details>

<summary>Simple Email Service (SES)</summary>

> An email sending service designed to with marketing, transactional, or
> notification emails.

</details>

### Database

<details>

<summary>Aurora</summary>

> A fast, scalable MySQL and PostgreSQL compatible relational database engine
> that features a distributed, fault-tolerant, self-healing storage system.

</details>

<details>

<summary>Relational Database Service (RDS)</summary>

> A service for setting up, operating, and scaling relational database
> services in the cloud.
>
> By default, RDS created and saves automated backups of DB instances securely
> in S3 for a specified retention period.
>
> With Point-in-time restores, a DB instance can be restored to any specific
> time during the backup retention period, creating a new DB instance.

</details>

<details>

<summary>DynamoDB</summary>

> A NoSQL database that supports key-value and document data models.
>
> DynamoDB Features:
>
> - Provides consistent, single-digit millisecond latency at any scale
> - Automatically scales tables to adjust for capacity and maintain performance

</details>

<details>

<summary>Elasticache</summary>

> A service for deploying, operating, and scaling an in-memory cache.
>
> Supports two in-memory caching engines:
>
> - Redis
> - Memcached

</details>

<details>

<summary>Neptune</summary>

> A fully managed graph database service.

</details>

### Desktop and App Streaming

<details>

<summary>Workspaces</summary>

> A fully managed, secure cloud desktop service.

</details>

<details>

<summary>AppStream 2.0</summary>

> A fully managed application streaming service.

</details>

### Developer Tools

<details>

<summary>CodeCommit</summary>

> A fully managed source control service that hosts secure git-based
> repositories.

</details>

<details>

<summary>CodeBuild</summary>

> A a fully managed build service that compiles source code,
> runs tests, and produces software packages that are ready to deploy

</details>

<details>

<summary>CodeDeploy</summary>

> A service that automates code deployments to any instance, including EC2
> instances and instances on premises.

</details>

<details>

<summary>CodePipeline</summary>

> A fully managed continuous delivery service for automating the build, test
> and deploy phases of a release every time there is a code change.

</details>

<details>

<summary>CodeStar</summary>

> A unified interface to manage software development activities in one place.

</details>

<details>

<summary>Cloud9</summary>

> A cloud-based integrated development environment (IDE).

</details>

<details>

<summary>X-Ray</summary>

> A service to help  analyze and debug distributed applications in
> production or under development.

</details>

### Machine Learning

<details>

<summary>SageMaker</summary>

> A fully managed platform to build, train, and deploy machine learning models.

</details>

<details>

<summary>Comprehend</summary>

> A natural language processing (NLP) service that uses machine learning to
> find insights and relationships in text.

</details>

<details>

<summary>Lex</summary>

> A service for building conversational interfaces into applications using
> voice and text.

</details>

<details>

<summary>Polly</summary>

> A service that turns text into speech.

</details>

<details>

<summary>Rekognition</summary>

> A service for adding image recognition to applications.

</details>

### Management and Governance

<details>

<summary>CloudWatch</summary>

> A service that collects monitoring and operational data in the form of logs
> metrics, and events to provide a unified view of resources.
>
> Can be used to set alarms, visual logs and metrics, troubleshoot issues, or
> take automated actions.

</details>

<details>

<summary>Auto Scaling</summary>

> Monitors applications and automatically adjusts capacity to maintain steady,
> predictable performance at the lowest possible cost.

</details>

<details>

<summary>Control Tower</summary>

> Automates the set-up of a baseline environment, or landing zone, that is a
> secure, well-architected multi-account AWS environment.

</details>

<details>

<summary>Systems Manager</summary>

> Provides a unified interface for grouping resources, monitoring and
> troubleshooting resource groups, as well as taking action on resource groups.

</details>

<details>

<summary>CloudFormation</summary>

> Provides a means for programmatically provisioning resources by defining
> configuration in JSON or YAML files.

</details>

<details>

<summary>CloudTrail</summary>

> A service for recording and auditing AWS API calls from an account.
>
> CloudTrail configuration:
>
> - All Regions
>   - Default option when creating a trail in the CloudTrail console.
>   - Records events in all regions and delivers logs to an S3 bucket.
> - Single Region
>   - Default option when creating a trail in the CLI or API.
>   - Only records events in the specified region.

</details>

<details>

<summary>Config</summary>

> A service for assessing, auditing, and evaluating the configurations of
> AWS resources.
>
> Provides a resource inventory, configuration history, and configuration
> change notifications.

</details>

<details>

<summary>OpsWorks</summary>

> A configuration management service using Chef and Puppet.

</details>

<details>

<summary>Service Catalog</summary>

> Allows organization to create and manage catalogs of services that are
> approved for use on AWS.

</details>

<details>

<summary>Trusted Advisor</summary>

> An online resource to help reduce cost, increase performance, and
> improve security by optimizing the AWS environment.
>
> ![Trusted Advisor Overview](images/Trusted_Advisor.png)

</details>

<details>

<summary>Personal Health Dashboard</summary>

> Provides alerts and remediation guidance when AWS is experiencing events
> that might impact availability or performance.

</details>

<details>

<summary>Managed Services</summary>

> Operates AWS on behalf of the customer, providing a secure and compliant AWS
> Landing Zone, a proven enterprise operating model, on-going cost
> optimization, and day-to-day infrastructure management.

</details>

<details>

<summary>Well-Architected Tool</summary>

> A free tools that helps review the current state of workloads and compares
> them to the latest architectural best practices.

</details>

### Migration and Transfer

<details>

<summary>Migration Hub</summary>

> Provides a single location to track the progress of application migrations.

</details>

<details>

<summary>Application Discovery Service</summary>

> Helps enterprise customers plan migration projects by gathering information
> about their on-premises data centers.

</details>

<details>

<summary>Database Migration Service (DMS)</summary>

> A service that helps migrate on-premises databases to AWs.

</details>

<details>

<summary>Server Migration Service (SMS)</summary>

> A service that helps migrate on-premises workloads to AWS.

</details>

<details>

<summary>Snowball</summary>

> A petabyte-scale data transport solution that uses secure appliances to
> transfer large amounts of data into and out of AWS.

</details>

<details>

<summary>Snowball Edge</summary>

> A data migration and edge computing device.

</details>

<details>

<summary>Snowmobile</summary>

> An exabyte-scale data transfer service used to move extremely large amounts
> of data to AWS

</details>

<details>

<summary>DataSync</summary>

> A data transfer service used to automate moving data between on-premises
> storage and S3 or Elastic File System (EFS),

</details>

### Mobile

<details>

<summary>Cognito</summary>

> A service to add user sign-up, sign-in, and access control to web and mobile
> applications.

</details>

<details>

<summary>PinPoint</summary>

> A service to send targeted messages to customers through multiple engagement
> channels, such as email, sms, and push notifications.

</details>

### Networking and Content Delivery

<details>

<summary>Virtual Private Cloud (VPC)</summary>

> A virtual network that serves as an isolated section of the AWS Cloud for
> launching resources.
>
> A VPC spans all of the Availability Zones in a region.
>
> Option for connecting to a VPC:
>
> - AWS Managed VPN
> - Direct Connect
> - VPN CloudHub
> - Software VPN
>
> Components of a VPC:
>
> <details>
>
> <summary>Subnet</summary>
>
> After creating a VPC, one or more subnets can be added in each Availability
> Zone.  Subnets are not able to span Availability Zones.
>
> Types of Subnets:
>
> - Public Subnet
>   - Traffic is routed to an Internet Gateway
> - Private Subnet
>   - Doesn't have a route to the Internet Gateway
> - VPN-only Subnet
>   - Traffic is routed to a virtual private gateway
>
> Subnet Security:
>
> - Security Groups
>   - Control inbound and outbound traffic for instances
> - Network Access Control Lists
>   - Control inbound and outbound traffic for subnets
>
> </details>
> <details>
>
> <summary>Internet Gateway</summary>
>
> A service that allows communication between between instances in a VPC and
> the internet.
>
> The Amazon VPC side of a connection to the public Internet.
> </details>
>
> <details>
>
> <summary>Virtual Private Gateway</summary>
>
> The Amazon VPC side of a VPN connection.
>
> </details>
>
> <details>
>
> <summary>Customer Gateway</summary>
>
> The customer side of a VPN connection.
>
> </details>
>
> <details>
>
> <summary>Peering Connection</summary>
>
> Enables traffic to be routed via private IP addresses between two peered
> VPCs.
>
> </details>
>
> <details>
>
> <summary>Network Address Translation (NAT)</summary>
>
> Enables instances in a private subnet to connect to the internet or other
> AWS services, but prevents the instances from being connected to over the
> internet.
>
> NAT Types:
>
> - Instance
>   - Managed by the customer
>   - Associated with a security group
> - Gateway
>   - Managed for the customer by AWS
>   - Not associated with any security groups
>   - Highly available
>
> ![NAT Instance vs NAT Gateway](images/NAT-Instance-vs-NAT-Gateway.jpg)
> </details>

</details>

<details>

<summary>CloudFront</summary>

> A content delivery network (CDN) for delivering data globally with low
> latency.

</details>

<details>

<summary>Route 53</summary>

> A domain name system (DNS). Can be used to connect user requests to
> infrastructure running inside of AWS, as well as infrastructure outside AWS.
>
> Features:
>
> - Resolver
> - Traffic flow
>   - Route to the best endpoint based on geo-proximity, latency, or health
> - Latency based routing
> - Geo DNS
>   - Route to a particular endpoint based on geographic location
> - Private DNS for Amazon VPC
> - DNS Failover
> - Health Checks and Monitoring
> - Domain Registration
> - ELB Integration
> - Weighted Round Robin

</details>

<details>

<summary>PrivateLink</summary>

> Provides private connectivity between VPCs, AWS services, and on-premises
> applications, securely on the Amazon network.

</details>

<details>

<summary>Direct Connect</summary>

> Establishes a private, dedicated network connection from on-premises to AWS.

</details>

<details>

<summary>Global Accelerator</summary>

> A networking service that improves the availability and performance of the
> applications offered to global users.

</details>

<details>

<summary>API Gateway</summary>

> A service for creating, publishing, maintaining, monitoring, and securing
> APIs.

</details>

<details>

<summary>Transit Gateway</summary>

> A service that enables customers to connect their Virtual Private Clouds
> (VPCs) and their on-premises networks to a single gateway.

</details>

<details>

<summary>Elastic Load Balancing</summary>

> Distributes incoming application traffic across multiple targets, such as EC2
> instances, containers, and IP addresses.
>
> There are three types of load balancers:
>
> - Application Load Balancer
>   - Best suited for load balancing of HTTP and HTTPS traffic
>   - Key Features:
>     - Layer 7 Load Balancing
>     - IP addressed as Targets
>     - Lambda functions as Targets
>     - Content-based Routing
>     - WebSockets Support
> - Network Load Balancer
>   - Best suited for load balancing of TCP traffic where extreme performance
>     is required
>   - Key Features:
>     - Connection-based Load Balancing
>     - High Availability and Throughput
>     - Low Latency
>     - Static and Elastic IP support
> - Classic Load Balancer
>   - Intended for applications that were built within the EC2-Classic network

<details>

<summary>ELB Features</summary>

![ELB Feature Set Image 1](images/ELB_Feature_1.png)

![ELB Feature Set Image 2](images/ELB_Feature_2.png)

![ELB Feature Set Image 3](images/ELB_Feature_3.png)

</details>

</details>

### Security, Identity, and Compliance

<details>

<summary>Security Hub</summary>

> Provides a comprehensive view of high-priority security alerts and compliance
> status for multiple security services across AWS accounts.

</details>

<details>

<summary>Identity and Access Management (IAM)</summary>

> A service for managing users, groups, and permissions to securely control
> access to AWS services and resources.
>
> IAM allows for the following:
>
> - Manage IAM Users and Access
>   - Create users, assign security credentials, or request temporary
>     credentials.
>   - Manage permissions to control which operations a user can perform.
> - Manage IAM Roles and Permissions
>   - Create roles and manage permissions about which operations can be
>     performed to the entity, or service, assuming the role.
>   - Define which entities or services are allowed to assume the role.
> - Manage Federated Users and Permissions
>   - Enable identity federation to allow existing identities (users,
       groups, and roles) in the enterprise access without the need to
       create an IAM user for each identity.

</details>

<details>

<summary>IAM Policy Simulator</summary>

> Used to test and troubleshoot identity-based policies, IAM permissions
> boundaries, Organizations service control policies, and resource-based
> policies

</details>

<details>

<summary>GuardDuty</summary>

> A threat detection service that continuously monitors for malicious or
> unauthorized behavior.

</details>

<details>

<summary>Inspector</summary>

> An automated security assessment service for EC2 instances.

</details>

<details>

<summary>Macie</summary>

> A security service to automatically discover, classify, and protect
> sensitive data in AWS.

</details>

<details>

<summary>Certificate Manager</summary>

> A service for provisioning, managing, and deploying SSL certificates.

</details>

<details>

<summary>Key Management Service</summary>

> A service to create and manage keys, and control the use of encryption
> across a wide range of services and applications.

</details>

<details>

<summary>CloudHSM</summary>

> A cloud-based hardware security module (HSM) that enables you to generate
> and use your own encryption keys on the AWS Cloud.

</details>

<details>

<summary>Organizations</summary>

> Enables managing multiple AWS accounts from a single locations.  Allows
> billing for multiple accounts to be rolled up into a single bill, applying
> any volume discounts as part of the consolidated billing.

</details>

<details>

<summary>Shield</summary>

> A managed Distributed Denial of Service (DDoS) protection service.

</details>

<details>

<summary>Web Application Firewall (WAF)</summary>

> A firewall that helps protect web applications from common exploits.

</details>

### Storage

<details>

<summary>Simple Storage Service (S3)</summary>

> An object storage service.
>
> S3 is available in the following storage classes:
>
> - Standard
>   - Offers high durability, availability, and performance object storage
>     for frequently accessed data
> - Intelligent-Tiering
>   - Designed to optimize costs by automatically moving data to the most
>     cost-effective access tier
> - Standard Infrequent Access (Standard-IA)
>   - For data that is accessed less frequently, but requires rapid access
>     when needed.
> - One Zone Infrequent Access (One Zone-IA)
>   - For data that is accessed less frequently, but requires rapid access
>     when needed.
>   - Stores data in a single AZ and costs 20% less than S3 Standard-IA.
>   - Ideal for customers who want a lower-cost option for infrequently
>     accessed data but do not require the availability and resilience of S3
>     Standard or S3 Standard-IA.
> - Glacier
>   - A secure, durable, and low-cost storage class for data archiving.
>   - Provides three retrieval options that range from a few minutes to hours.
> - Glacier Deep Archive
>   - Lowest-cost storage class and supports long-term retention and digital
>     preservation for data that may be accessed once or twice in a year
>   - Data stored in Deep Archive can be restored within 12 hours.
>
> ![S3 Performance](images/S3_Performance.png)
>
> Replication enables automatic, asynchronous copying of objects across Amazon
> S3 buckets.
>
> Types of object replication:
>
> - Cross-Region Replication (CRR)
>   - Used to copy objects across Amazon S3 buckets in different AWS Regions
> - Same-Region Replication (SRR)
>   - Used to copy objects across Amazon S3 buckets in the same AWS Region
>
> Reasons to use replication:
>
> - Replicate objects while retaining metadata
> - Replicate objects into different storage classes
> - Maintain object copies under different ownership
> - Replicate objects within 15 minutes

</details>

<details>

<summary>Elastic Block Store (EBS)</summary>

> Persistent block storage volumes for EC2 instance.  Both root and non-root
> EBS volumes of an EC2 instance can be encrypted.
>
> EBS Volume Types:
>
> - Solid-state drives (SSD)
>   - General Purpose SSD (gp2)
>     - General purpose volume balancing price and performance
>     - Recommended for most workloads
>   - Provisioned IOPS SSD (io1)
>     - High-performance volume for low-latency or high-throughput workloads
>     - For critical business applications requiring sustained IOPS performance
> - Hard disk drives (HDD)
>   - Throughput Optimized HDD (st1)
>     - Low-cost volume for frequently accessed, throughput-intensive workloads
>     - Streaming workloads requiring consistent, fast throughput at a low price
>   - Cold HDD (sc1)
>     - Lowest cost volume for less frequently accessed workloads
>     - Throughput-oriented storage for large volumes of infrequently accessed data

</details>

<details>

<summary>Instance Store</summary>

> Provides a temporary block-level storage for an EC2 instance.  The data in
> an instance store lives only as long as the associated instance.

</details>

<details>

<summary>Elastic File System (EFS)</summary>

> A simple, scalable, elastic file system for Linux-based workloads.  Built
> to scale on demand to petabytes without disrupting applications, growing
> and shrinking automatically as files are added and removed.

</details>

<details>

<summary>Storage Gateway</summary>

> Hybrid storage service that enables on-premises applications to seamlessly
> use AWS cloud storage.
>
> Gateway Types:
>
> - Tape Gateway
> - Volume Gateway
> - File Gateway

</details>
