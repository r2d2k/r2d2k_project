variable "service_account_key_file" {
  description = "Path to service account key file"
}

variable "cloud_id" {
  description = "Cloud"
}

variable "folder_id" {
  description = "Folder"
}

variable "zone" {
  description = "Zone"
  default     = "ru-central1-a"
}

variable "vm_image_id" {
  description = "Base image id for VM"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "ipv4_subnet_blocks" {
  description = "Address blocks for VM subnet"
}


# VM gate
variable "vm_gate_name" {
}
variable "vm_gate_cpu_count" {
}
variable "vm_gate_ram_size" {
}
variable "vm_gate_disk_size" {
}
variable "vm_gate_external_ip_enable" {
}

# VM gitlab
variable "vm_gitlab_name" {
}
variable "vm_gitlab_cpu_count" {
}
variable "vm_gitlab_ram_size" {
}
variable "vm_gitlab_disk_size" {
}
variable "vm_gitlab_external_ip_enable" {
}

# VM docker
variable "vm_docker_name" {
}
variable "vm_docker_cpu_count" {
}
variable "vm_docker_ram_size" {
}
variable "vm_docker_disk_size" {
}
variable "vm_docker_external_ip_enable" {
}

# VM rabbit
variable "vm_rabbit_name" {
}
variable "vm_rabbit_cpu_count" {
}
variable "vm_rabbit_ram_size" {
}
variable "vm_rabbit_disk_size" {
}
variable "vm_rabbit_external_ip_enable" {
}

# VM mongodb
variable "vm_mongodb_name" {
}
variable "vm_mongodb_cpu_count" {
}
variable "vm_mongodb_ram_size" {
}
variable "vm_mongodb_disk_size" {
}
variable "vm_mongodb_external_ip_enable" {
}
