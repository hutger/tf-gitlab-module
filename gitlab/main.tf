data "gitlab_group" "this" {
  for_each  = var.gitlab_projects
  full_path = each.value.namespace
}

data "gitlab_user" "this" {
  for_each = var.gitlab_memberships
  username = each.value.user
}

data "gitlab_project_protected_branch" "this" {
  for_each   = var.gitlab_projects
  project_id = "${each.value.namespace}/${each.value.name}"
  name       = each.value.default_branch
}


# Create a project in the example group
resource "gitlab_project" "this" {
  for_each     = var.gitlab_projects
  name         = each.value.name
  description  = each.value.description
  namespace_id = data.gitlab_group.this[each.key].id
  path         = try(each.value.path, each.value.name)

  visibility_level       = try(each.value.visibility_level, "private")
  default_branch         = each.value.default_branch
  initialize_with_readme = true

  only_allow_merge_if_pipeline_succeeds = try(each.value.only_allow_merge_if_pipeline_succeeds, "true")
  allow_merge_on_skipped_pipeline       = try(each.value.allow_merge_on_skipped_pipeline, "false")
  remove_source_branch_after_merge      = try(each.value.allow_merge_on_skipped_pipeline, "true")
  container_registry_enabled            = try(each.value.container_registry_enabled, true)
  packages_enabled                      = try(each.value.packages_enabled, true)
  pipelines_enabled                     = try(each.value.pipelines_enabled, true)
  snippets_enabled                      = try(each.value.snippets_enabled, true)
  wiki_enabled                          = try(each.value.wiki_enabled, true)

  container_expiration_policy {
    enabled    = try(each.value.container_expiration_enabled, true)
    cadence    = "1d"
    older_than = "14d"
  }

}

resource "gitlab_project_level_mr_approvals" "this" {
  for_each                                       = var.gitlab_projects
  project_id                                     = gitlab_project.this[each.key].id
  reset_approvals_on_push                        = true
  disable_overriding_approvers_per_merge_request = false
  merge_requests_author_approval                 = false
  merge_requests_disable_committers_approval     = true
}

resource "gitlab_branch_protection" "this" {
  for_each = var.gitlab_projects
  project  = gitlab_project.this[each.key].id
  branch   = try(each.value.default_branch, "main")

  push_access_level      = try(each.value.push_access_level, "maintainer")
  merge_access_level     = try(each.value.merge_access_level, "maintainer")
  unprotect_access_level = try(each.value.unprotect_access_level, "maintainer")

}

resource "gitlab_project_approval_rule" "any_approver" {
  for_each             = var.gitlab_projects
  project              = gitlab_project.this[each.key].id
  name                 = "Approval Rule"
  rule_type            = "regular"
  approvals_required   = each.value.mr_approvals_required
  protected_branch_ids = [data.gitlab_project_protected_branch.this[each.key].id]
}

resource "gitlab_project_membership" "this" {
  for_each     = var.gitlab_memberships
  project_id   = gitlab_project.this[each.value.project].id
  user_id      = data.gitlab_user.this[each.key].id
  access_level = each.value.access_level
  expires_at   = try(each.value.expires_at, null)
}
