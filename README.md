# sandbox-project-wordpress
This project hosts a wordpress website using a 3 tier AWS architecture.
The infrastructure for this project is deployed via terraform.  

Key infrastructure deployed 
    AWS VPC
    Internet Gateway
    3 Public and 3 Private subnets across 2 Availability Zones
    2 Public subnets (for resources like Load Balancers and NAT Gateways)
    4 Private subnets (for resources like EC2 instances and databases)
        2 private application subnets
        2 private database subnets 
    
    Auto assign public IP address to Public Subnets 
    
    Route table for public subnets

