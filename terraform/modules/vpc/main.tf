resource "yandex_vpc_network" "vm_network" {
}

resource "yandex_vpc_subnet" "vm_subnet" {
  zone           = var.zone
  network_id     = yandex_vpc_network.vm_network.id
  v4_cidr_blocks = var.ipv4_subnet_blocks
}
