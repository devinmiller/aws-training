# Route 53 (DNS)

Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. You can use Route 53 to perform three main functions in any combination: domain registration, DNS routing, and health checking.

## Features

- Register domain names
- Route internet traffic to the resources for your domain
- Check the health of your resources

[What is Route 53?](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/Welcome.html)

## DNS Record Types

- A
  - You use an A record to route traffic to a resource, such as a web server, using an IPv4 address in dotted decimal notation.
- CNAME
  - A CNAME record maps DNS queries for the name of the current record, such as acme.example.com, to another domain (example.com or example.net) or subdomain (acme.example.com or zenith.example.org). 
- MX
  - An MX record specifies the names of your mail servers and, if you have two or more mail servers, the priority order. Each value for an MX record contains two values, priority and domain name. 
- NS
  - An NS record identifies the name servers for the hosted zone.
- PTR
  - A PTR record maps an IP address to the corresponding domain name.
- SOA
  - A start of authority (SOA) record provides information about a domain and the corresponding Amazon Route 53 hosted zone.
- TXT
  - A TXT record contains one or more strings that are enclosed in double quotation marks (").

[DNS Record Types](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/ResourceRecordTypes.html)

## Routing Policies

When you create a record, you choose a routing policy, which determines how Amazon Route 53 responds to queries: 

- Simple Routing
  - Use for a single resource that performs a given function for your domain, for example, a web server that serves content for the example.com website. 
- Failover Routing
  - Use when you want to configure active-passive failover. 
- Geolocation Routing
  - Use when you want to route traffic based on the location of your users. 
- Geoproximity Routing
  - Use when you want to route traffic based on the location of your resources and, optionally, shift traffic from resources in one location to resources in another
- Latency Routing
  - Use when you have resources in multiple AWS Regions and you want to route traffic to the Region that provides the best latency with less round-trip time. 
- Multivalue Answer Routing
  - Use when you want Route 53 to respond to DNS queries with up to eight healthy records selected at random. 
- Weighted Routing
  - Use to route traffic to multiple resources in proportions that you specify. 

[Choosing a Routing Policy](https://docs.aws.amazon.com/Route53/latest/DeveloperGuide/routing-policy.html)

## Health Checks

You can create the following types of Amazon Route 53 health checks:

- Health checks that monitor an endpoint
  - You can configure a health check that monitors an endpoint that you specify either by IP address or by domain name. 
- Health checks that monitor other health checks (calculated health checks)
  - You can create a health check that monitors whether Route 53 considers other health checks healthy or unhealthy.
- Health checks that monitor CloudWatch alarms
  - You can create CloudWatch alarms that monitor the status of CloudWatch metrics, such as the number of throttled read events for an Amazon DynamoDB database or the number of Elastic Load Balancing hosts that are considered healthy.
- Amazon Route 53 Application Recovery Controller
  - Amazon Route 53 Application Recovery Controller gives you insights into whether your applications and resources are ready for recovery, and helps you manage and coordinate failover.

## Exam Tips

- DNS
  - ELBs do not have pre-defined IPv4 addresses; you resolve to them using a DNS name
  - Understand the difference between and Alias Record and a CNAME
  - Given the choice, always choose and Alias Record over a CNAME
  - Common DNS types
    - SOA Records
    - NS Rcords
    - A Records 
    - CNAMES
    - MX Records
    - PTR Records
- Domain Registration
  - You can buy domain names directly with AWS
  - It can take up to three days to register depending on the circumstances
- Routing Policies
  - Simple Routing
    - Can only have one record with multiple IP addresses
    - Route 53 returns all values in a random order
  - Weighted Routing
    - Route traffic to multiple resources based on a specific proportion
  - Latency-based Routing
    - Route traffic to the region that provides the best latency with less round-trip time 
  - Failover Routing
    - Use to configure active-passive failover based on a health check
  - Geolocation Routing
    - Route traffic based on the location of clients
  - Geoproximity Route (Traffic Flow Only)
    - Route traffic based on the location of resources and, optionally, shift traffic between locations
  - Multivalue Answer Routing
    - Use Route 53 to respond to DNS queries with up to eight healthy records selected at random
- Health Checks
  - You can set health checks on individual record sets
  - If a record set fails a health check it will be removed form Route53 until it passes again
  - You can configure SNS notifications to alert on a failed health check