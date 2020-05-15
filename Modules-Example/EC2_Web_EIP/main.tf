#input is passed into the ec2name which triggers the ec2 build
variable "ec2webname" {
  type = "string"
}

resource "aws_instance" "moduleEC2web" {
  ami             = "ami-03e33c1cefd1d3d74"
  instance_type   = "t2.micro"
  user_data       = "${file("./EC2_Web/server-script.sh")}"
  security_groups = ["${aws_security_group.allow_http_https.name}"]

  tags = {
    Name = "${var.ec2webname}"
  }
}
