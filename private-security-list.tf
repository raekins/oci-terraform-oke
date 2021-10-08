# Source from https://registry.terraform.io/providers/hashicorp/oci/latest/docs/resources/core_security_list

resource "oci_core_security_list" "private-security-list"{

# Required
  compartment_id = var.compartment_ocid
  vcn_id         = module.vcn.vcn_id

# Optional
  display_name = "security-list-for-private-subnet"

  egress_security_rules {
      stateless = false
      destination = "0.0.0.0/0"
      destination_type = "CIDR_BLOCK"
      protocol = "all" 
  }

  ingress_security_rules {
      stateless = false
      source = "10.0.0.0/16"
      source_type = "CIDR_BLOCK"
      description = "Allow pods on one worker node to communicate with pods on other worker nodes"
      protocol = "all" 
  }

  ingress_security_rules { 
      stateless = false
      source = "10.0.0.0/16"
      source_type = "CIDR_BLOCK"
      description = "Allow SSH"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml TCP is 6
      protocol = "6"
      tcp_options { 
          min = 22
          max = 22
      }
    }
  ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
      protocol = "1"
  
      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 3
        code = 4
      } 
    }   
  
  ingress_security_rules { 
      stateless = false
      source = "10.0.0.0/16"
      source_type = "CIDR_BLOCK"
      # Get protocol numbers from https://www.iana.org/assignments/protocol-numbers/protocol-numbers.xhtml ICMP is 1  
      protocol = "1"
  
      # For ICMP type and code see: https://www.iana.org/assignments/icmp-parameters/icmp-parameters.xhtml
      icmp_options {
        type = 3
      } 
    }
  ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      description = "Portworx TCP Ports (9001-9022)"
      # ICMP ("1"), TCP ("6"), UDP ("17"), and ICMPv6 ("58").
      protocol = "6"
      tcp_options {
          min = 9001
          max = 9022
      }
  }
  ingress_security_rules { 
      stateless = false
      source = "0.0.0.0/0"
      source_type = "CIDR_BLOCK"
      description = "Portworx UDP Port 9002"
      # ICMP ("1"), TCP ("6"), UDP ("17"), and ICMPv6 ("58").
      protocol = "17"
      udp_options {
          min = 9002
          max = 9002
      }
  }
}
