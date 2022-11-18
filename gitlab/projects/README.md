## Requirements

| Name                                                                      | Version  |
| ------------------------------------------------------------------------- | -------- |
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.2.0 |
| <a name="requirement_gitlab"></a> [gitlab](#requirement\_gitlab)          | 3.18.0   |

## Providers

| Name                                                       | Version |
| ---------------------------------------------------------- | ------- |
| <a name="provider_gitlab"></a> [gitlab](#provider\_gitlab) | 3.18.0  |

## Modules

No modules.

## Resources

| Name                                                                                                                                               | Type        |
| -------------------------------------------------------------------------------------------------------------------------------------------------- | ----------- |
| [gitlab_branch_protection.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/resources/branch_protection)                   | resource    |
| [gitlab_project.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/resources/project)                                       | resource    |
| [gitlab_project_approval_rule.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/resources/project_approval_rule)           | resource    |
| [gitlab_project_level_mr_approvals.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/resources/project_level_mr_approvals) | resource    |
| [gitlab_group.this](https://registry.terraform.io/providers/gitlabhq/gitlab/3.18.0/docs/data-sources/group)                                        | data source |

## Inputs

| Name                                                                                                                                                                         | Description                                                                                               | Type     | Default        | Required |
| ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | --------------------------------------------------------------------------------------------------------- | -------- | -------------- |:--------:|
| <a name="input_proj_description"></a> [proj\_description](#input\_proj\_description)                                                                                         | A description of the project.                                                                             | `string` | n/a            | yes      |
| <a name="input_proj_name"></a> [proj\_name](#input\_proj\_name)                                                                                                              | The name of the project. 15 chars limit                                                                   | `string` | n/a            | yes      |
| <a name="input_proj_namespace"></a> [proj\_namespace](#input\_proj\_namespace)                                                                                               | The namespace (group or user) of the project.                                                             | `string` | n/a            | yes      |
| <a name="input_proj_allow_merge_on_skipped_pipeline"></a> [proj\_allow\_merge\_on\_skipped\_pipeline](#input\_proj\_allow\_merge\_on\_skipped\_pipeline)                     | Set to true if you want to treat skipped pipelines as if they finished with success.                      | `bool`   | `true`         | no       |
| <a name="input_proj_container_expiration_cadence"></a> [proj\_container\_expiration\_cadence](#input\_proj\_container\_expiration\_cadence)                                  | The cadence of the policy. Valid values are: 1d, 7d, 14d, 1month, 3month.                                 | `string` | `"1d"`         | no       |
| <a name="input_proj_container_expiration_enabled"></a> [proj\_container\_expiration\_enabled](#input\_proj\_container\_expiration\_enabled)                                  | If true, the policy is enabled.                                                                           | `bool`   | `"true"`       | no       |
| <a name="input_proj_container_expiration_keep_n"></a> [proj\_container\_expiration\_keep\_n](#input\_proj\_container\_expiration\_keep\_n)                                   | The number of images to keep.                                                                             | `number` | `"5"`          | no       |
| <a name="input_proj_container_expiration_older_than"></a> [proj\_container\_expiration\_older\_than](#input\_proj\_container\_expiration\_older\_than)                       | The number of days to keep images.                                                                        | `string` | `"14d"`        | no       |
| <a name="input_proj_container_registry_enabled"></a> [proj\_container\_registry\_enabled](#input\_proj\_container\_registry\_enabled)                                        | Enable container registry for the project.                                                                | `bool`   | `true`         | no       |
| <a name="input_proj_default_branch"></a> [proj\_default\_branch](#input\_proj\_default\_branch)                                                                              | The default branch for the project.                                                                       | `string` | `"main"`       | no       |
| <a name="input_proj_merge_access_level"></a> [proj\_merge\_access\_level](#input\_proj\_merge\_access\_level)                                                                | Access levels allowed to merge. Valid values are: no one, developer, maintainer.                          | `string` | `"maintainer"` | no       |
| <a name="input_proj_mr_approvals_required"></a> [proj\_mr\_approvals\_required](#input\_proj\_mr\_approvals\_required)                                                       | The number of approvals required for this rule.                                                           | `number` | `0`            | no       |
| <a name="input_proj_only_allow_merge_if_pipeline_succeeds"></a> [proj\_only\_allow\_merge\_if\_pipeline\_succeeds](#input\_proj\_only\_allow\_merge\_if\_pipeline\_succeeds) | Set to true if you want allow merges only if a pipeline succeeds.                                         | `bool`   | `true`         | no       |
| <a name="input_proj_packages_enabled"></a> [proj\_packages\_enabled](#input\_proj\_packages\_enabled)                                                                        | Enable packages repository for the project.                                                               | `bool`   | `true`         | no       |
| <a name="input_proj_path"></a> [proj\_path](#input\_proj\_path)                                                                                                              | The path of the repository.                                                                               | `string` | `null`         | no       |
| <a name="input_proj_pipelines_enabled"></a> [proj\_pipelines\_enabled](#input\_proj\_pipelines\_enabled)                                                                     | Enable pipelines for the project.                                                                         | `bool`   | `true`         | no       |
| <a name="input_proj_push_access_level"></a> [proj\_push\_access\_level](#input\_proj\_push\_access\_level)                                                                   | Access levels allowed to push. Valid values are: no one, developer, maintainer.                           | `string` | `"maintainer"` | no       |
| <a name="input_proj_push_author_email_regex"></a> [proj\_push\_author\_email\_regex](#input\_proj\_push\_author\_email\_regex)                                               | All commit author emails must match this regex, e.g. @my-company.com$.                                    | `string` | `null`         | no       |
| <a name="input_proj_push_branch_name_regex"></a> [proj\_push\_branch\_name\_regex](#input\_proj\_push\_branch\_name\_regex)                                                  | All branch names must match this regex, e.g. (feature\|hotfix)                                            | `string` | `null`         | no       |
| <a name="input_proj_push_commit_committer_check"></a> [proj\_push\_commit\_committer\_check](#input\_proj\_push\_commit\_committer\_check)                                   | Users can only push commits to this repository that were committed with one of their own verified emails. | `string` | `true`         | no       |
| <a name="input_proj_push_commit_message_negative_regex"></a> [proj\_push\_commit\_message\_negative\_regex](#input\_proj\_push\_commit\_message\_negative\_regex)            | No commit message is allowed to match this regex, for example                                             | `string` | `null`         | no       |
| <a name="input_proj_push_commit_message_regex"></a> [proj\_push\_commit\_message\_regex](#input\_proj\_push\_commit\_message\_regex)                                         | All commit messages must match this regex, e.g. Fixed                                                     | `string` | `null`         | no       |
| <a name="input_proj_push_deny_delete_tag"></a> [proj\_push\_deny\_delete\_tag](#input\_proj\_push\_deny\_delete\_tag)                                                        | Deny deleting a tag.                                                                                      | `string` | `false`        | no       |
| <a name="input_proj_push_file_name_regex"></a> [proj\_push\_file\_name\_regex](#input\_proj\_push\_file\_name\_regex)                                                        | All commited filenames must not match this regex, e.g. (jar\|exe)$                                        | `string` | `null`         | no       |
| <a name="input_proj_push_max_file_size"></a> [proj\_push\_max\_file\_size](#input\_proj\_push\_max\_file\_size)                                                              | Maximum file size (MB).                                                                                   | `string` | `null`         | no       |
| <a name="input_proj_push_member_check"></a> [proj\_push\_member\_check](#input\_proj\_push\_member\_check)                                                                   | Restrict commits by author (email) to existing GitLab users.                                              | `bool`   | `true`         | no       |
| <a name="input_proj_push_prevent_secrets"></a> [proj\_push\_prevent\_secrets](#input\_proj\_push\_prevent\_secrets)                                                          | GitLab will reject any files that are likely to contain secrets.                                          | `bool`   | `true`         | no       |
| <a name="input_proj_push_reject_unsigned_commits"></a> [proj\_push\_reject\_unsigned\_commits](#input\_proj\_push\_reject\_unsigned\_commits)                                | Reject commit when it’s not signed through GPG.                                                           | `bool`   | `false`        | no       |
| <a name="input_proj_remove_source_branch_after_merge"></a> [proj\_remove\_source\_branch\_after\_merge](#input\_proj\_remove\_source\_branch\_after\_merge)                  | Enable Delete source branch option by default for all new merge requests.                                 | `bool`   | `true`         | no       |
| <a name="input_proj_shared_runners_enabled"></a> [proj\_shared\_runners\_enabled](#input\_proj\_shared\_runners\_enabled)                                                    | Enable shared runners for this project.                                                                   | `bool`   | `true`         | no       |
| <a name="input_proj_snippets_enabled"></a> [proj\_snippets\_enabled](#input\_proj\_snippets\_enabled)                                                                        | Enable snippets for the project.                                                                          | `bool`   | `true`         | no       |
| <a name="input_proj_unprotect_access_level"></a> [proj\_unprotect\_access\_level](#input\_proj\_unprotect\_access\_level)                                                    | Access levels allowed to unprotect. Valid values are: developer, maintainer.                              | `string` | `"maintainer"` | no       |
| <a name="input_proj_visibility_level"></a> [proj\_visibility\_level](#input\_proj\_visibility\_level)                                                                        | Set to public to create a public project.                                                                 | `string` | `"private"`    | no       |
| <a name="input_proj_wiki_enabled"></a> [proj\_wiki\_enabled](#input\_proj\_wiki\_enabled)                                                                                    | Enable wiki for the project.                                                                              | `bool`   | `true`         | no       |

## Outputs

| Name                                                                                                                        | Description                                            |
| --------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------ |
| <a name="output_project_http_url_to_repo"></a> [project\_http\_url\_to\_repo](#output\_project\_http\_url\_to\_repo)        | URL that can be provided to git clone to clone the.    |
| <a name="output_project_id"></a> [project\_id](#output\_project\_id)                                                        | The ID of this resource.                               |
| <a name="output_project_path_with_namespace"></a> [project\_path\_with\_namespace](#output\_project\_path\_with\_namespace) | The path of the repository with namespace.             |
| <a name="output_project_ssh_url_to_repo"></a> [project\_ssh\_url\_to\_repo](#output\_project\_ssh\_url\_to\_repo)           | URL that can be provided to git clone to clone the     |
| <a name="output_project_web_url"></a> [project\_web\_url](#output\_project\_web\_url)                                       | URL that can be used to find the project in a browser. |
