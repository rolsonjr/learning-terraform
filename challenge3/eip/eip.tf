
variable "instanceId" {
  type = string
}

resource "aws_eip" "webserver_eip" {
  instance = var.instanceId
}

output "publicip" {
  value = aws_eip.webserver_eip.public_ip
}
