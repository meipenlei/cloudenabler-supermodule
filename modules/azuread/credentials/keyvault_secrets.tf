resource "azurerm_key_vault_secret" "client_id" {
  for_each = {
    for k, v in try(var.settings.keyvaults, {}) : k => v
    if k != "lz_key" && can(v.secret_prefix)
  }

  name         = format("%s-client-id", each.value.secret_prefix)
  key_vault_id = try(var.settings.keyvaults.lz_key, null) == null ? var.keyvaults[var.client_config.landingzone_key][each.key].id : var.keyvaults[var.settings.keyvaults.lz_key][each.key].id

  value = coalesce(
    try(var.resources.application.client_id, null)
  )
}

resource "azurerm_key_vault_secret" "tenant_id" {
  for_each = {
    for k, v in try(var.settings.keyvaults, {}) : k => v
    if k != "lz_key" && can(v.secret_prefix)
  }

  name         = format("%s-tenant-id", each.value.secret_prefix)
  value        = try(each.value.tenant_id, var.client_config.tenant_id)
  key_vault_id = try(var.settings.keyvaults.lz_key, null) == null ? var.keyvaults[var.client_config.landingzone_key][each.key].id : var.keyvaults[var.settings.keyvaults.lz_key][each.key].id
}