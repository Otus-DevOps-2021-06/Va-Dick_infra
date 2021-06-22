variable "service_account_key_file" {
  description = "key .json"
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

variable "subnet_id" {
  description = "Subnet ID"
}

variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}

variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}

variable "ssh_user" {
  description = "User for ssh connection"
}

variable "app_disk_image" {
  description = "Disk image for reddit app"
}

variable "db_disk_image" {
  description = "Disk image for reddit db"
}

variable "deploy_type" {
  description = "Prod/Stage"
}