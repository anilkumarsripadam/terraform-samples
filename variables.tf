# AWS Region
variable "region" {
  description = "AWS region to deploy resources"
  type        = string
}

# Existing VPC
variable "vpc_id" {
  description = "Existing VPC ID"
  type        = string
}

# Existing Subnet
variable "subnet_id" {
  description = "Existing Subnet ID"
  type        = string
}

# Existing Security Group
variable "security_group_id" {
  description = "Existing Security Group ID"
  type        = string
}

# Existing SSM Instance Profile
variable "ssm_instance_profile" {
  description = "IAM Instance Profile name with SSM permissions"
  type        = string
}

# EC2 AMI
variable "ami_id" {
  description = "AMI ID for the EC2 instance"
  type        = string
}

# EC2 Instance Type
variable "instance_type" {
  description = "Instance type for EC2"
  type        = string
  default     = "t3.micro"
}

# Instance Name Tag
variable "instance_names" {
  description = "Tag Name for the EC2 instance"
  type        = list(string)
  default     = ["ani-test-1", "ani-test-2"]
}
