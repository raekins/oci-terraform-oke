variable "compartment_ocid" {
  description = "(Required) (Updatable) The OCID of the compartment where to create all resources"
  type        = string
}
variable "user_ocid" {
  type = string
}

variable "tenancy_ocid" {
  type = string
}

variable "fingerprint" {
  type = string
}

variable "private_key_path" {
  type = string
}

variable "region" {
  default = "Europe/London"
  type    = string
}

variable "ad_number" {
  description = "The availability domain number of the instance. If none is provided, it will start with AD-1 and continue in round-robin."
  type        = number
  default     = null
}

variable "worker_size" {
  description = "number of worker nodes to provision"
  default     = 3
  type        = number
}

variable "kubernetes_version" {
  description = "OKE Kubernetes version"
  default     = "v1.20.8"
  type        = string
}

variable "cluster_name" {
  description = "OKE cluster name"
  type        = string
}

variable "node_shape" {
  description = "node shape"
  default     = "VM.Standard2.1"
  type        = string
}

variable "pool_name" {
  description = "node pool name"
  default     = "pool1"
  type        = string
}

variable "source_ocid" {
  description = "source ocid image"
  type        = string
}

variable "size_in_gbs" {
  description = "Sizes of volume to create and attach to each instance."
  type        = number
  default     = 100
}

variable "attachment_type" {
  description = "(Optional) The type of volume. The only supported values are iscsi and paravirtualized."
  type        = string
  default     = "paravirtualized"
}

variable "use_chap" {
  description = "(Applicable when attachment_type=iscsi) Whether to use CHAP authentication for the volume attachment."
  type        = bool
  default     = false
}
