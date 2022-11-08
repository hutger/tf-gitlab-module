variable "proj_name" {
  type = string
  validation {
    condition     = length(var.proj_name) <= 15
    error_message = "Names cannot have more than 15 chars of length"
  }
}

variable "proj_description" {
  type = string
}

variable "proj_namespace" {
  type = string
}

variable "proj_default_branch" {
  type    = string
  default = "main"
}

variable "proj_mr_approvals_required" {
  type    = number
  default = 0
}

variable "proj_path" {
  type    = string
  default = null
}

variable "proj_visibility_level" {
  type    = string
  default = "private"
}

variable "proj_push_access_level" {
  type    = string
  default = "maintainer"
}

variable "proj_merge_access_level" {
  type    = string
  default = "maintainer"
}

variable "proj_unprotect_access_level" {
  type    = string
  default = "maintainer"
}

variable "proj_only_allow_merge_if_pipeline_succeeds" {
  type    = bool
  default = true
}

variable "proj_allow_merge_on_skipped_pipeline" {
  type    = bool
  default = true
}

variable "proj_container_registry_enabled" {
  type    = bool
  default = true
}

variable "proj_container_expiration_enabled" {
  type    = bool
  default = true
}

variable "proj_remove_source_branch_after_merge" {
  type    = bool
  default = true
}

variable "proj_packages_enabled" {
  type    = bool
  default = true
}

variable "proj_pipelines_enabled" {
  type    = bool
  default = true
}

variable "proj_snippets_enabled" {
  type    = bool
  default = true
}

variable "proj_wiki_enabled" {
  type    = bool
  default = true
}
