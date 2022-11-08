# Setting provider
terraform {
  required_providers {
    gitlab = {
      source  = "gitlabhq/gitlab"
      version = "3.18.0"
    }
  }
  required_version = ">= 1.2.0"

  backend "http" {}
}

provider "gitlab" {
  token = var.gitlab_token
}

#----
# Declaring base variables

variable "gitlab_token" {
  type = string
}

locals {
  config = yamldecode(file("./config.yaml"))
}

#----
# Resources definitions
module "projects" {
  source = "git::https://github.com/hutger/tf-gitlab-module.git//gitlab/projects?ref=main"

  for_each = { for x in local.config.gitlab_projects : x.name => x }

  proj_name                                  = each.value.name
  proj_description                           = each.value.description
  proj_namespace                             = each.value.namespace
  proj_default_branch                        = each.value.default_branch
  proj_mr_approvals_required                 = each.value.mr_approvals_required
  proj_path                                  = try(each.value.path, null)
  proj_visibility_level                      = try(each.value.visibility_level, null)
  proj_push_access_level                     = try(each.value.push_access_level, null)
  proj_merge_access_level                    = try(each.value.merge_access_level, null)
  proj_unprotect_access_level                = try(each.value.unprotect_access_level, null)
  proj_only_allow_merge_if_pipeline_succeeds = try(each.value.only_allow_merge_if_pipeline_succeeds, null)
  proj_allow_merge_on_skipped_pipeline       = try(each.value.allow_merge_on_skipped_pipeline, null)
  proj_container_registry_enabled            = try(each.value.container_registry_enabled, null)
  proj_container_expiration_enabled          = try(each.value.container_expiration_enabled, null)
  proj_remove_source_branch_after_merge      = try(each.value.remove_source_branch_after_merge, null)
  proj_packages_enabled                      = try(each.value.packages_enabled, null)
  proj_pipelines_enabled                     = try(each.value.pipelines_enabled, null)
  proj_snippets_enabled                      = try(each.value.snippets_enabled, null)
  proj_wiki_enabled                          = try(each.value.wiki_enabled, null)
}

module "members" {
  source     = "git::https://github.com/hutger/tf-gitlab-module.git//gitlab/members?ref=main"
  depends_on = [module.projects]

  for_each            = { for x in local.config.gitlab_members : "${x.project}-${x.name}" => x }
  member_name         = each.value.name
  member_project      = each.value.project
  member_access_level = each.value.access_level
  member_expires_at   = try(each.value.expires_at, null)
  member_description  = try(each.value.description, null)
}
