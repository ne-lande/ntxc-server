data "yandex_compute_image" "container-optimized-image" {
  family = "container-optimized-image"
}

resource "yandex_compute_instance" "mc" {
  name = "minecraft"
  boot_disk {
    initialize_params {
      image_id = data.yandex_compute_image.container-optimized-image.id
    }
  }

  resources {
    cores  = 32
    memory = 32
  }

  network_interface {
    subnet_id = yandex_vpc_subnet.subnet-1.id
    nat       = true
  }

  metadata = {
    docker-compose = file("${path.module}/compose.yml")
    user-data      = file("${path.module}/cloud-config.yml")
  }

  secondary_disk {
    disk_id     = yandex_compute_disk.datadisk.id
    device_name = "datadisk"
  }
}
