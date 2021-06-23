# terraform {
#   required_providers {
#     yandex = {
#       source = "yandex-cloud/yandex"
#     }
#   }
# }

resource "yandex_compute_instance" "db" {
  name = "reddit-db-${var.deploy_type}"
  labels = {
    tags = "reddit-db-${var.deploy_type}"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.db_disk_image
    }
  }

  network_interface {
    subnet_id = var.subnet_id
    nat       = true
  }

  metadata = {
    ssh-keys = "${var.ssh_user}:${file(var.public_key_path)}"
  }

  connection {
    type        = "ssh"
    host        = self.network_interface.0.nat_ip_address
    user        = var.ssh_user
    agent       = false
    private_key = file(var.private_key_path)
  }

  provisioner "file" {
    source      = "${var.db_path}/files/mongo_addr.sh"
    destination = "/tmp/script.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/script.sh",
      "sudo /tmp/script.sh ${self.network_interface.0.ip_address}",
    ]
  }
}