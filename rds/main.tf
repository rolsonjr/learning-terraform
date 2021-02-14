
provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "myrds" {
  name = "myDB"
  identifier = "my-terraform-rds"
  instance_class = "db.t2.micro"
  engine = "mysql"
  engine_version = "8.0.20"
  username = "admin"
  password = "adminpass"
  port = 3306
  allocated_storage = 20
  skip_final_snapshot = true
}