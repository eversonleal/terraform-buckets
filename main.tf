terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.35.0"
    }
  }
}

provider "aws" {
  region = "us-east-2"
}

resource "aws_s3_bucket" "buckets" {
  for_each = var.lifecycle_rule
  
  bucket = "${var.bucket_name}-${each.key}"
  acl = "private"
  
  versioning {
    enabled = true
  }
  
  lifecycle_rule {
    id = each.key
    enabled = true
    prefix = "${each.key}/"
    
    transition {
      days = each.value["transition"]
      storage_class = each.value["storage_class"]
    }
  }
}

