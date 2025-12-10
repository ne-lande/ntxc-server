variable "zone" {
  type        = string
  default     = "ru-central1-b"
  nullable    = false
}

variable "ssh-key" {
  type        = string
  nullable    = false
}

variable "image-id" {
    type = string
    default = "fd81gsj7pb9oi8ks3cvo"
    nullable = false
}
