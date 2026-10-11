data "azurerm_netapp_account" "netapp_account_lookup" {
  for_each = var.netapp_account_lookup

  name                = each.value.name
  resource_group_name = each.value.resource_group_name

  dynamic "identity" {
    for_each = each.value.identity != null ? [each.value.identity] : []
    content {
      identity_ids = identity.value.identity_ids
      type         = identity.value.type
    }
  }
}

