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
