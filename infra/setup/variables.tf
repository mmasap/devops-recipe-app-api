variable "tf_state_bucket" {
  description = "Name of S3 bucket for Terraform state"
  default     = "devops-recipe-app-api-state-mmasap"
}

variable "tf_state_lock_table" {
  description = "Name of DynamoDB table for Terraform state lock"
  default     = "devops-recipe-app-api-tf-lock"
}

variable "project" {
  description = "Project name for tagging resources"
  default     = "recipe-app-api"
}

variable "contact" {
  description = "Contact name for tagging resources"
  default     = "masa@example.com"
}

variable "dns_zone_name" {
  description = "Domain name"
  default     = "mmasap.blog"
}
