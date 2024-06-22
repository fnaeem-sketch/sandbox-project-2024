# Sandbox Project 
## Deploying a WordPress Site in AWS

<!--
<div align="center">
  <img src="https://i.sstatic.net/SZhp7.png" alt="Kubernetes Logo" width="700">
</div>
-->

<!-- This is a single-line comment -->

<!--
  This is a multi-line comment.
  You can add as many lines as you like.
-->

<p>This text will be displayed on the webpage.</p>
<!-- <p>This text will not be displayed because it is commented out.</p> -->


### Outline 
This project hosts a WordPress website using a 3-tier AWS architecture.
The infrastructure for this project is deployed via Terraform.

### Key Infrastructure Deployed 
- **AWS VPC**: Virtual Private Cloud to isolate the network environment.
- **Internet Gateway**: To allow internet access to resources in the public subnets.
- **Subnets**: 
  - **3 Public Subnets**: For resources like Load Balancers and NAT Gateways.
  - **3 Private Subnets**: For resources like EC2 instances and databases.
  - **Auto-assign Public IP Address**: For resources in public subnets.
- **Route Tables**: 
  - **Public Route Table**: For routing internet traffic to the public subnets.
  - **Associations**: Associate route tables to the appropriate subnets.
- **Security Groups**: 
  - **Application Load Balancer SG**
  - **EC2 Instance Connect Endpoint SG**
  - **App Server Security Group**
  - **Database Security Group**
  - **EFS Security Group**
- **EC2 Instance Connect Endpoint**: For secure SSH access to EC2 instances.
- **EC2 Instances**: 
  - Launched via Terraform.
  - SSH access using `aws ec2-instance-connect ssh --instance-id`.
  - Apache server installation on EC2 instances using:
    - `sudo yum install httpd -y`

### Create EFS and RDS 
- **EFS (Elastic File System)**: 
  - Allows multiple EC2 instances to access the application code from a shared storage source.
  - WordPress files are stored on EFS for access by multiple EC2 instances.
  - EFS is mounted to the web servers.

### Create RDS Instance and Database Subnet Groups
- **RDS (Relational Database Service)**: 
  - MySQL instance created via Terraform.
  - Database subnet groups for secure database access.

### Create an Application Load Balancer 
- **ALB (Application Load Balancer)**:
  - Created along with a target group.
  - EC2 instances are added to the target group.
  - Allows users to access the WordPress site hosted on the servers.
  - For security considerations, we place our web servers in private subnets. 
  - To enable access to private servers, we create a target group and add our ec2 instances to it. 
  - The ALB routes traffic to the servers in the target group. 

### Conclusion
This project demonstrates the deployment of a scalable and secure WordPress site using Terraform to manage AWS infrastructure. The use of a 3-tier architecture, including VPC, subnets, security groups, EC2 instances, EFS, RDS, and ALB, showcases essential cloud engineering skills.
