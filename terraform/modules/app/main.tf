terraform {
  required_providers {
    yandex = {
      source = "yandex-cloud/yandex"
    }
  }
}

resource "yandex_compute_instance" "app" {
  name = "reddit-app-${var.deploy_type}"
  labels = {
    tags = "reddit-app-${var.deploy_type}"
  }

  resources {
    cores         = 2
    memory        = 2
    core_fraction = 5
  }

  boot_disk {
    initialize_params {
      image_id = var.app_disk_image
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
    source      = "${var.app_path}/files/deploy.sh"
    destination = "/tmp/deploy.sh"
  }

  # provisioner "remote-exec" {
  #   inline = [
  #     "sudo chmod +x /tmp/deploy.sh",
  #     "sudo /tmp/deploy.sh ${var.internal_ip_address_db}",
  #   ]
  # }
}