
resource "aws_instance" "web" {
  ami = "ami-005e54dee72cc1d00"
  instance_type = "t2.micro"
  security_groups = [module.sg.sgname]
  user_data = file("./web/server-script.sh")

  tags = {
    name = "Web Server"
  }
}

module "sg" {
  source = "../sg"
  egressrules = [80, 443]
  ingressrules = [80, 443]
}

module "eip" {
  source = "../eip"
  instanceId = aws_instance.web.id
}

output "publicip" {
  value = module.eip.publicip
}