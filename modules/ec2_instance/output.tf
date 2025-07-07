# output "public_ip" {
#   value = aws_instance.example.public_ip    
  
# }

# output "private_ip" {
#   value = aws_instance.example.private_ip    
  
# }

# output "instance_id" {
#   value = aws_instance.example.id
# }

# output "public_dns" {
#     value = aws_instance.example.public_dns
  
# }


# use only if you have multiple instances for the for_each loop
output "instance_ids" {
  description = "IDs of all instances"
  value = [for instance in aws_instance.example : instance.id]
}

output "public_ips" {
  description = "Public IPs of all instances"
  value = [for instance in aws_instance.example : instance.public_ip]
}

output "private_ips" {
  description = "Private IPs of all instances"
  value = [for instance in aws_instance.example : instance.private_ip]
}

output "public_dns_names" {
  description = "Public DNS names of all instances"
  value = [for instance in aws_instance.example : instance.public_dns]
}
