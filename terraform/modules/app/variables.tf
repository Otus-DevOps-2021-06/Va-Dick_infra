variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "app_disk_image" {
  description = "Disk image for reddit app"
  default     = "reddit-app-base"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
variable "ssh_user" {
  description = "User for ssh connection"
}
variable "internal_ip_address_db" {
  description = "Internal ip address db"
}
variable "app_path" {
  description = "Path to db folder"
  default     = "/home/vmartinov/Otus/home_work_2/Va-Dick_infra/terraform/modules/app"
}

variable "deploy_type" {
  description = "Prod/Stage"
  default     = "prod"
}