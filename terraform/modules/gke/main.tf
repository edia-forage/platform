data "google_container_engine_versions" "gke_versions" {}

data "google_project" "project" {}

data "google_container_registry_image" "default" {
    name            = "gke-${var.gke_name_suffix}"
    region          = "asia"
    #tag             = "${var.image_tag}"
}

resource "google_compute_network" "gke_network" {
    provider                = "google"
    name                    = "${var.network_name}"
    auto_create_subnetworks = "false"
}

resource "google_compute_subnetwork" "gke_subnetwork" {
    name                    = "${var.network_name}-subnetwork"
    ip_cidr_range           = "10.2.0.0/16"
    region                  = "${var.region}"
    network                 = "${google_compute_network.gke_network.id}"
}

resource "google_container_cluster" "gke_cluster" {
    #provider                    = "google-beta"
    min_master_version          = "${data.google_container_engine_versions.gke_versions.latest_master_version}"
    name                        = "gke-cluster-${var.gke_name_suffix}"
    network                     = "projects/${data.google_project.project.project_id}/global/networks/${google_compute_network.gke_network.name}"
    subnetwork                  = "${google_compute_subnetwork.gke_subnetwork.self_link}"

    remove_default_node_pool    = "true"

    addons_config {
        http_load_balancing {
            disabled = false 
        }
    }

    private_cluster_config {
        master_ipv4_cidr_block  = "172.16.0.0/28"
        enable_private_nodes    = true
        enable_private_endpoint = true
    }

    ## Disable Basic Auth
    master_auth {
        username    = ""
        password    = ""
    }

    # Kubernetes master's external IP is only accessible from ${var.kubernetes_master_allowed_ip}
    master_authorized_networks_config {
        cidr_blocks {
            cidr_block     = "${var.k8s_master_allowed_ip}/32"
            display_name   = "personal-lenovo"
        }
    }

    #enable_legacy_abac = "true"

    # Enable alias IP addresses https://cloud.google.com/kubernetes-engine/docs/how-to/alias-ips
    ip_allocation_policy {
        cluster_ipv4_cidr_block     = "/14"
        services_ipv4_cidr_block    = "/19"            
    }

    lifecycle {
        ignore_changes          = ["node_pool"]
    }

    node_pool {
        name                    = "default-pool"
    }

}

resource "google_container_node_pool" "gke-pool" {
    provider                    = "google"
    name                        = "gke-pool-${var.gke_name_suffix}"
    cluster                     = "${google_container_cluster.gke_cluster.name}"
    node_count                  = "${var.node_count}"

    management {
        auto_repair = true
        auto_upgrade = true
    }

    node_config {
        oauth_scopes = [
            "https://www.googleapis.com/auth/compute",
            "https://www.googleapis.com/auth/devstorage.read_only",
            "https://www.googleapis.com/auth/logging.write",
            "https://www.googleapis.com/auth/monitoring",
        ]

        disk_size_gb = 10
        machine_type = "${var.machine_type}"
    }
}

