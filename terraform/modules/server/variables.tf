variable "zone" {
  description = "Zone for VM creation"
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

variable "disk_image_id" {
  description = "VM disk image id"
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
