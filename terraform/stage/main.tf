module "consul" {
  source = "../modules"
}

# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
#   backend "s3" {
#     endpoint                    = "storage.yandexcloud.net"
#     bucket                      = "terraform-backend"
#     region                      = "ru-central1"
#     access_key                  = "123"
#     secret_key                  = "123"
#     key                         = "prod/terraform.tfstate"
#     skip_region_validation      = true
#     skip_credentials_validation = true
#   }
# }

provider "yandex" {
  service_account_key_file = var.service_account_key_file
  cloud_id                 = var.cloud_id
  folder_id                = var.folder_id
  zone                     = var.zone
}

module "vpc" {
  source      = "../modules/vpc"
  zone        = var.zone
  deploy_type = var.deploy_type
}

module "app" {
  source                 = "../modules/app"
  public_key_path        = var.public_key_path
  app_disk_image         = var.app_disk_image
  private_key_path       = var.private_key_path
  ssh_user               = var.ssh_user
  internal_ip_address_db = module.db.internal_ip_address_db
  subnet_id              = module.vpc.subnet_id
  deploy_type            = var.deploy_type
  # depends_on = [
  #   module.db
  # ]
}

module "db" {
  source           = "../modules/db"
  public_key_path  = var.public_key_path
  db_disk_image    = var.db_disk_image
  private_key_path = var.private_key_path
  ssh_user         = var.ssh_user
  subnet_id        = module.vpc.subnet_id
  deploy_type      = var.deploy_type
  # depends_on = [
  #   module.vpc
  # ]
}