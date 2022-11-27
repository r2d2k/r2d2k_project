# Define variables
variable "folder_id" {
  type    = string
  default = ""
}

variable "subnet_id" {
  type    = string
  default = ""
}

variable "service_account_key_file" {
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
source "yandex" "image_template" {
  folder_id                = "${var.folder_id}"
  subnet_id                = "${var.subnet_id}"
  source_image_family      = "${var.source_image_family}"
  platform_id              = "standard-v1"
  service_account_key_file = "${path.root}/${var.service_account_key_file}"
  ssh_username             = "${var.username}"
  use_ipv4_nat             = true
}

build {
  source "yandex.image_template" {
    image_family             = "${var.source_image_family}-base"
    image_name               = "${var.source_image_family}-base-${local.timestamp}"
    image_description        = "Created by Packer (clean image)"
  }

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

build {
  source "yandex.image_template" {
    image_family             = "${var.source_image_family}-mongodb"
    image_name               = "${var.source_image_family}-mongodb-${local.timestamp}"
    image_description        = "Created by Packer (clean image + MongoDB)"
  }

  provisioner "shell" {
    pause_before     = "30s" # Pause for apt-get calm down
    inline = [
        "echo debconf debconf/frontend select Noninteractive | sudo debconf-set-selections",
        "sudo apt-get -y update",
        "sudo apt-get -y upgrade",
        "sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release htop tmux mc",
        "sudo apt-get -y install mongodb",
        "sudo apt-get -y autoremove",
        "sudo apt-get -y clean"
    ]
  }
}

build {
  source "yandex.image_template" {
    image_family             = "${var.source_image_family}-rabbitmq"
    image_name               = "${var.source_image_family}-rabbitmq-${local.timestamp}"
    image_description        = "Created by Packer (clean image + RabbitMQ)"
  }

  provisioner "shell" {
    pause_before     = "30s" # Pause for apt-get calm down
    inline = [
        "echo debconf debconf/frontend select Noninteractive | sudo debconf-set-selections",
        "sudo apt-get -y update",
        "sudo apt-get -y upgrade",
        "sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release htop tmux mc",
        "sudo apt-get -y install rabbitmq-server",
        "sudo apt-get -y autoremove",
        "sudo apt-get -y clean"
    ]
  }
}

build {
  source "yandex.image_template" {
    image_family             = "${var.source_image_family}-docker"
    image_name               = "${var.source_image_family}-docker-${local.timestamp}"
    image_description        = "Created by Packer (clean image + Docker)"
  }

  provisioner "shell" {
    pause_before     = "30s"
    inline = [
        #
        "echo debconf debconf/frontend select Noninteractive | sudo debconf-set-selections",
        # Official guide: https://docs.docker.com/engine/install/ubuntu/
        "sudo apt-get -y update",
        "sudo apt-get -y upgrade",
        "sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release htop tmux mc",
        # Setup repo
        "sudo mkdir -p /etc/apt/keyrings",
        "curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg",
        "echo \"deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable\" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null",
        # Update repo
        "sudo apt-get -y update",
        # Install latest docker
        "sudo apt-get -y install docker-ce docker-ce-cli containerd.io docker-compose-plugin mc htop tmux",
        # Cleanup
        "sudo apt-get -y autoremove",
        "sudo apt-get -y clean"
    ]
  }
}

build {
  source "yandex.image_template" {
    image_family             = "${var.source_image_family}-gitlab"
    image_name               = "${var.source_image_family}-gitlab-${local.timestamp}"
    image_description        = "Created by Packer (clean image + Gitlab)"
  }

  provisioner "shell" {
    pause_before     = "30s" # Pause for apt-get calm down
    inline = [
        "echo debconf debconf/frontend select Noninteractive | sudo debconf-set-selections",
        "sudo apt-get -y update",
        "sudo apt-get -y upgrade",
        "sudo apt-get -y install apt-transport-https ca-certificates curl gnupg lsb-release tzdata perl htop tmux mc",
        # Bad, bad thing from https://about.gitlab.com/install/#ubuntu
        "curl https://packages.gitlab.com/install/repositories/gitlab/gitlab-ce/script.deb.sh | sudo bash",
        "sudo apt-get -y install gitlab-ce",
        "sudo apt-get -y autoremove",
        "sudo apt-get -y clean"
    ]
  }
}
