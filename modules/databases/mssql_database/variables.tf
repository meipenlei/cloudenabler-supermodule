variable "global_settings" {
  description = "Global settings object (see module README.md)"
  type        = any
}
variable "cloud" {}
variable "location" {}
variable "settings" {
  description = "The settings for the Azure resource."
  type        = any
}
variable "server_id" {}
variable "server_name" {}
variable "storage_accounts" {}
variable "elastic_pool_id" {
  default = null
}
variable "base_tags" {
  description = "Base tags for the resource to be inherited from the resource group."
  type        = map(any)
}
variable "sqlcmd_dbname" {
  default = null
}
variable "managed_identities" {
  default = null
}
variable "diagnostic_profiles" {
  default = {}
}
variable "diagnostics" {
  default = null
}
