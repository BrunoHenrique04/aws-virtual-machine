# Root module now composes two child modules: network and vm

module "network" {
  source = "./modules/network"
}

# Keep existing user_data rendering as in current main
data "template_file" "user_data" {
  template = file("./scripts/user_data.sh")
}

module "vm" {
  source             = "./modules/vm"
  subnet_id          = module.network.subnet_id
  security_group_ids = [module.network.security_group_id]
  user_data          = data.template_file.user_data.rendered
  # Keep same values as in original main
  ami           = "ami-0c101f26f147fa7fd"
  instance_type = "t2.micro"
}