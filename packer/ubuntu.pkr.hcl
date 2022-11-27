# Define variables
variable "folder_id" {
  type    = string
  default = ""
}

variable "service_account_key_file" {
  type    = string
  default = ""
}

variable "image_family" {
  type    = string
  default = ""
}

variable "source_image_family" {
  type    = string
  default = ""
}

variable "username" {
  type    = string
  default = ""
}

# Define functions
locals { timestamp = regex_replace(timestamp(), "[- TZ:]", "") }

# Define template
source "yandex" "image" {
  folder_id                = "${var.folder_id}"
  image_family             = "${var.image_family}"
  image_name               = "${var.image_family}-${local.timestamp}"
  platform_id              = "standard-v1"
  service_account_key_file = "${path.root}/${var.service_account_key_file}"
  source_image_family      = "${var.source_image_family}"
  ssh_username             = "${var.username}"
  use_ipv4_nat             = true
}

build {
  sources = ["source.yandex.image"]

  provisioner "shell" {
    pause_before     = "30s" # Pause for apt-get calm down
    inline = [
        "echo debconf debconf/frontend select Noninteractive | sudo debconf-set-selections",
        "sudo apt-get -y update",
        "sudo apt-get -y upgrade",
        "sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release htop tmux mc",
        "sudo apt-get -y autoremove",
        "sudo apt-get -y clean"
    ]
  }
}
