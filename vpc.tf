resource "aws_vpc" "VPC-Cluster" {
  cidr_block = var.bloqueVPC
}

resource "aws_subnet" "obli-ClusterSubnet1" {
  vpc_id                  = aws_vpc.VPC-Cluster.id
  cidr_block              = var.bloqueSubnet1
  availability_zone       = var.AZ1
  map_public_ip_on_launch = "true"
  tags = {
    Name = var.nombreSubnet1
  }
}

resource "aws_subnet" "obli-ClusterSubnet2" {
  vpc_id                  = aws_vpc.VPC-Cluster.id
  cidr_block              = var.bloqueSubnet2
  availability_zone       = var.AZ2
  map_public_ip_on_launch = "true"
  tags = {
    Name = var.nombreSubnet2
  }
}

resource "aws_internet_gateway" "obli-GWCluster" {
  vpc_id = aws_vpc.VPC-Cluster.id
  tags = {
    Name = "int-gw"
  }
}

resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.VPC-Cluster.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.obli-GWCluster.id
  }
}