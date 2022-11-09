variable "proj_name" {
  type        = string
  description = "The name of the project. 15 chars limit"
  validation {
    condition     = length(var.proj_name) <= 15
    error_message = "Names cannot have more than 15 chars of length"
  }
}

variable "proj_description" {
  type        = string
  description = "A description of the project."
}

variable "proj_namespace" {
  type        = string
  description = "The namespace (group or user) of the project."
}

variable "proj_default_branch" {
  type        = string
  default     = "main"
  description = "The default branch for the project."
}

variable "proj_mr_approvals_required" {
  type        = number
  default     = 0
  description = "The number of approvals required for this rule."
}

variable "proj_path" {
  type        = string
  default     = null
  description = "The path of the repository."
}

variable "proj_visibility_level" {
  type        = string
  default     = "private"
  description = " Set to public to create a public project."
}

variable "proj_push_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to push. Valid values are: no one, developer, maintainer."
}

variable "proj_merge_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to merge. Valid values are: no one, developer, maintainer."
}

variable "proj_unprotect_access_level" {
  type        = string
  default     = "maintainer"
  description = "Access levels allowed to unprotect. Valid values are: developer, maintainer."
}

variable "proj_only_allow_merge_if_pipeline_succeeds" {
  type        = bool
  default     = true
  description = "Set to true if you want allow merges only if a pipeline succeeds."
}

variable "proj_allow_merge_on_skipped_pipeline" {
  type        = bool
  default     = true
  description = "Set to true if you want to treat skipped pipelines as if they finished with success."
}
variable "proj_container_registry_enabled" {
  type        = bool
  default     = true
  description = "Enable container registry for the project."
}

variable "proj_remove_source_branch_after_merge" {
  type        = bool
  default     = true
  description = "Enable Delete source branch option by default for all new merge requests."
}

variable "proj_packages_enabled" {
  type        = bool
  default     = true
  description = "Enable packages repository for the project."
}

variable "proj_pipelines_enabled" {
  type        = bool
  default     = true
  description = "Enable pipelines for the project."
}

variable "proj_snippets_enabled" {
  type        = bool
  default     = true
  description = "Enable snippets for the project."
}

variable "proj_wiki_enabled" {
  type        = bool
  default     = true
  description = "Enable wiki for the project."
}

variable "proj_shared_runners_enabled" {
  type        = bool
  default     = true
  description = "Enable shared runners for this project."
}

variable "proj_container_expiration_enabled" {
  type        = bool
  default     = "true"
  description = "If true, the policy is enabled."
}

variable "proj_container_expiration_cadence" {
  type        = string
  default     = "1d"
  description = "The cadence of the policy. Valid values are: 1d, 7d, 14d, 1month, 3month."
}
variable "proj_container_expiration_older_than" {
  type        = string
  default     = "14d"
  description = "The number of days to keep images."
}

variable "proj_container_expiration_keep_n" {
  type        = number
  default     = "5"
  description = "The number of images to keep."
}







variable "proj_push_author_email_regex" {
  type        = string
  default     = null
  description = "All commit author emails must match this regex, e.g. @my-company.com$."
}
variable "proj_push_branch_name_regex" {
  type        = string
  default     = null
  description = "All branch names must match this regex, e.g. (feature|hotfix)"
}

variable "proj_push_commit_committer_check" {
  type        = string
  default     = true
  description = "Users can only push commits to this repository that were committed with one of their own verified emails."
}



variable "proj_push_commit_message_negative_regex" {
  type        = string
  default     = null
  description = "No commit message is allowed to match this regex, for example "
}

variable "proj_push_commit_message_regex" {
  type        = string
  default     = null
  description = "All commit messages must match this regex, e.g. Fixed"
}

variable "proj_push_deny_delete_tag" {
  type        = string
  default     = false
  description = "Deny deleting a tag."
}


proj_push_reject_unsigned_commits (Boolean)



variable "proj_push_file_name_regex" {
  type        = string
  default     = null
  description = "All commited filenames must not match this regex, e.g. (jar|exe)$"
}

variable "proj_push_max_file_size" {
  type        = string
  default     = null
  description = "Maximum file size (MB)."
}

variable "proj_push_member_check" {
  type        = bool
  default     = true
  description = "Restrict commits by author (email) to existing GitLab users."
}

variable "proj_push_prevent_secrets" {
  type        = bool
  default     = true
  description = "GitLab will reject any files that are likely to contain secrets."
}

variable "proj_push_reject_unsigned_commits" {
  type        = bool
  default     = false
  description = "Reject commit when it’s not signed through GPG."
}
