module "subnet" {
  source             = "./modules/vpc"
  zone               = var.zone
  ipv4_subnet_blocks = var.ipv4_subnet_blocks
}

module "gate" {
  source             = "./modules/server"
  zone               = var.zone
  folder_id          = var.folder_id
  server_name        = var.vm_gate_name
  cpu_cores          = var.vm_gate_cpu_count
  ram_size           = var.vm_gate_ram_size
  disk_size          = var.vm_gate_disk_size
  disk_image_family  = var.vm_gate_disk_image_family
  external_ip_enable = var.vm_gate_external_ip_enable
  public_key_path    = var.public_key_path
  subnet_id          = module.subnet.vm_subnet_id
}

module "gitlab" {
  source             = "./modules/server"
  zone               = var.zone
  folder_id          = var.folder_id
  server_name        = var.vm_gitlab_name
  cpu_cores          = var.vm_gitlab_cpu_count
  ram_size           = var.vm_gitlab_ram_size
  disk_size          = var.vm_gitlab_disk_size
  disk_image_family  = var.vm_gitlab_disk_image_family
  external_ip_enable = var.vm_gitlab_external_ip_enable
  public_key_path    = var.public_key_path
  subnet_id          = module.subnet.vm_subnet_id
}

module "docker" {
  source             = "./modules/server"
  zone               = var.zone
  folder_id          = var.folder_id
  server_name        = var.vm_docker_name
  cpu_cores          = var.vm_docker_cpu_count
  ram_size           = var.vm_docker_ram_size
  disk_size          = var.vm_docker_disk_size
  disk_image_family  = var.vm_docker_disk_image_family
  external_ip_enable = var.vm_docker_external_ip_enable
  public_key_path    = var.public_key_path
  subnet_id          = module.subnet.vm_subnet_id
}

module "rabbitmq" {
  source             = "./modules/server"
  zone               = var.zone
  folder_id          = var.folder_id
  server_name        = var.vm_rabbitmq_name
  cpu_cores          = var.vm_rabbitmq_cpu_count
  ram_size           = var.vm_rabbitmq_ram_size
  disk_size          = var.vm_rabbitmq_disk_size
  disk_image_family  = var.vm_rabbitmq_disk_image_family
  external_ip_enable = var.vm_rabbitmq_external_ip_enable
  public_key_path    = var.public_key_path
  subnet_id          = module.subnet.vm_subnet_id
}

module "mongodb" {
  source             = "./modules/server"
  zone               = var.zone
  folder_id          = var.folder_id
  server_name        = var.vm_mongodb_name
  cpu_cores          = var.vm_mongodb_cpu_count
  ram_size           = var.vm_mongodb_ram_size
  disk_size          = var.vm_mongodb_disk_size
  disk_image_family  = var.vm_mongodb_disk_image_family
  external_ip_enable = var.vm_mongodb_external_ip_enable
  public_key_path    = var.public_key_path
  subnet_id          = module.subnet.vm_subnet_id
}
