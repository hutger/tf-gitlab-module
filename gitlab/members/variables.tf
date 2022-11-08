variable "member_name" {
  type = string
}

variable "member_project" {
  type = string
}

variable "member_access_level" {
  type = string
}

variable "member_expires_at" {
  type    = string
  default = null
}

variable "member_description" {
  type    = string
  default = "null"
}
