terraform {
  backend "s3" {
    bucket                  = "bobby-bones-s3-backend-state"
    key                     = "terraform/tfstate.tfstate"
    shared_credentials_file = "/Users/Zach/.aws/creds"
    region                  = "us-east-1"
  }
}
