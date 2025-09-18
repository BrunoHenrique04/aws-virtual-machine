output "ec2_public_url" {
  value       = "http://${module.vm.public_dns}"
  description = "URL público da instância EC2"
}
