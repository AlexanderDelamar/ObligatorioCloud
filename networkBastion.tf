resource "aws_vpc" "obli-VPCBastion" {
  cidr_block = var.bloqueVPCBastion
}

resource "aws_subnet" "obli-subnetBastion" {
  vpc_id                  = aws_vpc.obli-VPCBastion.id
  cidr_block              = var.subnetBastion
  availability_zone       = var.AZBastion
  map_public_ip_on_launch = "true"
  tags = {
    Name = var.nombSubnetBastion
  }
}

resource "aws_internet_gateway" "obli-GWBastion" {
  vpc_id = aws_vpc.obli-VPCBastion.id
  tags = {
    Name = var.nombGWBastion
  }
}

resource "aws_default_route_table" "obli-RT" {
  default_route_table_id = aws_vpc.obli-VPCBastion.default_route_table_id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.obli-GWBastion.id
  }
  tags = {
    Name = var.nombRTBastion
  }
}