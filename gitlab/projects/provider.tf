terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.18.0"
    }
  }
  required_version = ">= 1.2.0"
}
