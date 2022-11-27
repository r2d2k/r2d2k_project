data "yandex_compute_image" "disk_image" {
  folder_id = var.folder_id
  family    = var.disk_image_family
}

resource "yandex_compute_instance" "server" {

  zone = var.zone
  name = var.server_name
  hostname = var.server_name
  description = "Created by Terraform"

  allow_stopping_for_update = true
  resources {
    cores  = var.cpu_cores
    core_fraction = var.core_fraction
    memory = var.ram_size
  }

  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.disk_image.id
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
