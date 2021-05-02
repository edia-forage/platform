module "gke" {

    source             = "./modules/gke"

    gke_name_suffix         = "${var.gke_name_suffix}"
    #image_tag       = "${var.commit_hash}"
    #image_tag              = "0a8c32c0a61025f23d3b44d24cf82ce14cb4626c"    
    network_name            = "gke-network"    
    k8s_master_allowed_ip   = "${var.k8s_master_allowed_ip}"
    node_count              = "1"
    machine_type            = "n1-standard-1"

}