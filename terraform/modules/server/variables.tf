variable "zone" {
  description = "Zone for VM creation"
  default     = "ru-central1-a"
}

variable "folder_id" {
  description = "Folder ID for disk image search"
}

variable "server_name" {
  description = "Server name"
  default     = "server"
}

variable "cpu_cores" {
  description = "VM vCPU count"
  default     = 2
}

variable "ram_size" {
  description = "VM RAM size in GB"
  default     = 4
}

variable "disk_image_family" {
  description = "VM disk image family"
}

variable "disk_size" {
  description = "VM disk size in GB"
  default     = 10
}

variable "subnet_id" {
  description = "ID for subnet"
}

variable "external_ip_enable" {
  description = "Add external IP to VM"
  default     = false
}

variable "initial_username" {
  description = "User for initial server setup"
  default     = "ubuntu"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
