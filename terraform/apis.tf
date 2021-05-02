resource "google_project_service" "service" {
    for_each = toset([
        "cloudresourcemanager.googleapis.com",
        "compute.googleapis.com",
        "container.googleapis.com",
        "containerregistry.googleapis.com",
        #"dns.googleapis.com",
        "servicenetworking.googleapis.com",
        "sqladmin.googleapis.com"
    ])

    service            = each.key
    project            = var.project_id

    disable_on_destroy = false
}