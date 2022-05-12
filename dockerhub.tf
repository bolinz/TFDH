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

locals {
  docker_hub_action = compact(toset(split("\n",file("docker_hub_action"))))
}

resource "dockerhub_repository" "example" {
  for_each = local.docker_hub_action
  name             = split(" ",each.value)[2]
  namespace        = "bolinz"
  description      = split(" ",each.value)[1]
  full_description = split(" ",each.value)[1]
}


output reponame {
  value       = local.docker_hub_action
  depends_on  = [local.docker_hub_action]
}
