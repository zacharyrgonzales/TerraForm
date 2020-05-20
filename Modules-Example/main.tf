module "us-east-1" {
  source  = "./EC2_Multi_Region_Example"
  servers = ["web1"]

  providers = {
    aws = aws
  }
}

module "us-west-1" {
  source  = "./EC2_Multi_Region_Example"
  servers = ["web2"]

  providers = {
    aws = aws.us-west-1
  }
}

module "ca-central-1" {
  source  = "./EC2_Multi_Region_Example"
  servers = ["web3"]

  providers = {
    aws = aws.ca-central-1
  }
}

