variable "servers" {
  type = "list"
}

#Create E2 t2.micro using ubuntu xenial image
resource "aws_instance" "webserver_ec2_example" {
  ami           = "ami-03e33c1cefd1d3d74"
  instance_type = "t2.micro"

  #get length of list in servers variable (3 ec2 servers)
  count                       = "${length(var.servers)}"
  associate_public_ip_address = true

  tags = {
    name = "${var.servers[count.index]}"
  }
}

output "public_ip" {
  value = ["${aws_instance.webserver_ec2_example.*.public_ip}"]
}
