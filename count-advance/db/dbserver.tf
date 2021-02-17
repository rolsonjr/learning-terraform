
variable "server_names" {
  type = list(string)
}

resource "aws_instance" "db" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  count = length(var.server_names)

  tags = {
    name = var.server_names[count.index]
  }
}

output "privateip" {
  value = [aws_instance.db.*.private_ip]
}
