output "cluster_name" {
  value = "${module.gke.cluster_name}"
}

// output "cluster_zone" {
//   value = "${module.gke.cluster_zone}"
// }

output "image_url" {
  value = "${module.gke.image_url}"
}