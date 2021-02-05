
// Documentation on resource: aws_instance
// https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/instance
// Provides an EC2 instance resource.
// This allows instances to be created, updated, and deleted.
// Instances also support provisioning.

provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "ec2" {
  ami = "ami-005e54dee72cc1d00" # us-west-2
  instance_type = "t2.micro"    # free-tier eligible
}