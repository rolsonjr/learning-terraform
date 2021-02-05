
// Documentation on resource: aws_eip
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/eip
// "Provides an Elastic IP resource."

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"    # free-tier eligible
}

resource "aws_eip" "elasticip" {
  instance = aws_instance.ec2.id
}

output "eip" {
  value = aws_eip.elasticip.public_ip // public IP
}