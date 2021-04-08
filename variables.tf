variable "bucket_name" {
  type = string
}

variable "lifecycle_rule" {
  type = map(object({
    transition = number
    storage_class = string
  }))
}