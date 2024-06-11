# Sandbox Project 
## Deploying a Wordpress Site in AWS

### Outline 
This  project hosts a wordpress website using a 3 tier AWS architecture.
The infrastructure for this project is deployed via terrafom


### Key infrastructure deployed 
- AWS VPC
- Internet Gateway
- 3 Public and 3 Private subnets across 2 Availability Zones
- 2 Public subnets 
    - (for resources like Load Balancers and NAT Gateways)
- 4 Private subnets 
    - (for resources like EC2 instances and databases)
    - Auto assign public IP address to Public Subnets 
- 2 private application subnets
- 2 private database subnets  
- Route table for public subnets
    - Associate route tables to public subnets 
- 5 security groups 
    - Application Load Balancer SG
    - EC2 Instance Connect Endpoint SG
    - App Server Security Group 
    - Database Security Group 
    - EFS Security Group 
- Create an EC2 Instance Connect Endpoint 
    
- Launch ec2 instance via terraform 

- SSH into instance using:
    -  `aws ec2-instance-connect ssh --instance-id`
- Install Apace server on ec2 instance using 
    - `sudo yum install httpd -y`

## Create EFS and RDS 
An EFS file system allows multiple ec2 instances to access the application code from the same storage source.<br>
Wordpress files will be stored using EFS so multiple ec2 instances can access them.<br>
We will mount the EFS to our web servers. 

## Create RDS Instance and database subnet groups
Create a MySql instance via terraform 

## Create an application load balancer 
- Along with the ALB, we create a target group and add the ec2 instance to the target group

