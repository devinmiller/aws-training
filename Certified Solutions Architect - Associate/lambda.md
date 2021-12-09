# Lambda

AWS Lambda is a serverless compute service that runs your code in response to events and automatically manages the underlying compute resources for you. 

## Features

## Exam Tips

- Lambda scales out (not up) automatically
- Lambda functions are independent
  - 1 event = 1 function
- Lambda is serverless
- Know what services are serverless!
- Lambda functions can trigger other lambda functions
  - 1 event can = x number of functions if functions trigger other functions
- Architectures can get extremely complicated
  - AWS X-Ray allows you to debug what is happening
- Lambda can do things globally
  - You can use it to back up S3 buckets to other S3 buckets etc.
- Know your triggers!