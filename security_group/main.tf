#create ec2 instance using ubuntu xenial image and apply firewall rules
resource "aws_instance" "webserver_ec2_example" {
    ami = "ami-03e33c1cefd1d3d74"
    instance_type = "t2.micro"
    security_groups = ["${aws_security_group.web_dmz_firewall_tf.name}"]
  
    tags = {
        name = "ubuntu_xenial_webserver"
        description = "web server"
    }
}

#create security group for firewall
resource "aws_security_group" "web_dmz_firewall_tf" {
    name = "allow https"
    ingress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"] #required input
    }
    egress {
        from_port = 443
        to_port = 443
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"] #required input
    }
  
}

