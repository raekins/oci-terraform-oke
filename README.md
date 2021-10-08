# oci-terraform-oke
Terraform automated build for Oracle Kubernetes Engine (OKE) on Oracle Cloud Infrastructure (OCI)

Copy terraform.tfvars.example to terraform.tfvars

Update terraform.tfvars
```
tenancy_ocid
user_ocid
private_key_path
fingerprint
region
compartment_ocid
source_ocid
kubernetes_version
cluster_name
pool_name
size_in_gbs
```

Initalise Terraform folder
```
% terraform init
```
Validate Terraform syntax
```
% terraform validate
Success! The configuration is valid.
```

Confim Terrafom plan
```
% terraform plan 
```

Apply Terraform update
```
% terraform apply -auto-approve
```
