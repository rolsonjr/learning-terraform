
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  tags = {
    name = "DB Server"
  }
}

output "privateip" {
  value = aws_instance.db.private_ip
}

resource "aws_instance" "web" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  security_groups = [aws_security_group.webtraffic.name]
  user_data = file("server-script.sh")

  tags = {
    name = "Web Server"
  }
}

resource "aws_eip" "webserver_eip" {
  instance = aws_instance.web.id
}

output "publicip" {
  value = aws_eip.webserver_eip.public_ip
}

variable "ingressrules" {
  type = list(number)
  default = [80, 443]
}

variable "egressrules" {
  type = list(number)
  default = [80, 443]
}

resource "aws_security_group" "webtraffic" {
  name = "allow web traffic"
  dynamic "ingress" {
    iterator = port
    for_each = var.ingressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
  dynamic "egress" {
    iterator = port
    for_each = var.egressrules
    content {
      from_port = port.value
      to_port = port.value
      protocol = "TCP"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}