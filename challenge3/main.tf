
provider "aws" {
  region = "us-west-2"
}

module "web" {
  source = "./web"
}

module "db" {
  source = "./db"
}

output "publicip" {
  value = module.web.publicip
}

output "privateip" {
  value = module.db.privateip
}