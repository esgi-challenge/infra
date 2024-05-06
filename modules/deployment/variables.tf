variable "env" {
  type = string
}

variable "project_name" {
  type    = string
  default = "challenge-esgi"
}

variable "artifact_url" {
  type = string
}

variable "db_connection" {
  type = string
}

variable "vpc_name" {
  type = string
}

variable "subnet_name" {
  type = string
}

variable "env_variables" {
  # type = list(object({
  #   name  = string
  #   value = string
  # }))
  type = map(string)
}
