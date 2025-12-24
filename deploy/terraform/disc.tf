resource "yandex_compute_disk" "datadisk" {
  name       = "datadisk"
  type       = "network-ssd"
  zone       = "ru-central1-a"
  size       = 300
  block_size = 4096
}
