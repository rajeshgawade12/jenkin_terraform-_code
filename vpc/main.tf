resource "aws_vpc" "my_vpc" {
  cidr_block = "172.16.0.0/16"

  tags = {
    Name = "jenkins"
  }
}

resource "aws_subnet" "my_subnet1" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.10.0/24"
  availability_zone = "ap-south-1a"
}
resource "aws_subnet" "my_subnet2" {
  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = "172.16.11.0/24"
  availability_zone = "ap-south-1b"
}
resource "aws_security_group" "allow_jenkins" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic"
  vpc_id      = aws_vpc.my_vpc.id
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
resource "aws_security_group_rule" "ssh" {
  type              = "ingress"
  from_port         = 22
  to_port           = 22
  protocol          = "tcp"
  cidr_blocks       = ["152.58.209.20/32"]
  security_group_id = aws_security_group.allow_jenkins.id
}
resource "aws_security_group_rule" "allow_jenlins" {
  type              = "ingress"
  from_port   = 8080
  protocol    = "tcp"
  to_port     = 8080
  cidr_blocks = ["0.0.0.0/0"]
  security_group_id = aws_security_group.allow_jenkins.id
}
