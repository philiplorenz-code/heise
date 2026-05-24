provider "hcloud" {
  token = var.hcloud_token
}

# SSH-Key referenzieren (muss vorab in Hetzner hinterlegt sein)
data "hcloud_ssh_key" "default" {
  name = var.ssh_key_name
}

resource "hcloud_server" "kestra_demo" {
  name        = var.vm_name
  image       = "ubuntu-24.04"
  server_type = var.server_type
  location    = var.location
  ssh_keys    = [data.hcloud_ssh_key.default.id]

  public_net {
    ipv4_enabled = true
    ipv6_enabled = false
  }

  labels = {
    managed_by = "terraform"
    env        = "demo"
  }
}
