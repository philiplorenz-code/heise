variable "hcloud_token" {
  description = "Hetzner Cloud API Token (Read & Write). Wird über TF_VAR_hcloud_token oder .tfvars gesetzt."
  type        = string
  sensitive   = true
}

variable "vm_name" {
  description = "Name der Hetzner VM"
  type        = string
  default     = "kestra-demo-vm"
}

variable "server_type" {
  description = "Hetzner Server-Typ. cx23 = 2 vCPU, 4 GB RAM, ~4 €/Monat (Nachfolger von cx22)"
  type        = string
  default     = "cx23"
}

variable "location" {
  description = "Hetzner Rechenzentrum-Standort"
  type        = string
  default     = "nbg1"
}

variable "ssh_key_name" {
  description = "Name eines bereits in Hetzner hinterlegten SSH-Keys"
  type        = string
}
