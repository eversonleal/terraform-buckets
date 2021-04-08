# Terraform - Buckets to Store Reports

Terraform module to provide S3 Buckets dynamically

## Installation

Clone this repo

## Usage
1. Setup AWS CLI;
2. Create Terraform variables file "terraform.tfvars" with the below content:

```HCL
bucket_name="reports-store"

lifecycle_rule = {
  hourly = {
    transition = 10,
    storage_class = "STANDARD_IA"
  },
  daily = {
    transition = 30,
    storage_class = "GLACIER"
  },
  weekly = {
    transition = 60,
    storage_class = "DEEP_ARCHIVE"
  }
}
```

The result will be three buckets named as reports-store-[key-name].


2. Run Terraform;

```bash
terraform init
terraform plan
```

3. Check if everything is ok to proceed, then apply;

```bash
terraform apply
```