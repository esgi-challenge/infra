variable "env" {
  type = string
}

variable "project_name" {
  type    = string
  default = "challenge-esgi"
}

variable "subnet_cidr" {
  type    = string
  default = "10.0.0.0/24"
}

variable "subnet_region" {
  type    = string
  default = "europe-west1"
}
