module "subnet" {
  source             = "./modules/vpc"
  zone               = var.zone
  ipv4_subnet_blocks = var.ipv4_subnet_blocks
}

module "gate" {
  source             = "./modules/server"
  zone               = var.zone
  server_name        = var.vm_gate_name
  cpu_cores          = var.vm_gate_cpu_count
  ram_size           = var.vm_gate_ram_size
  disk_size          = var.vm_gate_disk_size
  external_ip_enable = var.vm_gate_external_ip_enable
  public_key_path    = var.public_key_path
  disk_image_id      = var.vm_image_id
  subnet_id          = module.subnet.vm_subnet_id
}
