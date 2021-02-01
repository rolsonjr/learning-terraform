
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "challenge1vpc" {
  cidr_block = "192.168.0.0/24"
  tags = {
    // resource name vs tag name
    // resource name (challenge1vpc here) is the local resource name that may be referenced elsewhere in the tf module
    // tag name (TerraformVPC here) will be the name attached to the AWS resource (can verify on the AWS console)
    name = "TerraformVPC"
  }
}