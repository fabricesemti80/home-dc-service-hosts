provider "proxmox" {
  endpoint = var.proxmox_endpoint
  insecure = var.proxmox_insecure
  username = var.proxmox_username
  password = var.proxmox_password
}
