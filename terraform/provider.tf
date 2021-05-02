provider "google" {
  #credentials       = file(var.credentials_file)
  project           = var.project_id
  region            = var.region
  zone              = var.zone
}

provider "google-beta" {
    project         = var.project_id
    region          = var.region
    zone            = var.zome
}