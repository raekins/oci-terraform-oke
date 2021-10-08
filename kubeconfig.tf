data "oci_containerengine_cluster_kube_config" "this" {
  #Required
  cluster_id = oci_containerengine_cluster.oke-cluster.id
}

output "kubeconfig" {
  description = "kubeconfig.yaml"
  value       = data.oci_containerengine_cluster_kube_config.this.content
}
