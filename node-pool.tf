# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/containerengine_node_pool

resource "oci_containerengine_node_pool" "oke-node-pool" {
    # Required
    cluster_id         = oci_containerengine_cluster.oke-cluster.id
    compartment_id     = var.compartment_ocid
    kubernetes_version = var.kubernetes_version
    name               = var.pool_name
    node_config_details{
        placement_configs{
            availability_domain = data.oci_identity_availability_domains.ads.availability_domains[0].name
            subnet_id           = oci_core_subnet.vcn-private-subnet.id
        } 
        placement_configs{
            availability_domain = data.oci_identity_availability_domains.ads.availability_domains[1].name
            subnet_id           = oci_core_subnet.vcn-private-subnet.id
        }
         placement_configs{
            availability_domain = data.oci_identity_availability_domains.ads.availability_domains[2].name
            subnet_id           = oci_core_subnet.vcn-private-subnet.id
        }
        size = var.worker_size
    }
    node_shape = var.node_shape

    # Using image Oracle-Linux-7.x-<date>
    # Find image OCID for your region 
    node_source_details {
         image_id    = var.source_ocid
         source_type = "image"
    }
 
    # Optional
    initial_node_labels {
      key   = "px/metadata-node"
      value = "true"
    }
    initial_node_labels {
      key   = "px/enabled"
      value = "true"
    }
    ssh_public_key = file("~/.ssh/id_rsa.pub")
}
