
// configures terraform to store the state file in an S3 bucket instead of storing it locally
terraform {
  backend "s3" {
    key = "terraform/tfstate.tfstate"  // folder path to put the state file
    bucket = "terraform-rolson-test"
    region = "us-west-2"
    access_key = "" // can leave blank, will ask as input
    secret_key = ""
  }
}