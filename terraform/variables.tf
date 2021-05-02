variable "project_id" { 
    default = "neon-polymer-366"
}

variable "credentials_file" { 
    default = "sa-terraform.json"
}

variable "region" {
  default = "asia-south1"
}

variable "zone" {
  default = "asia-south1-a"
}

// variable "commit_hash" {
//   description = "Git commit hash, e.g. '0a8c32c0a61025f23d3b44d24cf82ce14cb4626c'"
//   type        = "string"
//   default     = "0a8c32c0a61025f23d3b44d24cf82ce14cb4626c"
// }

variable "gke_name_suffix" {
    type        = "string"
}