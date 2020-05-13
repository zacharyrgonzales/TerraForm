#input is passed into the ec2name which triggers the ec2 build
variable "ec2dbname" {
  type = "string"
}

#create ec2 instance using ubuntu xenial image
resource "aws_instance" "moduleEc2db" {
    ami = "ami-03e33c1cefd1d3d74"
    instance_type = "t2.micro"
    
    tags = {
        Name = "${var.ec2dbname}"
    }
}

#output private ip
output "db_ip" {
  value = "${aws_instance.moduleEc2db.private_ip}"
}

