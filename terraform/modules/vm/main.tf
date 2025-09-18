# VM MODULE

resource "aws_instance" "instance" {
  ami                    = var.ami
  instance_type          = var.instance_type
  subnet_id              = var.subnet_id
  vpc_security_group_ids = var.security_group_ids
  user_data_base64       = base64encode(var.user_data)

  lifecycle {
    precondition {
      condition     = length(var.security_group_ids) > 0
      error_message = "Ao menos um security group deve ser informado."
    }

    precondition {
      condition     = can(regex("^subnet-", var.subnet_id))
      error_message = "subnet_id inválido."
    }

    precondition {
      condition     = length(var.user_data) <= 16384
      error_message = "user_data excede o limite de 16KB."
    }
  }
}

output "public_dns" {
  value = aws_instance.instance.public_dns
}
