# <tenancy-ocid> is the compartment OCID for the root compartment.
# Use <tenancy-ocid> for the compartment OCID.

data "oci_identity_availability_domains" "ads" {
  compartment_id = var.compartment_ocid
}

locals {
  ADs = [
    // Iterate through data.oci_identity_availability_domains.ads and create a list containing AD names
    for i in data.oci_identity_availability_domains.ads.availability_domains : i.name
  ]
}
