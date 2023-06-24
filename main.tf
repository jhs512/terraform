terraform {
  cloud {
    organization = "lldj-01"
    hostname     = "app.terraform.io"

    workspaces {
      name = "workspace-01"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = "ap-northeast-2"
}

# Create a VPC
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "${var.prefix}-vpc"
  }
}

# Add a subnet
resource "aws_subnet" "subnet" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "${var.prefix}-subnet"
  }
}