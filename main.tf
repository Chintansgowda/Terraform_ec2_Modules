module "ec2_instances" {
  source = "./modules/ec2_instance"

  aws_access_key     = var.aws_access_key
  aws_secret_key     = var.aws_secret_key
  aws_region         = var.aws_region

  ami_id             = var.ami_id
  instance_type      = var.instance_type
  root_volume_size   = var.root_volume_size
  instance_name      = var.instance_name
  ec2_instances      = var.ec2_instances
}

