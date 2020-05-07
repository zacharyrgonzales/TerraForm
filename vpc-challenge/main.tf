variable "SharedVars" {
  type = "string"
  default = "Terraform_VPC_01"
}

resource "aws_vpc" "TerraformVPC" {
    cidr_block ="192.168.0.0/24"

    tags = {
        Name = "${var.SharedVars}"
    }
}

output "vpcid" {
  value = "${aws_vpc.TerraformVPC.id}"
}



