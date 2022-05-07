resource "aws_internet_gateway" "collinsnassy_gw" {
  vpc_id = aws_vpc.collins_vpc.id

  tags = {
    Name = "main"
  }
}

resource "aws_route_table" "collinsnassy_rt" {
  vpc_id = aws_vpc.collins_vpc.id

  route {
    cidr_block = "10.0.1.0/24"
    gateway_id = aws_internet_gateway.collinsnassy_gw.id
  }

  route {
    ipv6_cidr_block        = "::/0"
    egress_only_gateway_id = aws_egress_only_internet_gateway.collins_egressonly_igw.id
  }

  tags = {
    Name = "example"
  }
}

resource "aws_egress_only_internet_gateway" "collins_egressonly_igw" {
  vpc_id = aws_vpc.collins_vpc.id

  tags = {
    Name = "main"
  }
}