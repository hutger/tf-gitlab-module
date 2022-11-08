<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab) | 3.18.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_members"></a> [members](#module\_members) | git::https://github.com/hutger/tf-gitlab-module.git//gitlab/members | main |
| <a name="module_projects"></a> [projects](#module\_projects) | git::https://github.com/hutger/tf-gitlab-module.git//gitlab/projects | main |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_gitlab_token"></a> [gitlab\_token](#input\_gitlab\_token) | n/a | `string` | n/a | yes |
| <a name="input_member_access_level"></a> [member\_access\_level](#input\_member\_access\_level) | The access level for the member. Valid values are: no one, minimal, guest, reporter, developer, maintainer | `string` | n/a | yes |
| <a name="input_member_description"></a> [member\_description](#input\_member\_description) | Membership description | `string` | `"null"` | no |
| <a name="input_member_expires_at"></a> [member\_expires\_at](#input\_member\_expires\_at) | Expiration date for the project membership. Format: YYYY-MM-DD | `string` | `null` | no |
| <a name="input_member_name"></a> [member\_name](#input\_member\_name) | GitLab user name | `string` | n/a | yes |
| <a name="input_member_project"></a> [member\_project](#input\_member\_project) | Project ID full path | `string` | n/a | yes |
| <a name="input_proj_allow_merge_on_skipped_pipeline"></a> [proj\_allow\_merge\_on\_skipped\_pipeline](#input\_proj\_allow\_merge\_on\_skipped\_pipeline) | Set to true if you want to treat skipped pipelines as if they finished with success. | `bool` | `true` | no |
| <a name="input_proj_container_expiration_enabled"></a> [proj\_container\_expiration\_enabled](#input\_proj\_container\_expiration\_enabled) | If true, the policy is enabled. | `bool` | `true` | no |
| <a name="input_proj_container_registry_enabled"></a> [proj\_container\_registry\_enabled](#input\_proj\_container\_registry\_enabled) | Enable container registry for the project. | `bool` | `true` | no |
| <a name="input_proj_default_branch"></a> [proj\_default\_branch](#input\_proj\_default\_branch) | The default branch for the project. | `string` | `"main"` | no |
| <a name="input_proj_description"></a> [proj\_description](#input\_proj\_description) | A description of the project. | `string` | n/a | yes |
| <a name="input_proj_merge_access_level"></a> [proj\_merge\_access\_level](#input\_proj\_merge\_access\_level) | Access levels allowed to merge. Valid values are: no one, developer, maintainer. | `string` | `"maintainer"` | no |
| <a name="input_proj_mr_approvals_required"></a> [proj\_mr\_approvals\_required](#input\_proj\_mr\_approvals\_required) | The number of approvals required for this rule. | `number` | `0` | no |
| <a name="input_proj_name"></a> [proj\_name](#input\_proj\_name) | The name of the project. 15 chars limit | `string` | n/a | yes |
| <a name="input_proj_namespace"></a> [proj\_namespace](#input\_proj\_namespace) | The namespace (group or user) of the project. | `string` | n/a | yes |
| <a name="input_proj_only_allow_merge_if_pipeline_succeeds"></a> [proj\_only\_allow\_merge\_if\_pipeline\_succeeds](#input\_proj\_only\_allow\_merge\_if\_pipeline\_succeeds) | Set to true if you want allow merges only if a pipeline succeeds. | `bool` | `true` | no |
| <a name="input_proj_packages_enabled"></a> [proj\_packages\_enabled](#input\_proj\_packages\_enabled) | Enable packages repository for the project. | `bool` | `true` | no |
| <a name="input_proj_path"></a> [proj\_path](#input\_proj\_path) | The path of the repository. | `string` | `null` | no |
| <a name="input_proj_pipelines_enabled"></a> [proj\_pipelines\_enabled](#input\_proj\_pipelines\_enabled) | Enable pipelines for the project. | `bool` | `true` | no |
| <a name="input_proj_push_access_level"></a> [proj\_push\_access\_level](#input\_proj\_push\_access\_level) | Access levels allowed to push. Valid values are: no one, developer, maintainer. | `string` | `"maintainer"` | no |
| <a name="input_proj_remove_source_branch_after_merge"></a> [proj\_remove\_source\_branch\_after\_merge](#input\_proj\_remove\_source\_branch\_after\_merge) | Enable Delete source branch option by default for all new merge requests. | `bool` | `true` | no |
| <a name="input_proj_snippets_enabled"></a> [proj\_snippets\_enabled](#input\_proj\_snippets\_enabled) | Enable snippets for the project. | `bool` | `true` | no |
| <a name="input_proj_unprotect_access_level"></a> [proj\_unprotect\_access\_level](#input\_proj\_unprotect\_access\_level) | Access levels allowed to unprotect. Valid values are: developer, maintainer. | `string` | `"maintainer"` | no |
| <a name="input_proj_visibility_level"></a> [proj\_visibility\_level](#input\_proj\_visibility\_level) | Set to public to create a public project. | `string` | `"private"` | no |
| <a name="input_proj_wiki_enabled"></a> [proj\_wiki\_enabled](#input\_proj\_wiki\_enabled) | Enable wiki for the project. | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->