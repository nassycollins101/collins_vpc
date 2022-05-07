resource "aws_vpc" "collins_vpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "collins_vpc"
  }
}

resource "aws_subnet" "collins_public_subnet1" {
  vpc_id            = aws_vpc.collins_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "collins_public_subnet2" {
  vpc_id            = aws_vpc.collins_vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "collins_private_subnet1" {
  vpc_id            = aws_vpc.collins_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "collins_private_subnet2" {
  vpc_id            = aws_vpc.collins_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "collins_private_subnet3" {
  vpc_id            = aws_vpc.collins_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_subnet" "collins_private_subnet4" {
  vpc_id            = aws_vpc.collins_vpc.id
  cidr_block        = "10.0.1.0/24"
  availability_zone = "us-east-1a"

}

resource "aws_network_acl" "public_nacl1" {
  vpc_id     = aws_vpc.collins_vpc.id
  subnet_ids = [aws_subnet.collins_public_subnet1.id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl" "public_nacl2" {
  vpc_id     = aws_vpc.collins_vpc.id
  subnet_ids = [aws_subnet.collins_public_subnet2.id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "allow"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl" "private_nacl1" {
  vpc_id     = aws_vpc.collins_vpc.id
  subnet_ids = [aws_subnet.collins_private_subnet1.id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl" "private_nacl2" {
  vpc_id     = aws_vpc.collins_vpc.id
  subnet_ids = [aws_subnet.collins_private_subnet2.id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl" "private_nacl3" {
  vpc_id     = aws_vpc.collins_vpc.id
  subnet_ids = [aws_subnet.collins_private_subnet3.id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}

resource "aws_network_acl" "private_nacl4" {
  vpc_id     = aws_vpc.collins_vpc.id
  subnet_ids = [aws_subnet.collins_private_subnet4.id]

  egress {
    protocol   = "tcp"
    rule_no    = 200
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 443
    to_port    = 443
  }

  ingress {
    protocol   = "tcp"
    rule_no    = 100
    action     = "deny"
    cidr_block = "0.0.0.0/0"
    from_port  = 80
    to_port    = 80
  }

  tags = {
    Name = "main"
  }
}
