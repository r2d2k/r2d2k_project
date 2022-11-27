output "external_ip_address_vm_gate" {
  value = module.gate.external_ip_address
}

output "internal_ip_address_vm_gate" {
  value = module.gate.internal_ip_address
}

output "external_ip_address_vm_gitlab" {
  value = module.gitlab.external_ip_address
}

output "internal_ip_address_vm_gitlab" {
  value = module.gitlab.internal_ip_address
}

output "external_ip_address_vm_docker" {
  value = module.docker.external_ip_address
}

output "internal_ip_address_vm_docker" {
  value = module.docker.internal_ip_address
}

output "external_ip_address_vm_rabbit" {
  value = module.rabbit.external_ip_address
}

output "internal_ip_address_vm_rabbit" {
  value = module.rabbit.internal_ip_address
}

output "external_ip_address_vm_mongodb" {
  value = module.mongodb.external_ip_address
}

output "internal_ip_address_vm_mongodb" {
  value = module.mongodb.internal_ip_address
}
