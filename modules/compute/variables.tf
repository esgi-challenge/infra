variable "env" {
  type = string
}

variable "project_name" {
  type    = string
  default = "challenge-esgi"
}

variable "ssh_ip_allowed" {
  type    = list(string)
  default = ["0.0.0.0/0"]
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "zone" {
  type = string
}

variable "machine_type" {
  type    = string
  default = "e2-micro"
}
