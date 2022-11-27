output "external_ip_address" {
  value = yandex_compute_instance.server.network_interface.0.nat_ip_address
}

output "internal_ip_address" {
  value = yandex_compute_instance.server.network_interface.0.ip_address
}
