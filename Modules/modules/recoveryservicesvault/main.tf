data "azurerm_resource_group" "this" {
  name  = var.resource_group_name
}

locals {
  tags                       = merge(var.rsv_additional_tags, data.azurerm_resource_group.this.tags)
}

# -
# - Recovery Services Vault
# -
resource "azurerm_recovery_services_vault" "this" {
  for_each            = var.recovery_services_vaults
  name                = each.value["name"]
  resource_group_name = var.resource_group_name
  location            = data.azurerm_resource_group.this.location
  sku                 = coalesce(lookup(each.value, "sku"), "Standard")
  soft_delete_enabled = coalesce(lookup(each.value, "soft_delete_enabled"), true)
  cross_region_restore_enabled = true
  tags                = local.tags
}

# -
# - Azure VM Backup Policy
# -
resource "azurerm_backup_policy_vm" "this" {
  for_each            = var.recovery_services_vaults
  name                = each.value["policy_name"]
  resource_group_name = var.resource_group_name
  recovery_vault_name = azurerm_recovery_services_vault.this[each.key].name

  timezone = "UTC"

  backup {
    frequency = coalesce(lookup(each.value["backup_settings"], "frequency"), "Daily")
    time      = lookup(each.value["backup_settings"], "time")
    weekdays  = coalesce(lookup(each.value["backup_settings"], "frequency"), "Daily") == "Weekly" ? split(",", lookup(each.value["backup_settings"], "weekdays")) : null
  }

  dynamic "retention_daily" {
    for_each = coalesce(lookup(each.value["backup_settings"], "frequency"), "Daily") == "Daily" && each.value["retention_settings"] != null ? tolist([lookup(each.value["retention_settings"], "daily")]) : []
    content {
      count = retention_daily.value
    }
  }

  dynamic "retention_weekly" {
    for_each = coalesce(lookup(each.value["backup_settings"], "frequency"), "Daily") == "Weekly" && each.value["retention_settings"] != null ? tolist([lookup(each.value["retention_settings"], "weekly")]) : []
    content {
      count    = element(split(":", retention_weekly.value), 0)
      weekdays = split(",", element(split(":", retention_weekly.value), 1))
    }
  }

  dynamic "retention_monthly" {
    for_each = each.value["retention_settings"] != null ? (lookup(each.value["retention_settings"], "monthly") != null ? tolist([lookup(each.value["retention_settings"], "monthly")]) : []) : []
    content {
      count    = element(split(":", retention_monthly.value), 0)
      weekdays = split(",", element(split(":", retention_monthly.value), 1))
      weeks    = split(",", element(split(":", retention_monthly.value), 2))
    }
  }

  dynamic "retention_yearly" {
    for_each = each.value["retention_settings"] != null ? (lookup(each.value["retention_settings"], "yearly") != null ? tolist([lookup(each.value["retention_settings"], "yearly")]) : []) : []
    content {
      count    = element(split(":", retention_yearly.value), 0)
      weekdays = split(",", element(split(":", retention_yearly.value), 1))
      weeks    = split(",", element(split(":", retention_yearly.value), 2))
      months   = split(",", element(split(":", retention_yearly.value), 3))
    }
  }

  # lifecycle {
  #   ignore_changes = [tags]
  # }

  # tags = local.tags

  depends_on = [azurerm_recovery_services_vault.this]
}
