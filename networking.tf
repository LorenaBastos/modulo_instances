locals{
    cidr_block_subnets = cidrsubnets(aws_vpc.vpc-lorena.cidr_block, 8, 8)
}

resource "aws_vpc" "vpc-lorena" {
  cidr_block = var.vpc_cidr
  enable_dns_support = true
  enable_dns_hostnames = true

  tags = {
    Name = "lorena-vpc"
    Environment = "Dev"
  }
} 

resource "aws_subnet" "subnet-lorena" { 
  count             = 2
  vpc_id            = aws_vpc.vpc-lorena.id
  cidr_block        = local.cidr_block_subnets[count.index]
  availability_zone = var.availability_zone

  tags = {
    Name        = "lorena-subnet"
    Environment = "Dev"
  }
} 

