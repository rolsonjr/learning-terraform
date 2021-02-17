
provider "aws" {
  region = "us-west-2"
}

resource "aws_instance" "db" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
}

resource "aws_instance" "web" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  // dependency will ensure the db instance will be built first before the web instance
  depends_on = [aws_instance.db]
}
