# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/containerengine_cluster

resource "oci_containerengine_cluster" "oke-cluster" {
    # Required
    compartment_id     = var.compartment_ocid
    kubernetes_version = var.kubernetes_version
    name               = var.cluster_name
    vcn_id             = module.vcn.vcn_id

    # Optional
    options {
        add_ons{
            is_kubernetes_dashboard_enabled = true
            is_tiller_enabled               = false
        }
        #kubernetes_network_config {
        #    pods_cidr     = "10.244.0.0/16"
        #    services_cidr = "10.96.0.0/16"
        #}
        service_lb_subnet_ids = [oci_core_subnet.vcn-public-subnet.id]
    }  
}
