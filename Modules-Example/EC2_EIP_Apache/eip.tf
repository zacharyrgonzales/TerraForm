#create elastic ip once ec2 id is available
resource "aws_eip" "webip" {
  instance = "${aws_instance.moduleEC2web.id}"
}

#output elastic ip address
output "web_ip" {
  value = "${aws_eip.webip.id}"
}
