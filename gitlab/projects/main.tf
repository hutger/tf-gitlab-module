data "gitlab_group" "this" {
  full_path = var.proj_namespace
}

data "gitlab_project_protected_branch" "this" {
  project_id = "${var.proj_namespace}/${var.proj_name}"
  name       = var.proj_default_branch
  depends_on = [gitlab_project.this]
}

# Create a project in the example group
resource "gitlab_project" "this" {
  name         = var.proj_name
  description  = var.proj_description
  namespace_id = data.gitlab_group.this.id
  path         = var.proj_name

  visibility_level       = var.proj_visibility_level
  default_branch         = var.proj_default_branch
  initialize_with_readme = true

  only_allow_merge_if_pipeline_succeeds = var.proj_only_allow_merge_if_pipeline_succeeds
  allow_merge_on_skipped_pipeline       = var.proj_allow_merge_on_skipped_pipeline
  remove_source_branch_after_merge      = var.proj_remove_source_branch_after_merge
  container_registry_enabled            = var.proj_container_registry_enabled
  packages_enabled                      = var.proj_packages_enabled
  pipelines_enabled                     = var.proj_pipelines_enabled
  snippets_enabled                      = var.proj_snippets_enabled
  wiki_enabled                          = var.proj_wiki_enabled

  container_expiration_policy {
    enabled    = var.proj_container_expiration_enabled
    cadence    = "1d"
    older_than = "14d"
  }

}

resource "gitlab_project_level_mr_approvals" "this" {
  project_id                                     = gitlab_project.this.id
  reset_approvals_on_push                        = true
  disable_overriding_approvers_per_merge_request = false
  merge_requests_author_approval                 = false
  merge_requests_disable_committers_approval     = true
}

resource "gitlab_branch_protection" "this" {
  project = gitlab_project.this.id
  branch  = var.proj_default_branch

  push_access_level      = var.proj_push_access_level
  merge_access_level     = var.proj_merge_access_level
  unprotect_access_level = var.proj_unprotect_access_level
}

resource "gitlab_project_approval_rule" "this" {
  project              = gitlab_project.this.id
  name                 = "Approval Rule"
  rule_type            = "regular"
  approvals_required   = var.proj_mr_approvals_required
  protected_branch_ids = [data.gitlab_project_protected_branch.this.id]
}
