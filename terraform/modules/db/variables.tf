variable "public_key_path" {
  description = "Path to the public key used for ssh access"
}
variable "private_key_path" {
  description = "Path to the private key used for ssh access"
}
variable "db_disk_image" {
  description = "Disk image for reddit db"
  default     = "reddit-db-base"
}
variable "subnet_id" {
  description = "Subnets for modules"
}
variable "ssh_user" {
  description = "User for ssh connection"
}

variable "db_path" {
  description = "Path to db folder"
  default     = "/home/vmartinov/Otus/home_work_2/Va-Dick_infra/terraform/modules/db"
}

variable "deploy_type" {
  description = "Prod/Stage"
  default     = "prod"
}