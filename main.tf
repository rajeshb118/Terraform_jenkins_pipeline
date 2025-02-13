# Terraform Block
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.50.0"
    }
  }
}

# Provider-1 for ap-south-1 (Default Provider)
provider "aws" {
  region = "ap-south-1"
  alias = "south-1"
  profile = "default"
}

# Create EC2 instances in ap-south-1
resource "aws_instance" "Mumbai" {
  provider = aws.south-1

  ami           = "ami-0ec0e125bb6c6e8ec"  # Example AMI, replace with a valid one
  instance_type = "t2.micro"

  tags = {
    Name = "Mumbai"
  }
}


