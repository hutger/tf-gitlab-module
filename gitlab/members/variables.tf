variable "member_name" {
  type        = string
  description = "GitLab user name"
}

variable "member_project" {
  type        = string
  description = "Project ID full path"
}

variable "member_access_level" {
  type        = string
  description = "The access level for the member. Valid values are: no one, minimal, guest, reporter, developer, maintainer"
}

variable "member_expires_at" {
  type        = string
  default     = null
  description = "Expiration date for the project membership. Format: YYYY-MM-DD"
}

variable "member_description" {
  type        = string
  default     = "null"
  description = "Membership description"
}
