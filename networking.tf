resource "aws_vpc" "vpc" {
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "main" {
  vpc_id     = aws_vpc.vpc.id
  cidr_block = var.subnet_cidr_block

}


resource "aws_internet_gateway" "main-dev-gateway" {
  vpc_id = aws_vpc.vpc.id
}


resource "aws_route_table" "rtb" {
  vpc_id = aws_vpc.vpc.id

  route {
    cidr_block = var.open-cidr
    gateway_id = aws_internet_gateway.main-dev-gateway.id
  }

  tags = {
    Name = "route-table-${var.instance_name}"
  }

}



resource "aws_main_route_table_association" "rtb-vpc-association" {
  vpc_id         = aws_vpc.vpc.id
  route_table_id = aws_route_table.rtb.id
}
