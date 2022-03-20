resource "aws_vpc" "vpc" {

  count                = var.kvpc_id != "" ? 0 : 1
  cidr_block           = var.vpc_cidr_block
  enable_dns_hostnames = true

  tags = {
    Name = "vpc"
  }
}

resource "aws_subnet" "main" {
  count      = var.subnet_id != "" ? 0 : 1
  vpc_id     = var.kvpc_id != "" ? var.kvpc_id : aws_vpc.vpc[0].id
  cidr_block = var.subnet_cidr_block

}

data "aws_subnet" "data_subnet" {
  #count = var.subnet_id != "" ? 1 : 0
  id = var.subnet_id != "" ? var.subnet_id : aws_subnet.main[0].id
}

data "aws_vpc" "data_vpc" {
  #count = var.vpc_id != "" ? 1 : 0
  id = var.kvpc_id != "" ? var.kvpc_id : aws_vpc.vpc[0].id
}

resource "aws_internet_gateway" "main-dev-gateway" {
  vpc_id = var.kvpc_id != "" ? var.kvpc_id : aws_vpc.vpc[0].id


}


resource "aws_route_table" "rtb" {

  vpc_id = var.kvpc_id != "" ? var.kvpc_id : aws_vpc.vpc[0].id

  route {
    cidr_block = var.open-cidr
    gateway_id = aws_internet_gateway.main-dev-gateway.id
  }

  tags = {
    Name = "route-table-${var.instance_name}"
  }

}



resource "aws_main_route_table_association" "rtb-vpc-association" {
  vpc_id         = var.kvpc_id != "" ? var.kvpc_id : aws_vpc.vpc[0].id
  route_table_id = aws_route_table.rtb.id
}
