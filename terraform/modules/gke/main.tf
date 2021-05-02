data "google_container_engine_versions" "gke_versions" {}

data "google_project" "project" {}

data "google_container_registry_image" "default" {
    name            = "gke-${var.gke_name_suffix}"
    region          = "asia"
    #tag             = "${var.image_tag}"
}

