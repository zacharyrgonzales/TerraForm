module "instances" {
  source = "./ec2"
  server = ["web", "db", "app"]
}

output "Public IPs" {
  value = "${module.instances.public_ip}"
}
