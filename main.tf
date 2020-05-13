#define variables
variable "vpcname" {
  type    = "string"
  default = "VPCTerraform"
}

variable "mylist" {
  type    = "list"
  default = ["Value1", "Value2"]
}

variable "mymap" {
  type = "map"

  default = {
    Key1 = "Value 1"
    Key2 = "Value 2"
  }
}

variable "myboolean" {
  default = true
}

#create virtual private cloud
resource "aws_vpc" "myvpc" {
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "${var.vpcname}"
    Description = "${var.mylist[1]}"
  }
}

#output vpc id
output "VPCID" {
  value = "${aws_vpc.myvpc.id}"
}

