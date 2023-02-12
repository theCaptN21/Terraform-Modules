provider "aws" {
  region = var.region
}

resource "aws_vpc" "modulevpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_internet_gateway" "IGW" {
  vpc_id = aws_vpc.modulevpc.id
}

resource "aws_subnet" "publicsubnets" {
  vpc_id     = aws_vpc.modulevpc.id
  cidr_block = "10.0.101.0/24"
}

resource "aws_subnet" "privatesubnets" {
  vpc_id     = aws_vpc.modulevpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_route_table" "PublicRT" {
  vpc_id = aws_vpc.modulevpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.IGW.id
  }
}

resource "aws_route_table" "PrivateRT" {
  vpc_id = aws_vpc.modulevpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATgw.id
  }
}

resource "aws_route_table_association" "PubRTassociation" {
  subnet_id      = aws_subnet.publicsubnets.id
  route_table_id = aws_route_table.PublicRT.id
}

resource "aws_route_table_association" "PriRTassociation" {
  subnet_id      = aws_subnet.privatesubnets.id
  route_table_id = aws_route_table.PrivateRT.id
}
resource "aws_eip" "nateIP" {
  vpc = true
}

resource "aws_nat_gateway" "NATgw" {
  allocation_id = aws_eip.nateIP.id
  subnet_id     = aws_subnet.publicsubnets.id
}






