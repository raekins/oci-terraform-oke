# Source from https://registry.terraform.io/modules/oracle-terraform-modules/vcn/oci/

module "vcn" {
  source  = "oracle-terraform-modules/vcn/oci"
  #version = "2.3.0"
  # insert the 7 required variables here

  # Required
  compartment_id = var.compartment_ocid
  region         = var.region
  vcn_name       = "tf-vcn"
  vcn_dns_label  = "vcn1"

  # Optional
  internet_gateway_enabled = true
  nat_gateway_enabled = true
  service_gateway_enabled = true
  vcn_cidr = "10.0.0.0/16"
}
