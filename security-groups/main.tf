
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"    # free-tier eligible
  security_groups = [aws_security_group.webtraffic.name]
}

resource "aws_security_group" "webtraffic" {
  name = "allow HTTPS"
  // filters incoming traffic
  ingress {
    from_port = 443  // from_port & to_port acts as lower and upper bounds of accepted ports
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"] // allows for all traffic
  }
  // filter outbound traffic
  egress {
    from_port = 443
    to_port = 443
    protocol = "TCP"
    cidr_blocks = ["0.0.0.0/0"] // allows for all traffic
  }
}