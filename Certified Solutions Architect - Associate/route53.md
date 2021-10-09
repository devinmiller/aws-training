# Route 53 (DNS)

Amazon Route 53 is a highly available and scalable Domain Name System (DNS) web service. You can use Route 53 to perform three main functions in any combination: domain registration, DNS routing, and health checking.

## Features

- Register domain names
- Route internet traffic to the resources for your domain
- Check the health of your resources

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