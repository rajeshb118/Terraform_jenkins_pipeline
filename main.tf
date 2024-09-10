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

# Provider-2 for us-west-1
provider "aws" {
  region = "us-west-1"
  alias = "west-1"
  profile = "default"
}

# Provider-3 for us-east-1
provider "aws" {
  region = "us-east-1"
  alias = "east-1"
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

# Create EC2 instances in us-west-1
resource "aws_instance" "N.California" {
  provider = aws.north-1

  ami           = "ami-025258b26b492aec6"  # Example AMI, replace with a valid one
  instance_type = "t3.micro"

  tags = {
    Name = "n.california"
  }
}

# Create EC2 instances in us-east-1
resource "aws_instance" "Nvirginia" {
  provider = aws.east-1

  ami           = "ami-0b72821e2f351e396"  # Example AMI, replace with a valid one
  instance_type = "t2.micro"

  tags = {
    Name = "Nvirginia"
  }  
}

resource "aws_s3_bucket" "thunithovaikarabucket" {
  bucket = "thunithovaikarabucket"
  acl    = "private"

  tags = {
    Name        = "thunithovaikarabucket"
  }
}
