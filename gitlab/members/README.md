## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 3.18.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 3.18.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [gitlab_project_membership.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/resources/project_membership) | resource |
| [gitlab_project.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/data-sources/project) | data source |
| [gitlab_user.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/data-sources/user) | data source |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_member_access_level"></a> [member\_access\_level](#input\_member\_access\_level) | The access level for the member. Valid values are: no one, minimal, guest, reporter, developer, maintainer | `string` | n/a | yes |
| <a name="input_member_name"></a> [member\_name](#input\_member\_name) | GitLab user name | `string` | n/a | yes |
| <a name="input_member_project"></a> [member\_project](#input\_member\_project) | Project ID full path | `string` | n/a | yes |
| <a name="input_member_description"></a> [member\_description](#input\_member\_description) | Membership description | `string` | `"null"` | no |
| <a name="input_member_expires_at"></a> [member\_expires\_at](#input\_member\_expires\_at) | Expiration date for the project membership. Format: YYYY-MM-DD | `string` | `null` | no |

## Outputs

No outputs.