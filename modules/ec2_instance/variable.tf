variable "aws_access_key" {
    description = "AWS Access Key"
    type        = string
    sensitive   = true
  
}

variable "aws_secret_key" {
    description = "AWS Secret Key"
    type        = string
    sensitive   = true
  
}

variable "aws_region" {
    description = "AWS Region"
    type        = string
    default     = "us-east-1"
  
}
 variable "ami_id" {
    description = "AMI ID for the instance"
    type        = string
    default     = "ami-020cba7c55df1f615" # Example AMI ID, replace with a valid one for your region    
   
}

variable "instance_type" {
    description = "Instance type"
    type        = string
    default     = "t2.micro" # Example instance type, can be changed as needed
  
}

variable "root_volume_size" {
    description = "Root volume size in GB"
    type        = number
    default     = 8 # Default root volume size, can be adjusted
  
}

variable "instance_name" {
    description = "Name of the instance"
    type        = string
    default     = "eg-terra-instance" # Default name for the instance
  
}


# Variable to define multiple EC2 instances with their types for a for_each loop
variable "ec2_instances" {
  description = "Map of EC2 instance names to their types"
  type        = map(string)
  default = {
    instance1 = "t2.micro"
    instance2 = "t2.small"
  }
}

