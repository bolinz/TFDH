terraform {
  required_version = ">= 0.13"

  required_providers {
    dockerhub = {
      source  = "magenta-aps/dockerhub"
      version = ">= 0.0.12"
    }
  }
}

provider "dockerhub" {
  # Note: This cannot be a Personal Access Token
  username = var.dockerhub_user # or use DOCKER_USERNAME environment variable
  password = var.dockerhub_token # or use DOCKER_PASSWORD environment variable
}


resource "dockerhub_repository" "example" {
  name             = "example"
  namespace        = "bolinz"
  description      = "Example repository."
  full_description = "Readme."
}