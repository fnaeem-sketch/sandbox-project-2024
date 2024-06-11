variable "vpc_id" {
  description = "The VPC ID where the security group will be created"
  type        = string
}

variable "alb_sg_id" {
  type        = string
  description = "The Security Group ID of the ALB."
}

variable "ec2_connect_sg_id" {
  type        = string
  description = "The Security Group ID for EC2 Instance Connect."
}

variable "app_server_sg_id" {
  type        = string
  description = "The Security Group ID of the application servers."
}

variable "nfs_sg_id" {
  description = "The Security Group ID for the NFS traffic source."
  type        = string
}
