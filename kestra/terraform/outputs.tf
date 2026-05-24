output "vm_id" {
  description = "ID der Hetzner VM"
  value       = hcloud_server.kestra_demo.id
}

output "vm_ipv4" {
  description = "Öffentliche IPv4-Adresse der VM"
  value       = hcloud_server.kestra_demo.ipv4_address
}

output "vm_name" {
  description = "Name der VM"
  value       = hcloud_server.kestra_demo.name
}

output "vm_status" {
  description = "Aktueller Status der VM"
  value       = hcloud_server.kestra_demo.status
}
