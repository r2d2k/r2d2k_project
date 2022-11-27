resource "yandex_compute_instance" "server" {

  zone = var.zone
  name = var.server_name
  hostname = var.server_name

  resources {
    cores  = var.cpu_cores
    memory = var.ram_size
  }

  boot_disk {
    initialize_params {
      image_id = var.disk_image_id
      size     = var.disk_size
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = var.external_ip_enable
  }

  metadata = {
    ssh-keys = "${var.initial_username}:${file(var.public_key_path)}"
  }
}
