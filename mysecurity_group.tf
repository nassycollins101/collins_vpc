resource "aws_security_group" "sg1" {
  vpc_id = aws_vpc.collins_vpc.id
  tags = {
    type = "terraform-test-security-group"
  }
}

resource "aws_security_group" "sg2" {
  vpc_id = aws_vpc.collins_vpc.id
  tags = {
    type = "terraform-test-security-group"
  }
}
