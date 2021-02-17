
provider "aws" {
  region = "us-west-2"
}

variable "num_of_servers" {
  type = number
}

// can use variables to configure specific environments i.e. test, prod
// better than creating tf files for each environment
// to run terraform for a specific variable in mind, run "terraform plan -var-file={tfvars filename}"
// ex. terraform plan -var-file=test.tfvars
resource "aws_instance" "ec2" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  count = var.num_of_servers
}
