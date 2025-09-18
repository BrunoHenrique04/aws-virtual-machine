# VM variables

variable "subnet_id" {
  type = string
  validation {
    condition     = length(var.subnet_id) > 0 && can(regex("^subnet-", var.subnet_id))
    error_message = "subnet_id deve ser um ID válido de subnet (ex: subnet-xxxxxxxx)."
  }
}

variable "security_group_ids" {
  type = list(string)
  validation {
    condition     = length(var.security_group_ids) > 0 && alltrue([for id in var.security_group_ids : can(regex("^sg-", id))])
    error_message = "security_group_ids deve conter ao menos um SG válido (ex: sg-xxxxxxxx)."
  }
}

variable "user_data" {
  type      = string
  sensitive = true
  validation {
    condition     = length(var.user_data) <= 16384
    error_message = "user_data deve ter no máximo 16384 bytes (limite da AWS)."
  }
}

variable "ami" {
  type    = string
  default = "ami-0c101f26f147fa7fd"
  validation {
    condition     = can(regex("^ami-[0-9a-f]+$", var.ami))
    error_message = "ami deve ser um ID válido (ex: ami-xxxxxxxxxxxxxxxxx)."
  }
}

variable "instance_type" {
  type    = string
  default = "t2.micro"
  validation {
    condition     = can(regex("^[a-z0-9]+\\.[a-z0-9]+$", var.instance_type))
    error_message = "instance_type deve estar no formato familia.tamanho (ex: t2.micro)."
  }
}
