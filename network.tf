resource "aws_vpc" "obli-vpc" {
    cidr_block = var.cidrVPC
    enable_dns_support = true
    enable_dns_hostnames = true

    tags = {
        Name = var.nomVPC
    }
}

resource "aws_subnet" "obli-private-subnet1" {
    vpc_id = aws_vpc.obli-vpc.id
    cidr_block = var.privateSubnet1
    availability_zone = var.AZ1
    map_public_ip_on_launch = "true"
    tags = {
        Name = var.nomSubnet1
    }
}

resource "aws_subnet" "obli-private-subnet2" {
    vpc_id = aws_vpc.obli-vpc.id
    cidr_block = var.privateSubnet2
    availability_zone = var.AZ2
    map_public_ip_on_launch = "true"
    tags = {
        Name = var.nomSubnet2
    }
}

resource "aws_internet_gateway" "obli-GW" {
  vpc_id = aws_vpc.obli-vpc.id
  tags = {
    Name = var.nomGW
  }
}

resource "aws_route_table" "obli-RT" {
    vpc_id = aws_vpc.obli-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.obli-GW.id
    }
    tags = {
        Name = "obli-RT"
    }
}