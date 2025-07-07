variable "aws_access_key"     { type = string }
variable "aws_secret_key"     { type = string }
variable "aws_region"         { type = string }

variable "ami_id"             { type = string }
variable "instance_type"      { type = string }
variable "root_volume_size"   { type = number }
variable "instance_name"      { type = string }
variable "ec2_instances"      { type = map(string) }
