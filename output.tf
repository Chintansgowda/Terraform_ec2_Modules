output "instance_ids" {
  value = module.ec2_instances.instance_ids
}

output "public_ips" {
  value = module.ec2_instances.public_ips
}

output "private_ips" {
  value = module.ec2_instances.private_ips
}

output "public_dns_names" {
  value = module.ec2_instances.public_dns_names
}
