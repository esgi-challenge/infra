variable "env" {
  type = string
}

variable "project_name" {
  type    = string
  default = "challenge-esgi"
}

variable "vpc_id" {
  type = string
}

variable "vpc_self_link" {
  type = string
}

variable "user" {
  type      = map(string)
  sensitive = true

  default = {
    name     = "admin"
    password = var.password
  }
}

variable "db_tier" {
  type    = string
  default = "db-f1-micro"
}

variable "db_disk_size" {
  type    = number
  default = 10
}
