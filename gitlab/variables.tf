variable "gitlab_projects" {
  type = map(object({
    name                                  = string
    description                           = string
    namespace                             = string
    default_branch                        = string
    mr_approvals_required                 = number
    path                                  = optional(string)
    visibility_level                      = optional(string)
    push_access_level                     = optional(string)
    merge_access_level                    = optional(string)
    unprotect_access_level                = optional(string)
    only_allow_merge_if_pipeline_succeeds = optional(bool)
    allow_merge_on_skipped_pipeline       = optional(bool)
    container_registry_enabled            = optional(bool)
    container_expiration_enabled          = optional(bool)
    remove_source_branch_after_merge      = optional(bool)
    packages_enabled                      = optional(bool)
    pipelines_enabled                     = optional(bool)
    snippets_enabled                      = optional(bool)
    wiki_enabled                          = optional(bool)
  }))
  description = "List of GitLab Projects to be provisioned"
}

variable "gitlab_memberships" {
  type = map(object({
    user         = string
    project      = string
    access_level = string
    expires_at   = optional(string)
    description  = optional(string)
  }))
  description = "Membership association for projects"
}
