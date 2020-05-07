locals {
  ami = "ami-03e33c1cefd1d3d74"
  instance_type = "t2.micro"
}

resource "aws_instance" "ec2" {
    ami = "${local.ami}"
    instance_type = "${local.instance_type}"
  
    tags = {
        name = "web"
        description = "${local.instance_type} - ${local.ami}"
        public_ip = ""
    }
}

resource "aws_eip" "elastic_ip" {
 instance = "${aws_instance.ec2.id}"
}

output "public_ip" {
  value = "${aws_eip.elastic_ip.id}"
}





