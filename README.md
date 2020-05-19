# Terraform Scripts
Terraform is a tool that simplifies the underlying complexity for building, changing, and versioning infrastructure. 

## Getting Started
Create an AWS account, go to console management then IAM, create a new user account with administrator privilages and save the AWS Access Key ID and Secret Access Key for later use.

Install Git and add to path:
```
https://git-scm.com/downloads
```

Install visual studio code and add to path:
```
https://code.visualstudio.com/
```

Open Visual Studio code and select:
```
Terminal > New Terminal Window
```

To clone the project on your local machine please run the following in a terminal using git:
```bash
git clone https://github.com/zacharyrgonzales/TerraForm.git
```

See deployment for notes on how to deploy the project on a live system.

### Prerequisites

What things you need to install the software and how to install them
```
Terraform 11.14
AWS CLI
VSCode
Git
```

### Installing Terraform

Install Terraform on Ubuntu, OS X, or Windows and add to path:
```
https://releases.hashicorp.com/terraform/0.11.14/
```
Verify that Terraform accepts commands:
```
terraform --version
```
You should the terraform version number as a result if installed correctly and added to path:
```
Terraform v0.11.14
```
### Installing AWS CLI

Install AWS CLI on Ubuntu, OS X, or Windows and add to path:
```
https://aws.amazon.com/cli/
```
Verify that AWS CLI accepts commands:
```
aws --version
```
You should the aws cli version number as a result if installed correctly and added to path:
```
aws-cli/1.14.44 Python/3.6.9 Linux/5.3.0-51-generic botocore/1.8.48
```

## Configure AWS

Login to your account using the CLI:
```
aws configure
```
Enter in your AWS Access Key ID and Secret Access Key. Leave region and output format default (blank):
```
AWS Access Key ID [****************]: ACCESS_KEY_ID
AWS Secret Access Key[****************]: SECRET_ACCESS_KEY
Default region name [us-east-1]: 
Default output format [None]: 
```

### Terraform Init

the ```terraform init``` command performs several different initialization steps in order to prepare a working directory for use. More details in the [link provided](https://www.terraform.io/docs/commands/init.html#usage), but in most cases it is not necessary to worry about these individual steps.

Change directory to the Modules-Example folder:
```
cd Modules-Example
```
Initialize terraform (initialzes modules and provider plugs):
```
terraform init
```
You should see:
```
Terraform has been successfully initialized!
```

### Terraform Plan

The ```terraform plan``` command is used to create an execution plan. Terraform performs a refresh, unless explicitly disabled, and then determines what actions are necessary to achieve the desired state specified in the configuration files.

Apply terraform:
```
terraform apply
```
Then type in ```yes``` and select enter.

You can also use the following to skip approval:
```
terraform apply -auto-approve
```

## Terraform Destroy

The ```terraform destroy``` command is used to destroy the Terraform-managed infrastructure.

## Built With

* [Dropwizard](http://www.dropwizard.io/1.0.2/docs/) - The web framework used
* [Maven](https://maven.apache.org/) - Dependency Management
* [ROME](https://rometools.github.io/rome/) - Used to generate RSS Feeds

## Contributing

Please read [CONTRIBUTING.md](https://gist.github.com/PurpleBooth/b24679402957c63ec426) for details on our code of conduct, and the process for submitting pull requests to us.

## Versioning

We use [SemVer](http://semver.org/) for versioning. For the versions available, see the [tags on this repository](https://github.com/your/project/tags). 

## Authors

* **Zachary Gonzales** - *Writer/Engineer* - [Connect on LinkedIn](https://www.linkedin.com/in/zrg/)

See also the [kanban board](https://github.com/zacharyrgonzales/TerraForm/projects/1)

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* I started using Terraform while studying for AWS Solutions Architect exam I found it helpful to do apply a structured learning pattern that consisted of watching, trying, and educating others to help solidify my assumptions around Cloud/DevOps tools and culture. As a result it helped me become a better technologist by not only learning the tools and culture but by also giving back to the community by explaining technology in layman's terms. Therefore I hope these Terraform scripts provide value. If you have any questions please reach me on Linked in at https://www.linkedin.com/in/zrg/.


## Resources
* [Terraform Commands (CLI)](https://www.terraform.io/docs/commands/index.html)
* [Terraform Multi-Region Deployment using Modules](https://medium.com/johnveldboom/terraform-multi-region-deployment-using-modules-4f94d7833b52)
* [GET THE LATEST AWS AMI IDS WITH TERRAFORM](https://letslearndevops.com/2018/08/23/terraform-get-latest-centos-ami/)
