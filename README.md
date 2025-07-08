# Modular EC2 Instance Creation with Terraform

This repository contains a modularized Terraform project that provisions multiple EC2 instances on AWS using best practices. It includes the setup of:

- Default VPC
- Security Group with SSH and HTTP access
- EC2 instances using `for_each` loop
- Key pair generation
- User data to install NGINX
- Complete modular structure for reusability

## <h2>Project Structure 

├── main.tf # Root module invoking ec2_instance module
├── provider.tf # AWS provider configuration
├── variable.tf # Variable declarations at root
├── output.tf # Outputs returned from the module
├── terraform.tfvars # Sensitive variable values (not pushed to GitHub)
├── nginx.sh # Script to install NGINX on EC2 instances
├── terraform-key.pem # SSH private key (ignored)
├── terraform-key.pem.pub # SSH public key (ignored)
└── modules/
└── ec2_instance/
├── main.tf # EC2, security group, key pair, and user data logic
├── variable.tf # Variable declarations for the module
└── output.tf # Outputs from the EC2 resource


## Features

- Launches multiple EC2 instances with different types using a map
- Attaches a key pair to all instances
- Sets up security group allowing SSH (port 22) and HTTP (port 80)
- Installs NGINX using a user data script
- Uses a clean module-based architecture
- Outputs public and private IPs, DNS names, and instance IDs

## Usage

### 1. Clone the Repository
git clone https://github.com/<your-username>/<your-repo-name>.git
cd <your-repo-name>


### 2. Create a `terraform.tfvars` File

Create a `terraform.tfvars` file in the root folder and add your values:


aws_access_key     = "YOUR_ACCESS_KEY"
aws_secret_key     = "YOUR_SECRET_KEY"
aws_region         = "ap-south-1"
ami_id             = "ami-0f918f7e67a3323f0"
instance_type      = "t2.micro"
root_volume_size   = 8
instance_name      = "chintan-terraform-instance"

ec2_instances = {
  dev  = "t2.micro"
  prod = "t2.small"
}


3. Initialize Terraform using terraform init
4. Plan the Infrastructure using terraform plan
5. Apply the Configuration using terraform apply

Outputs:
After apply, the following values are displayed:

EC2 instance IDs

Public IP addresses

Private IP addresses

Public DNS names

Security:
To protect your AWS credentials and private keys:

Never push terraform.tfvars or .pem files to GitHub.

This project uses .gitignore to exclude sensitive files:

terraform.tfvars

*.pem

.terraform/

.terraform.lock.hcl

*.tfstate and backups
