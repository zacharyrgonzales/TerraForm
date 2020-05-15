#input is passed into the ec2name which triggers the ec2 build
variable "EC2Wordpressname" {
  type = "string"
}

#create ec2 instance with wordpress script
resource "aws_instance" "moduleEC2Wordpress" {
  ami             = "ami-03e33c1cefd1d3d74"
  instance_type   = "t2.micro"
  user_data       = "${file("./EC2_WordPress/server-script.sh")}"
  security_groups = ["sg-019b5321f6d8d892c"]

  tags = {
    Name = "${var.EC2Wordpressname}"
  }
}
