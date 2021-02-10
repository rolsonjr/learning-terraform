
resource "aws_instance" "db" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"

  tags = {
    name = "DB Server"
  }
}

output "privateip" {
  value = aws_instance.db.private_ip
}
