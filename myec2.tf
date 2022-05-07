resource "aws_instance" "collins1_public_ec2" {
  ami                    = "ami-0f9fc25dd2506cf6d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.collins_public_subnet1.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
}

resource "aws_instance" "collins2_public_ec2" {
  ami                    = "ami-0f9fc25dd2506cf6d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.collins_public_subnet2.id
  vpc_security_group_ids = [aws_security_group.sg1.id]
}

resource "aws_instance" "collins1_private_ec2" {
  ami                    = "ami-0f9fc25dd2506cf6d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.collins_private_subnet1.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
}

resource "aws_instance" "collins2_private_ec2" {
  ami                    = "ami-0f9fc25dd2506cf6d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.collins_private_subnet2.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
}

resource "aws_instance" "collins3_private_ec2" {
  ami                    = "ami-0f9fc25dd2506cf6d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.collins_private_subnet3.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
}

resource "aws_instance" "collins4_private_ec2" {
  ami                    = "ami-0f9fc25dd2506cf6d"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.collins_private_subnet4.id
  vpc_security_group_ids = [aws_security_group.sg2.id]
}