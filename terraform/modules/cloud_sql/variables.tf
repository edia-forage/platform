variable "network" {
  type = "string"
}

variable "instance_name" {
  type    = "string"
  default = "gke-app-private-db"
}

variable "region" {
  type = "string"
}

variable "username" {
  default = "gke"
  type    = "string"
}

variable "password" {
  type = "string"
}

variable "db_name" {
  default     = "gke"
  description = "Database name"
  type        = "string"
}