terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.region
}

# -----------------------------
# Existing VPC and Subnet
# -----------------------------
data "aws_vpc" "existing" {
  id = var.vpc_id
}

data "aws_subnet" "existing" {
  id = var.subnet_id
}

# -----------------------------
# IAM Instance Profile (SSM Role)
# -----------------------------
data "aws_iam_instance_profile" "ssm_profile" {
  name = var.ssm_instance_profile
}

# -----------------------------
# Security Group (from variable)
# -----------------------------
data "aws_security_group" "existing_sg" {
  id = var.security_group_id
}

# -----------------------------
# EC2 Instance
# -----------------------------
resource "aws_instance" "tf_ec2" {
  ami                         = var.ami_id
  instance_type               = var.instance_type
  subnet_id                   = data.aws_subnet.existing.id
  vpc_security_group_ids      = [data.aws_security_group.existing_sg.id]
  iam_instance_profile        = data.aws_iam_instance_profile.ssm_profile.name
  associate_public_ip_address = true

  tags = {
    Name = var.instance_name
  }
}

# -----------------------------
# Outputs
# -----------------------------
output "public_ip" {
  value = aws_instance.tf_ec2.public_ip
}

output "instance_id" {
  value = aws_instance.tf_ec2.id
}
