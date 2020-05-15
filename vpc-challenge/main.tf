#define variables
variable "SharedVars" {
  type    = "string"
  default = "Terraform_VPC_01"
}

#create virtual private cloud
resource "aws_vpc" "TerraformVPC" {
  cidr_block = "192.168.0.0/24"

  tags = {
    Name = "${var.SharedVars}"
  }
}

#output vpc id
output "vpcid" {
  value = "${aws_vpc.TerraformVPC.id}"
}
