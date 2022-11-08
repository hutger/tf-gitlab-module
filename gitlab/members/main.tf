
data "gitlab_project" "this" {
  id = var.member_project
}

data "gitlab_user" "this" {
  username   = var.member_name
  depends_on = [data.gitlab_project.this]
}

resource "gitlab_project_membership" "this" {
  project_id   = data.gitlab_project.this.id
  user_id      = data.gitlab_user.this.id
  access_level = var.member_access_level
  expires_at   = var.member_expires_at
}
