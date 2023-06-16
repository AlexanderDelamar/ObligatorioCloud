resource "aws_vpc" "vpc-example" {
  cidr_block = "192.168.0.0/16"
}

resource "aws_subnet" "subnet-example" {
  vpc_id     = aws_vpc.vpc-example.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "us-east-1a"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Main"
  }
}

resource "aws_subnet" "subnet-example2" {
  vpc_id     = aws_vpc.vpc-example.id
  cidr_block = "192.168.2.0/24"
  availability_zone = "us-east-1b"
  map_public_ip_on_launch = "true"
  tags = {
    Name = "Main"
  }
}

resource "aws_internet_gateway" "gw-example" {
  vpc_id = aws_vpc.vpc-example.id
  tags = {
    Name = "int-gw"
  }
}

resource "aws_default_route_table" "example" {
  default_route_table_id = aws_vpc.vpc-example.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gw-example.id
  }
}
