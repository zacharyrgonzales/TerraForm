locals {
    db_instance_class = "db.t2.micro"
    ec2_ami = "ami-03e33c1cefd1d3d74"
    ec2_instance_type = "t2.micro"
}

resource "aws_db_instance" "RDS_Instance" {
    allocated_storage = 20
    engine = "mysql"
    instance_class = "${local.db_instance_class}"
    password = "db1"
    username = "terraform"
}

resource "aws_instance" "EC2_instance" {
    ami = "${local.ec2_ami}"
    instance_type = "${local.ec2_instance_type}"
    security_groups = ["${aws_security_group.web_traffic1.name}"]
    
    provisioner "file" {
        source = "script.sh"
        destination = "/user/zach/documents/script.sh"
    }

    tags = {
        public_ip = ""
    }
}

resource "aws_eip" "lb" {
  instance = "${aws_instance.EC2_instance.id}"
}


resource "aws_security_group" "web_traffic1" {
    name = "web_traffic1"
    description = "to allow web traffic"
    ingress = {
        description = "https traffic rule"
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
}

output "db_ip" {
  value = "${aws_instance.EC2_instance.public_ip}"
      
}

