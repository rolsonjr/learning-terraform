provider "aws" {
  region = "us-west-2"
}

// string variables
variable "vpcname" {
  type = string
  default = "myvpc"
}

// number (integer) variables
variable "sshport" {
  type = number
  default = 22
}

// boolean variables
variable "enabled" {
  default = true
}

// list<string> types (identical to arrays)
// ordered elements by index, starting at 0
variable "mylist" {
  type = list(string)
  default = ["Value1", "Value2"]
}

// maps (key/value pairs)
variable "mymap" {
  type = map
  default = {
    Key1 = "Value1"
    Key2 = "Value2"
  }
}

variable "inputname" {
  type = string
  description = "Set the name of the VPC"
}

resource "aws_vpc" "myvpc" {
  cidr_block = "10.0.0.0/16"

  tags = {
    // Name = var.vpcname  // alt. Name = "${var.vpcname}"
    // Name = var.mylist[0]
    // Name = var.mymap["Key1"]
    Name = var.inputname // asks for input of variable name on "terraform plan" command
  }
}

output "vpcid" {
  value = aws_vpc.myvpc.id
}

// tuple data type example
variable "mytuple" {
  type = tuple([string, number, string])
  default = ["cat", 1, "dog"]
}

// object data type example
variable "myobject" {
  type = object({
    name = string,
    ports = list(number)
  })
  default = {
    name = "rolson",
    ports = [22, 25, 80]
  }
}