# AWS Well-Architected Framework

By using the Framework you will learn architectural best practices for
designing and operating reliable,secure, efficient, and cost-effective
systems in the cloud.

## Definitions

The AWS Well-Architected Framework is based on five pillars:

- **Operational Excellence**
  - The ability to run and monitor systems to deliver business value and to
  continually improve supporting processes and procedures.
- **Security**
  - The ability to protect information, systems, and assets while delivering
  business value through risk assessments and mitigation strategies.
- **Reliability**
  - The ability of a system to recover from infrastructure or service
  disruptions, dynamically acquire computing resources to meet demand, and
  mitigate disruptions such as misconfigurations or transient network issues.
- **Performance Efficiency**
  - The ability to use computing resources efficiently to meet system
  requirements, and to maintain that efficiency as demand changes and
  technologies evolve.
- **Cost Optimization**
  - The ability to run systems to deliver business value at the lowest price point.

## General Design Principles

The Well-Architected Framework identifies a set of general design principles
to facilitate good design in the cloud:

- **Stop guessing your capacity needs**
  - You can use as much or as little capacity as you need, and scale up and
  down automatically.
- **Test systems at production scale**
  - You can create a production-scale test environment on demand, complete
  your testing, and then decommission the resources.
- **Automate to make architectural experimentation easier**
  - Automation allows you to create and replicate your systems at low cost and
  avoid the expense of manual effort.
- **Allow for evolutionary architectures**
  - The capability to automate and test on demand lowers the risk of impact
  from design changes..
- **Drive architecture using data**
  - You can collect data on how your architectural choices affect behavior
   allowing you to make fact-based decisions.
- **Improve through game days**
  - Test how your architecture and processes perform by regularly scheduling
  game days to simulate events in production.

## The Five Pillars

When architecting technology solutions, if you neglect the five pillars of
operational excellence, security, reliability, performance efficiency, and
cost optimization it can become challenging to build a system that delivers on
your expectations and requirements.

### Operational Excellence

Includes the ability to run and monitor systems to deliver business value and
to continually improve supporting processes and procedures.

#### Design Principles

There are six design principles for operational excellence in the cloud:

- Perform operations as code
- Annotate documentation
- Make frequent, small, reversible changes
- Refine operations procedure frequently
- Anticipate failure
- Learn from all operational failures

#### Best Practices

There are three best practice areas and tools for operational excellence in the cloud:

- Prepare
  - AWS Config
    - Create workload standards and determine standards compliance.
- Operate
  - Amazon CloudWatch
    - Monitor operational health of workloads.
- Evolve
  - Amazon Elasticsearch Service
    - Analyze log data to gain actionable insights quickly and securely.

#### Key AWS Services

- AWS CloudFormation
  - Create templates based on best practices to provision resources in an
  orderly and consistent fashion.

### Security

Includes the ability to protect information, systems, and assets while
delivering business value through risk assessments and mitigation strategies.

#### Design Principles

There are seven design principles for security in the cloud:

- Implement a strong identity foundation
- Enable traceability
- Apply security at all layers
- Automate security best practices
- Protect data in transit and at rest
- Keep people away from data
- Prepare for security events

#### Best Practices

There are five best practice areas and tools for security in the cloud:

- Identity and Access Management
  - IAM
    - Securely control access to services and resources
  - MFA
    - Adds additional layer of protection
  - AWS Organizations
    - Centrally manage and enforce policies
- Detective Controls
  - AWS CloudTrail
    - Records AWS API calls and delivers log files for auditing
  - AWS Config
    - Provides detailed inventory of resources and configuration
  - Amazon GuardDuty
    - Continuously monitors for malicious or unauthorized behavior
  - Amazon CloudWatch
    - Can monitor resources and trigger events to automate security responses
- Infrastructure Protection
  - Amazon VPC
    - Launch resources into a private, isolated virtual network that you define
  - Amazon CloudFront
    - Global CDN that securely delivers data and integrates DDoS mitigation
  - AWS WAF
    - Helps protect web applications from common web exploits
- Data Protection
  - ELB, EBS, S3, RDS
    - Include encryption capabilities to protect data in transit and at rest
  - Amazon Macie
    - Automatically discovers, classifies, and protects sensitive data
  - AWS KMS
    - Makes it easy to create and control keys used for encryption
- Incident Response
  - IAM
    - Grant appropriate authorization to incident response teams and tools
  - AWS CloudFormation
    - Created a trusted environment or clean room for conducting investigations
  - Amazon CloudWatch Events
    - Create rules that trigger automated responses

#### Key AWS Services

- AWS Identity and AccessManagement (IAM)
  - Allows you to securely control access to AWS services and resources for
  your users.

### Reliability

Includes the ability of a system to recover from infrastructure or service
disruptions, dynamically acquire computing resources to meet demand, and
mitigate disruptions such as misconfigurations or transient network issues.

#### Design Principles

There are five design principles for reliability in the cloud:

- Test recovery procedures
- Automatically recover from failure
- Scale horizontally to increase aggregate system availability
- Stop guessing capacity
- Manage change in automation

#### Best Practices

There are three best practice areas and tools for reliability in the cloud:

- Foundations
  - IAM
    - Securely control access to services and resources
  - Amazon VPC
    - Launch resources into a private, isolated virtual network that you define
  - AWS Trusted Advisor
    - Provides visibility into service limits
  - AWS Shield
    - A managed DDoS protection service that safeguards web applications
- Change Management
  - AWS Cloud Trail
    - Records AWS API calls and delivers log files for auditing
  - AWS Config
    - Provides detailed inventory of resources and configuration
  - Amazon Auto Scaling
    - Provides automated demand management for deployed workload
  - Amazon CloudWatch
    - Provides the ability to alert on metrics, including custom metrics
    - Can be used to aggregate log files from resources
- Failure Management
  - AWS CloudFormation
    - Provides a template for resources and provisions them predictably
  - Amazon S3
    - Provides a highly durable service in which to keep backup
  - Amazon Glacier
    - Provides highly durable archives
  - AWS KMS
    - Provides a reliable key management systems

#### Key AWS Services

- Amazon CloudWatch
  - Monitors runtime metrics

### Performance Efficiency

Includes the ability to use computing resources efficiently to meet system
requirements, and to maintain that efficiency as demand changes and
technologies evolve.

#### Design Principles

There are five design principles for performance efficiency in the cloud:

- Democratize advanced technologies
- Go global in minutes
- Use serverless architectures
- Experiment more often
- Mechanical sympathy

#### Best Practices

There are four best practice areas and tools for performance efficiency in the cloud:

- Selection
  - Compute
    - Auto Scaling is key to meeting demand and maintaining responsiveness
  - Storage
    - EBS provides a wide range of storage options to optimize based on use
    - S3 provides serverless content delivery
    - S3 transfer acceleration enables the transfer of files over long distance
  - Database
    - RDS provides a wide range of database feature to optimize based on use
    - DynamoDB provides single-digit millisecond latency at any scale
  - Network
    - Route 53 provides latency based routing
    - VPC endpoint and Direct Connect can reduce network distance or jitter
- Review
  - AWS Blog and What's New
    - Resources for learning about newly launched features or services
- Monitoring
  - AWS CloudWatch
    - Provides metrics, alarms, and notifications
- Tradeoffs
  - Amazon ElastiCache, Amazon CloudFront, and AWS Snowball
    - Allow you to improve performance
  - Amazon RDS
    - Read replicas allow you to scale read-heavy workloads

#### Key AWS Services

- Amazon CloudWatch
  - Monitors your resources and systems, providing visibility into your
  overall performance and operational health.

### Cost Optimization

Includes the ability to run systems to deliver business value at the lowest
price point.

#### Design Principles

There are five design principles for cost optimization in the cloud:

- Adopt a consumption model
- Measure overall efficiency
- Stop spending money on data center operations
- Analyze and attribute expenditure
- Use managed and application level services to reduce cost of ownership

#### Best Practices

There are four best practice areas and tools for cost optimization in the cloud:

- Expenditure Awareness
  - AWS Cost Explorer
    - View and track usage in detail
  - AWS Budget
    - Send notification if usage or spend exceeds actual or forecast amounts
- Cost-Effective Resources
  - Cost Explorer
    - View Reserved Instance usage and see patterns in spend over time
  - Amazon CloudWatch and Trusted Advisor
    - Help rightsize resources
  - Amazon Aurora
    - Remove database licensing costs
  - AWS Direct Connect and Amazon CloudFront
    - Optimize data transfer
- Matching supply and demand
  - Auto Scaling
    - Add or remove resources to match demand without overspending
- Optimizing Over Time
  - AWS New Blog and What's New
    - Learn about newly launched features or services
  - AWS Trusted Advisor
    - Finds opportunities to save money by eliminating unused or idle resources

#### Key AWS Services

- Cost Explorer
  - Helps you gain visibility and insights into your usage, across your
  workloads and throughout your organization.