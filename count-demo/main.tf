
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  count = 3 // creates 3 instances of "ec2"
}
