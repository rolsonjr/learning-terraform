
provider "aws" {
  region = "us-west-2"
}

// note: any changes to modules will require another run of "terraform init" for terraform to accept the changes
module "ec2module" {
  source = "./ec2"
  ec2name = "Name from module"
}

output "module_output" {
  value = module.ec2module.instance_id
}