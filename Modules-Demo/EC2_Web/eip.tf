
resource "aws_eip" "webip" {
  instance = "${aws_instance.moduleEC2web.id}"
}


output "web_ip" {
  value = "${aws_eip.webip.id}"
}
