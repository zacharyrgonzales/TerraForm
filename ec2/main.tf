#Create E2 t2.micro using ubuntu xenial image
resource "aws_instance" "webserver_ec2_example" {
  ami           = "ami-03e33c1cefd1d3d74"
  instance_type = "t2.micro"

  tags = {
    name        = "ubuntuxenialwebserver"
    description = "web server"
  }
}
