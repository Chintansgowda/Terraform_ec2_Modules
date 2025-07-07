# Modular EC2 Instance Creation with Terraform

This repository contains a modularized Terraform project that provisions multiple EC2 instances on AWS using best practices. It includes the setup of:

- Default VPC
- Security Group with SSH and HTTP access
- EC2 instances using `for_each` loop
- Key pair generation
- User data to install NGINX
- Complete modular structure for reusability

## <h2>Project Structure 

INSTANCE_CREATION/
├── main.tf                  - Module call
├── provider.tf              - AWS credentials
├── variable.tf              - Input variable declarations
├── output.tf                - Root outputs from module
├── terraform.tfvars         - Actual values (DO NOT push this to GitHub)
├── nginx.sh
├── terraform-key.pem
├── terraform-key.pem.pub
├── modules/
│   └── ec2_instance/
│       ├── main.tf          - All EC2, SG, keypair logic
│       ├── variable.tf      - Declares input variables
│       ├── output.tf        - Outputs defined from EC2 resources


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
