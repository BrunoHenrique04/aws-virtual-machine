output "vpc_id" {
  value = aws_vpc.vpc.id
}

output "subnet_id" {
  value = aws_subnet.sn_public.id
}

output "security_group_id" {
  value = aws_security_group.sg_public.id
}

output "public_cidr" {
  value = aws_subnet.sn_public.cidr_block
}
