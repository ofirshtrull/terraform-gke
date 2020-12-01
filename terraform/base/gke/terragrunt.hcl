include {
  path = find_in_parent_folders()
}


//dependencies {
//  paths = [
//    "../vpc",
//    "../service-accounts"
//  ]
//}
dependency "vpc" {
  config_path = "./../vpc"
}
dependency "service-accounts" {
  config_path = "./../service-accounts"
}


terraform {
  extra_arguments "common_var" {
    commands  = get_terraform_commands_that_need_vars()
    arguments = ["-var-file=${get_parent_terragrunt_dir()}/nexite.auto.tfvars"]
  }
}
inputs = {

}
