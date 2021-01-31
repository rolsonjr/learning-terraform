provider "aws" {
  // "provider" key word tells Terraform which plugin to use and for which cloud platform to create resources for
  // Alternatives include Azure, Google Cloud
  region = "us-west-2"
}

resource "aws_vpc" "myvpc" {
  // "resource" declares a resource of a given type ("aws_vpc") with a local name "myvpc"
  // Resource name used to refer this local resource elsewhere in the same Terraform module
  cidr_block = "10.0.0.0/16"
}

// 1. run "terraform init": used to initialize a working directory containing Terraform configuration files
// https://www.terraform.io/docs/cli/commands/init.html

// 2. run "terraform plan": used to create an execution plan
// manages state for our Terraform resources. Very important to keep around!
// https://www.terraform.io/docs/cli/commands/plan.html

// 3. run "terraform apply": used to apply the changes required to reach the desired state of the configuration
// Verify AWS resources deployed on Terraform by cross-referencing with the AWS console
// https://www.terraform.io/docs/cli/commands/apply.html

// 4. run "terraform destroy": deletes the managed resource
// https://www.terraform.io/docs/cli/commands/destroy.html