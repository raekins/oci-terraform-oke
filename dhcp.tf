resource "oci_core_dhcp_options" "dhcp-options"{

  # Required
  compartment_id = var.compartment_ocid
  vcn_id         = module.vcn.vcn_id
  #Options for type are either "DomainNameServer" or "SearchDomain"
  options {
      type = "DomainNameServer"  
      server_type = "VcnLocalPlusInternet"
  }
  
  # Optional
  display_name = "default-dhcp-options"
}
