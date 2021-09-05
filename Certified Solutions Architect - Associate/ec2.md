# Elastic Cloud Compute (EC2)

Amazon Elastic Compute Cloud (Amazon EC2) provides scalable computing capacity in the Amazon Web Services (AWS) Cloud. Using Amazon EC2 eliminates your need to invest in hardware up front, so you can develop and deploy applications faster. You can use Amazon EC2 to launch as many or as few virtual servers as you need, configure security and networking, and manage storage. Amazon EC2 enables you to scale up or down to handle changes in requirements or spikes in popularity, reducing your need to forecast traffic. 

## Features

Amazon EC2 provides the following features:

- Virtual computing environments, known as _instances_
- Preconfigured templates for your instances, known as _Amazon Machine Images (AMIs)_ 
- Various configurations of CPU, memory, storage, and networking capacity, known as _instance types_
- Secure login information for your instances using _key pairs_
- Storage volumes for temporary data, known as _instance store volumes_
- Persistent storage volumes, known as _Amazon EBS volumes_
- Multiple physical locations for your resources, known as _Regions_ and _Availability Zones_
- A firewall for your instances using _security groups_
- Static IPv4 addresses for dynamic cloud computing, known as _Elastic IP addresses_
- Metadata, known as _tags_, that you can create and assign to your Amazon EC2 resources
- Virtual networks you can create known as _virtual private clouds (VPCs)_

[What is Amazon EC2?](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/concepts.html)

## Pricing

Amazon EC2 provides the following purchasing options to enable you to optimize your costs based on your needs: 

<details>
  <summary>On-Demand Instances</summary> 
  
  ---
  > Pay, by the second or hour, for the instances that you launch with no long term commitments. 
  >
  > You pay only for the seconds that your On-Demand Instances are in the running state.
  ---

  [On-Demand Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-on-demand-instances.html)
</details>

<details>
  <summary>Reserved Instances</summary>

  --- 
  > Reduce costs by making a commitment to a consistent instance configuration for a term of 1 or 3 years. 
  ---
  Types of Reserved Instances:

  > _Standard_
  >
  > Provides a more signifiant discount the more you pay up front and the longer the contract, but instances cannot be exchanged.

  > _Convertible_
  >
  > Provides less of a discount than _Standard_, but instances can exchanged (converted from one configuration to another).
    
  > _Scheduled_
  > 
  > Reserves capacity that is scheduled to recur daily, weekly, or monthly, with a specified start time and duration, for a one-year term
  ---
  Payment Types:

  > _All Upfront_
  >
  > Full payment is made at the start of the term, with no other costs or additional hourly charges.
  >
  > _Partial Upfront_
  >
  > A portion of the cost is paid upfront with the remaining hours billed at a discounted hourly rate regardless of instance usage.
  >
  > _No Upfront_
  >
  > The cost is billed at a discounted hourly rate for every hour in the term, regardless of instance usage.

  [Reserved Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ec2-reserved-instances.html)
</details>

<details>
  <summary>Spot Instances</summary>

  ---
  > Uses spare EC2 capacity that is available for less than the On-Demand price.
  >
  > Spot Instances are a cost-effective choice if you can be flexible about when your applications run and if your applications can be interrupted.
  ---

  [Spot Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)
</details>

<details>
  <summary>Dedicated Hosts</summary>
  
  ---
  > An Amazon EC2 Dedicated Host is a physical server with EC2 instance capacity fully dedicated to your use. Dedicated Hosts allow you to use your existing per-socket, per-core, or per-VM software licenses
  ---

  [Dedicated Hosts](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/dedicated-hosts-overview.html)
</details>

### Security Groups

A security group acts as a virtual firewall for your instance to control inbound and outbound traffic. When you launch an instance in a VPC, you can assign up to five security groups to the instance. Security groups act at the instance level, not the subnet level. Therefore, each instance in a subnet in your VPC can be assigned to a different set of security groups. 

[Security Group Basics](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_SecurityGroups.html)

The following are the characteristics of security groups:

- You can specify allow rules, but not deny rules
- You can specify separate rules for inbound and outbound traffic
- Security group rules enable you to filter traffic based on protocols and port numbers
- Security groups are stateful — if you send a request from your instance, the response traffic for that request is allowed to flow in regardless of inbound security group rules. Responses to allowed inbound traffic are allowed to flow out, regardless of outbound rules
- When you first create a security group, it has no inbound rules. Therefore, no inbound traffic originating from another host to your instance is allowed until you add inbound rules to the security group
- By default, a security group includes an outbound rule that allows all outbound traffic. You can remove the rule and add outbound rules that allow specific outbound traffic only. If your security group has no outbound rules, no outbound traffic originating from your instance is allowed
- Instances associated with a security group can't talk to each other unless you add rules allowing the traffic (exception: the default security group has these rules by default)
- A security group can only be used in the VPC that you specify when you create the security group

### Elastic Block Store (EBS)

Amazon Elastic Block Store (Amazon EBS) provides block level storage volumes for use with EC2 instances. EBS volumes behave like raw, unformatted block devices. You can mount these volumes as devices on your instances. EBS volumes that are attached to an instance are exposed as storage volumes that persist independently from the life of the instance. You can create a file system on top of these volumes, or use them in any way you would use a block device (such as a hard drive). You can dynamically change the configuration of a volume attached to an instance. 

#### Volume Types

<details>
  <summary>Solid state Drives (SSD)</summary>

  ---
  > Optimized for transactional workloads involving frequent read/write operations with small I/O size, where the dominant performance attribute is IOPS.
  ---
  SSD Types:

  > _General Purpose SSD_
  >
  > Provides a balance of price and performance.  Recommended for most workloads.
  >
  > _Provisioned IOPS SSD_
  >
  > Provides high performance for mission-critical, low-latency, or high-throughput workloads. 

</details>

<details>
  <summary>Hard disk drives (HDD)</summary>

  ---
  > Optimized for large streaming workloads where the dominant performance attribute is throughput.
  ---
  HDD Types:

  > _Throughput Optimized HDD_
  >
  >  A low-cost HDD designed for frequently accessed, throughput-intensive workloads.
  >
  > _Cold HDD_
  >
  >The lowest-cost HDD design for less frequently accessed workloads. 
</details>

<details>
  <summary>Previous generation</summary>

  ---
   > Hard disk drives that can be used for workloads with small datasets where data is accessed infrequently and performance is not of primary importance.
  ---
</details>

#### Comparison

<table>
  <thead>
    <tr>
      <th></th>
      <th colspan="2" style="text-align: center;" align="center">General Purpose SSD</th>
      <th colspan="2" style="text-align: center;" align="center">Provisioned IOPS SSD</th>
      <th style="text-align: center;" align="center">Throughput Optimized HDD</th>
      <th style="text-align: center;" align="center">Cold HDD</th>
      <th style="text-align: center;" align="center">Magnetic</th>
    </tr>   
  </thead>
    <tbody>
      <tr>
        <td><b>Volume type</b></td>
        <td><code class="code">gp3</code></td>
        <td><code class="code">gp2</code></td>
        <td><code class="code">io2</code></td>
        <td><code class="code">io1</code></td>
        <td><code class="code">st1</code></td>
        <td><code class="code">sc1</code></td>
        <td><code class="code">standard</code></td>
      </tr>
      <tr>
        <td><b>Use cases</b></td>
        <td colspan="2">
          <div>
              <ul type="disc">
                <li>Applications</li>
                <li>Development</li>
              </ul>
          </div>
        </td>
        <td colspan="2">
          <div>
              <ul type="disc">
                <li>High IOPS</li>
                <li>Databases</li>
              </ul>
          </div>
        </td>
        <td>
          <div>
            <ul type="disc">
              <li>Big data</li>
              <li>Data warehouses </li>
              <li>Log processing</li>
            </ul>
          </div>
        </td>
        <td>
          <div>
              <ultype="disc">
                <li>Infrequent Access</li>
                <li>Lowest Storage Cost</li>
              </ul>
          </div>
        </td>
        <td>
          <div>
              <ultype="disc">
                <li>Infrequent Access</li>
              </ul>
          </div>
        </td>
      </tr>
      <tr> 
        <td><b>Volume size</b></td>
        <td colspan="2">1 GiB - 16 TiB </td>
        <td colspan="2">4 GiB - 16 TiB </td>
        <td>125 GiB - 16 TiB</td>
        <td>125 GiB - 16 TiB</td>
        <td>1 GiB-1 TiB</td>
      </tr>
      <tr>   
        <td><b>Max IOPS</b></td>
        <td colspan="2">16,000</td>
        <td colspan="2">64,000</td>
        <td>500</td>
        <td>250</td>
        <td>40 - 200</td>
      </tr>
      <tr>
        <td><b>Multi-attach</b></td>
        <td colspan="2">Not supported</td>
        <td colspan="2">Supported</td>
        <td>Not supported</td>
        <td>Not supported</td>
        <td>Not supported</td>
      </tr>
      <tr>
        <td><b>Boot volume</b></td>
        <td colspan="4">Supported</td>
        <td>Not supported</td>
        <td>Not supported</td>
        <td>Supported</td>
    </tr>
  </tbody>
</table>

[EBS Volume Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ebs-volume-types.html)

#### Snapshots

You can back up the data on your Amazon EBS volumes to Amazon S3 by taking point-in-time snapshots. Snapshots are incremental backups, which means that only the blocks on the device that have changed after your most recent snapshot are saved. This minimizes the time required to create the snapshot and saves on storage costs by not duplicating data. 

### AMI Types

You can select an AMI to use based on the following characteristics:

- _Region_
- Operating System
- Architecture
- Launch Permissions
- Storage for the _root_ device

#### Storeage for the Root Device

All AMIs are categorized as either backed by Amazon EBS or backed by instance store.

<details>
  <summary>Elastic Block Store (EBS)</summary>

  ---
  > Elastic Block Store (EBS) provides block level storage volumes for use with EC2 instances. EBS volumes behave like raw, unformatted block devices. You can mount these volumes as devices on your instances. EBS volumes that are attached to an instance are exposed as storage volumes that persist independently from the life of the instance
  ---
</details>

<details>
  <summary>Instance Store</summary>

  ---
  > An instance store provides temporary block-level storage for your instance. This storage is located on disks that are physically attached to the host computer. Instance store is ideal for temporary storage of information that changes frequently, such as buffers, caches, scratch data, and other temporary content, or for data that is replicated across a fleet of instances, such as a load-balanced pool of web servers.
  ---
</details>

[AMI Types](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/ComponentsAMIs.html)

### ENI vs ENA vs EFA

<details>
  <summary>Elastic Network Interface (ENI)</summary>

  ---
  > An elastic network interface is a logical networking component in a VPC that represents a virtual network card.
  
  > For basic networking.  Perhaps you need a seperate management network to your production network or a separate logging network and you need to this at low cost.  In this scenario use multiple ENIs for each network.  
  ---
</details>

<details>
  <summary>Elastic Network Adapter (ENA)</summary>

  ---
  > Amazon EC2 provides enhanced networking capabilities through the Elastic Network Adapter (ENA).

  > For when you need speeds between 10Gbps and 100Gbps.  Anywhere you need reliable, high throughput.
  ---
</details>

<details>
  <summary>Elastic Fabric Adapter (EFA)</summary>

  ---
  > An Elastic Fabric Adapter (EFA) is a network device that you can attach to your Amazon EC2 instance to accelerate High Performance Computing (HPC) and machine learning applications.

  > For when you need to accelerate _High Performance Computing_ (HPC) and machine learning applications or if you need to do an OS by-pass.  If you see a scenario question mentioning HPC or MI and asking what network adaptor you want, choose EFA.
  ---
</details>

[Elastic Network Interfaces](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-eni.html)

[Elastic Network Adapter](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/enhanced-networking-ena.html)

[Elastic Fabric Adapter](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/efa.html)

### Encryption

You can encrypt both the boot and data volumes of an EC2 instance.

When you create an encrypted EBS volume and attach it to a supported instance type, the following types of data are encrypted: 

- Data at rest inside the volume
- All data moving between the volume and the instance
- All snapshots created from the volume
- All volumes created from those snapshots

Encryption is supported by all EBS volume types. You can expect the same IOPS performance on encrypted volumes as on unencrypted volumes, with a minimal effect on latency. You can access encrypted volumes the same way that you access unencrypted volumes. Encryption and decryption are handled transparently, and they require no additional action from you or your applications.

[EBS Encryption](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/EBSEncryption.html)

### Spot Instances

A Spot Instance is an instance that uses spare EC2 capacity that is available for less than the On-Demand price. Because Spot Instances enable you to request unused EC2 instances at steep discounts, you can lower your Amazon EC2 costs significantly. The hourly price for a Spot Instance is called a Spot price. The Spot price of each instance type in each Availability Zone is set by Amazon EC2, and is adjusted gradually based on the long-term supply of and demand for Spot Instances. Your Spot Instance runs whenever capacity is available and the maximum price per hour for your request exceeds the Spot price. 

[Spot Instances](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/using-spot-instances.html)


### Spot Fleets

A Spot Fleet is set of Spot Instances and optionally On-Demand Instances that is launched based on criteria that you specify. The Spot Fleet selects the Spot capacity pools that meet your needs and launches Spot Instances to meet the target capacity for the fleet. By default, Spot Fleets are set to maintain target capacity by launching replacement instances after Spot Instances in the fleet are terminated. You can submit a Spot Fleet as a one-time request, which does not persist after the instances have been terminated. You can include On-Demand Instance requests in a Spot Fleet request. 

[Spot Fleet](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/spot-fleet.html)

### EC2 Hibernation

When you hibernate an instance, Amazon EC2 signals the operating system to perform hibernation (suspend-to-disk). Hibernation saves the contents from the instance memory (RAM) to your Amazon Elastic Block Store (Amazon EBS) root volume. Amazon EC2 persists the instance's EBS root volume and any attached EBS data volumes.

When you start your instance: 

- The EBS root volume is restored to its previous state
- The RAM contents are reloaded
- The processes that were previously running on the instance are resumed
- Previously attached data volumes are reattached and the instance retains its instance ID 

[EC2 Hibernation](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/Hibernate.html)

### CloudWatch

Amazon CloudWatch monitors your Amazon Web Services (AWS) resources and the applications you run on AWS in real time. You can use CloudWatch to collect and track metrics, which are variables you can measure for your resources and applications.

You can create custom dashboards to display metrics about your custom applications, and display custom collections of metrics that you choose. 

You can create alarms that watch metrics and send notifications or automatically make changes to the resources you are monitoring when a threshold is breached

With CloudWatch, you gain system-wide visibility into resource utilization, application performance, and operational health. 

[CloudWatch](https://docs.aws.amazon.com/AmazonCloudWatch/latest/monitoring/WhatIsCloudWatch.html)

### Command Line Interface (CLI)

The AWS Command Line Interface (CLI) is a unified tool to manage your AWS services. 

[AWS CLI](https://docs.aws.amazon.com/cli/index.html)

### Identity and Access Management (IAM)

AWS Identity and Access Management (IAM) is a web service that helps you securely control access to AWS resources. You use IAM to control who is authenticated (signed in) and authorized (has permissions) to use resources. 

[What is IAM?](https://docs.aws.amazon.com/IAM/latest/UserGuide/introduction.html)

### User-Data

When you launch an instance in Amazon EC2, you have the option of passing user data to the instance that can be used to perform common automated configuration tasks and even run scripts after the instance starts.

[User-Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/user-data.html)

### Meta-Data

Because your instance metadata is available from your running instance, you do not need to use the Amazon EC2 console or the AWS CLI. This can be helpful when you're writing scripts to run from your instance. For example, you can access the local IP address of your instance from instance metadata to manage a connection to an external application. 

[Meta-Data](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/instancedata-data-retrieval.html)

### Elastic File System (EFS)

Amazon Elastic File System (Amazon EFS) provides a simple, serverless, set-and-forget elastic file system for use with AWS Cloud services and on-premises resources. It is built to scale on demand to petabytes without disrupting applications, growing and shrinking automatically as you add and remove files, eliminating the need to provision and manage capacity to accommodate growth

[What is EFS?](https://docs.aws.amazon.com/efs/latest/ug/whatisefs.html)

### Amazon FSx for Windows

Amazon FSx for Windows File Server provides fully managed Microsoft Windows file servers, backed by a fully native Windows file system. Amazon FSx for Windows File Server has the features, performance, and compatibility to easily lift and shift enterprise applications to the AWS Cloud.

[FSx for Windows](https://docs.aws.amazon.com/fsx/latest/WindowsGuide/what-is.html)

### Amazon FSx for Lustre

Amazon FSx for Lustre makes it easy and cost-effective to launch and run the popular, high-performance Lustre file system. You use Lustre for workloads where speed matters, such as machine learning, high performance computing (HPC), video processing, and financial modeling. 

[FSx fpr Lustre](https://docs.aws.amazon.com/fsx/latest/LustreGuide/what-is.html)

### Placement Groups

You can use placement groups to influence the placement of a group of interdependent instances to meet the needs of your workload. Depending on the type of workload, you can create a placement group using one of the following placement strategies: 

<details>
  <summary>Cluster</summary>

  ---
  > Packs instances close together inside an Availability Zone. This strategy enables workloads to achieve the low-latency network performance necessary for tightly-coupled node-to-node communication that is typical of HPC applications
  ---
</details>

<details>
  <summary>Partition</summary>

  ---
  > Spreads your instances across logical partitions such that groups of instances in one partition do not share the underlying hardware with groups of instances in different partitions. This strategy is typically used by large distributed and replicated workloads, such as Hadoop, Cassandra, and Kafka. 
  ---
</details>

<details>
  <summary>Spread</summary>

  ---
  > Strictly places a small group of instances across distinct underlying hardware to reduce correlated failures.
  ---
</details>

[Placement Groups](https://docs.aws.amazon.com/AWSEC2/latest/UserGuide/placement-groups.html)

### Web Application Firewall

AWS WAF is a web application firewall that lets you monitor the HTTP and HTTPS requests that are forwarded to an Amazon CloudFront distribution, an Amazon API Gateway REST API, an Application Load Balancer, or an AWS AppSync GraphQL API. AWS WAF also lets you control access to your content, based on conditions that you specify.

At the simplest level, AWS WAF lets you choose one of the following behaviors:

<details>
  <summary>Allow all requests except the ones that you specify</summary>

  ---
  > This is useful when you want Amazon CloudFront, Amazon API Gateway, Application Load Balancer, or AWS AppSync to serve content for a public website, but you also want to block requests from attackers. 
  ---
</details>

<details>
  <summary>Block all requests except the ones that you specify</summary>

  ---
  > This is useful when you want to serve content for a restricted website whose users are readily identifiable by properties in web requests, such as the IP addresses that they use to browse to the website. 
  ---
</details>

<details>
  <summary>Count the requests that match the properties that you specify</summary>

  ---
  > When you want to allow or block requests based on new properties in web requests, you first can configure AWS WAF to count the requests that match those properties without allowing or blocking those requests. This lets you confirm that you didn't accidentally configure AWS WAF to block all the traffic to your website. When you're confident that you specified the correct properties, you can change the behavior to allow or block requests. 
  ---
</details>

 You can define conditions by using characteristics of web requests such as the following: 

- IP addresses that requests originate from.
- Country that requests originate from.
- Values in request headers.
- Strings that appear in requests, either specific strings or strings that match regular expression (regex) patterns.
- Length of requests.
- Presence of SQL code that is likely to be malicious (known as SQL injection).
- Presence of a script that is likely to be malicious (known as cross-site scripting).

[What is WAF?](https://docs.aws.amazon.com/waf/latest/developerguide/what-is-aws-waf.html)

## Exam Tips

- EC2
  - Know the different EC2 instance types
  - Termination protection is turned off by default
  - For EBS backed instances that are terminated:
    - The default action is for the _root_ EBS volume to be terminated
    - The default action is for _non-root_ EBS volumes to be retained
  - The EBS _root_ volumes of default AMIs *can* be encrypted

- Security Groups
  - All _inbound_ traffic is blocked by default
  - All _outbound_ traffic is allowed
  - Changes to security groups take effect _immediately_
  - You can have any number of EC2 instances within a security group
  - You can have multiple security groups attached to EC2 instances
  - Security Groups are **stateful**
    -Do not have to configure both _inbound_ **and** _outbound_ ports
    - If an _inbound_ rule allows traffic in, the traffic is automatically allowed back out.
  - You cannot block specific IP addresses using Security Groups
    - Instead use Network Access Control Lists
  - You can specify allow rules, but not deny rules
    - Everything is denied by default

- EBS
  - Volumes exist on EBS
    - Think of EBS as a virtual hard disk.
  - Snapshots exist on S3
    - Think of snapshots as a backup of the disk
  - Snapshots are point in time copies of Volumes
  - Snapshots are incremental
    - Only the blocks changed since the last snapshot are moved to S3
  - The first snapshot may take some time to create
  - To create a snapshot for _root_ volumes, you should stop the instance first
    - You _can_ take a snapshot while the instance is running
  - You can create AMIs from snapshots
  - You can change EBS volume sizes and storage type on the fly
  - Volumes will always be in the same _availability zone_ as the EC2 instance
  - To move an EC2 volume from one _availability zone_ to another:
    - Take a snapshot of it
    - Create an AMI from the snapshot
    - Launch an EC2 instance with the AMI in another _availability zone_
  - To move an EC2 volume from one _region_ to another:
    - Take a snapshot of it
    - Create an AMI from the snapshot
    - Copy the AMI from one region to another
    - Launch an EC2 instance with the AMI in the new _region_

- AMI
  - _Instance Store Volumes_ are sometimes called _Ephemeral Storage_
  - _Instance Store Volumes_ **cannot** be stopped
    - If the underlying host fails, you will lose your data
  - _Elastic Block Store_ backed instance can be stopped
    - You will not lose the data on this instance
  - You can reboot both without losing your data
  - By defailt, both _root_ volumes will be deleted on termination
    - With _Elastic Blick Store_ volumes, you can tell AWS to keep the _root_ device
  
- ENI
  - For basic networking

- ENA
  - For when you need speeds between 10Gbps and 100Gbps
  - For when you need reliable, high throughput networking

- EFA
  - For when you need to accelerate _High Performance Computing_ (HPC) applications
  - For when you need to accelerate _Machine Learning_ (MI) applications
  - If you need to an operating system (OS) by-pass

- Encryption
  - Snapshots of encrypted volumes are encrypted automatically
  - Volumes restored from encrypted snapshots are encrypted automatically
  - You can share snapshots, but only if they are unencrypted
    - Can be shared with other AWS accounts or made public
  - You can now encrypt _root_ device volumes upon creation of the EC2 instance
  - To encrypt an unencrypted _root_ device volume
    - Create a Snapshot of the unencrypted root device volume
    - Create a copy of the Snapshot and select the encrypt option
    - Create an AMI from the encrypted Snapshot
    - Use that AMI to launch new encrypted instances

- Spot Instances
  - Save up to 90% of of the cost of On-Demand Instances
  - Useful for any type of computing where you don't need peristent storage
  - You can block Spot Instances from terminating by using Spot block

- Spot Fleets
  - A collection of Spot Instances and, optionally, On-Demand Instances

- EC2 Hibernation
  - Preserves the in-memory RAM on persistent storage (EBS)
  - Much faster to boot up because you do not need to reload the operating system
  - Instance RAM must be less than 150 GB
  - Instance families include C3, C4, C5, I3, M3, M4, M5, R3, R4, R5, T2, T3
  - Available for Windows, Amazon Linux 2, and Ubuntu
  - Instances can't be hibernated for more than 60 days
  - Available for On-Demand and Reserved Instances

- CloudWatch
  - CloudWatch is used for monitoring performance
  - CloudWatch can monitor most of AWS as well as your applications that run on AWS
  - _Standard_ monitoring is 5 minutes
  - _Detailed_ monitoring is 1 minute
  - You can create CloudWatch _alarms_ which trigger notifications
  - _CloudWatch_ is all about performance
  - _CloudTrail_ is all about auditing
  - You can create _dashboards_ to see what is happening
  - You can use _events_ to respond to state changes in resources
  - You can use _logs_ to aggregate, monitor, and store log data

- CLI
  - You can interact with AWS from anywhere in the world just by using the command line
  - You will need to set up access in IAM
  - Commands themselves are not in the exam, but some basic commands will be useful to know for real life

- IAM
  - Roles are more secure than storing your access key and secret access key on individual EC2 instances
  - Roles are easier to manage
  - Roles can be assigned to an EC2 instance after it is created using both the console and command line
  - Role are universal, you can use them in any region

- Instance Metadata
  - Used to get information about an instance (such as public ip)
  - curl http://{ip}/latest/meta-data
  - curl http://{ip}/latest/user-data

- EFS
  - Supports the Network File System version 4 (NFSv4) protocol
  - You only pay for the storage you use (no pre-provisioning required)
  - Can scale up to the petabytes
  - Can support thousands of concurrent NFS connections
  - Data is stored across multiple _availability zones_ within a region
  - Read After Write Consistency

- EFS vs FSx
  - EFS
    - When you need distributed, highly resilient storage for Linux instances and Linux-based applications
  - Amazon FSx for Windows
    - When you need centralized storage for Windows-based applications such as Sharepoint, Microsoft SQL Server, Workspaces, IIS Web Server, or any other native Microsoft Application
  - Amazon FSx for Lustre
    - When you need high-speed, high-capacity distributed storage for applications that do High Performance Compute (HPC), financial modelling, etc.
    - Can store data directly on S3

- Placement Groups
  - Clustered Placement Group
    - Low Network Latency/High Network Throughput
  - Spread Placement Group
    - Individual Critical EC2 Instances
  - Partitioned
    - Multiple Ec2 instances HDFS, HBase, and Cassandra
  - A clustered placement group can't span multiple _Availability Zones_
  - A spread placement and partition group can span multiple _Availability Zones_
  - The name you specify for a placement group must be unique within your AWS account
  - Only certain types of instances can be launched in a placement group (Compute Optimized, GPU. Memory Optimized, Storage Optimized)
  - AWS recommends homogenous instances within clustered placement groups
  - You can't merge placement groups
  - You can move an existing instance into a placement group
    - The instance must be in the stopped state before moving
    - You can move or remove an instance using the CLI or an SDK, but not via the console yet

- HPC on AWS
  - Data Transfer
    - Snowball, Snowmobile (terrabytes/petabytes worth of data)
    - AWS DataSync to store on S3, EFS, FSx for Windows, FSx for Lustre, etc.
    - Direct Connect
  - Compute and Networking
    - EC2 instances that are GPU or CPU optimized
    - EC2 fleets (Spot Instances or Spot Fleets)
    - Placement groups (cluster placement groups)
    - Enhanced networking single root I/O virtualization (SR-IOV)
    - Elastic Network Adapter or Intel 82599 Virtual Function (VF) interface
    - Elast Fabric Adapters (OS-bypass)
  - Storage
    - Instance-Attached Storage
      - EBS: Scale up to 64,000 IOPS with Provisioned IOPS
      - Instance Store: Scale to millions of IOPS; low latency
    - Network Storage
      - Amazon S3: Distributed object-based storage; not a file system
      - Amazon EFS: Scale IOPS based on total size, or use Provisioned IOPS
      - Amazon FSx for Lustre: HPC-optimized distributed file sustem; millions of IOPs, whcih is also backed by S3
  - Orchestration and Automation
    - AWS Batch
    - AWS Paralell Cluster
  
- WAF
  - Block malicious IP addresses using one of the follow:
    - AWS WAF
    - Network ACLs

