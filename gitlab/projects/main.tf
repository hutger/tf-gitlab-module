data "gitlab_group" "this" {
  full_path = var.proj_namespace
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
  shared_runners_enabled                = var.proj_shared_runners_enabled

  container_expiration_policy {
    enabled    = var.proj_container_expiration_enabled
    cadence    = var.proj_container_expiration_cadence
    older_than = var.proj_container_expiration_older_than
    keep_n     = var.proj_container_expiration_keep_n
  }

  push_rules {
    author_email_regex            = var.proj_push_author_email_regex
    branch_name_regex             = var.proj_push_branch_name_regex
    commit_committer_check        = var.proj_push_commit_committer_check
    commit_message_negative_regex = var.proj_push_commit_message_negative_regex
    commit_message_regex          = var.proj_push_commit_message_regex
    deny_delete_tag               = var.proj_push_deny_delete_tag
    file_name_regex               = var.proj_push_file_name_regex
    max_file_size                 = var.proj_push_max_file_size
    member_check                  = var.proj_push_member_check
    prevent_secrets               = var.proj_push_prevent_secrets
    reject_unsigned_commits       = var.proj_push_reject_unsigned_commits
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
  protected_branch_ids = [gitlab_branch_protection.this.branch_protection_id]
}
