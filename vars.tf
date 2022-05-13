variable "dockerhub_user" {
  type    = string
  default = "bolinz"
  sensitive = true
  
}
variable "dockerhub_token" {
  type        = string
  description = "description"
  default     = ""
  sensitive   = true
}


