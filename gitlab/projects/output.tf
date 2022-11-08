output "project_id" {
  description = "The ID of this resource."
  value       = gitlab_project.this.id
}
output "project_path_with_namespace" {
  description = "The path of the repository with namespace."
  value       = gitlab_project.this.path_with_namespace
}
output "project_ssh_url_to_repo" {
  description = "URL that can be provided to git clone to clone the"
  value       = gitlab_project.this.ssh_url_to_repo
}
output "project_web_url" {
  description = "URL that can be used to find the project in a browser."
  value       = gitlab_project.this.web_url
}

output "project_http_url_to_repo" {
  description = "URL that can be provided to git clone to clone the."
  value       = gitlab_project.this.http_url_to_repo
}
