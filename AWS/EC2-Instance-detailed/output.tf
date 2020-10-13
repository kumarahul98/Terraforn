output "public_ip" {
  description = "public IP addresses"
  value       = aws_instance.instance1.public_ip
}

// output "security_groups" {
//   description = "List of associated security groups of instance"
//   value       = aws_instance.instance1.vpc_security_group_ids
// }

