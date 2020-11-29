//include {
//  path = find_in_parent_folders()
//}
//
terraform {
  extra_arguments "common_var" {
    commands  = get_terraform_commands_that_need_vars()
    arguments = [format("-var-file=%s/nexite.auto.tfvars", get_parent_terragrunt_dir())]
  }
}
