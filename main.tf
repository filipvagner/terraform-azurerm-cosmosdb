resource "azurerm_cosmosdb_account" "this" {
  name                = var.cda_name
  location            = var.cda_location
  resource_group_name = var.cda_rg
  offer_type          = var.cda_offer
  kind                = var.cda_kind

  capabilities {
    name = "EnableServerless"
  }

  consistency_policy {
    consistency_level       = "Session"
    max_interval_in_seconds = 5
    max_staleness_prefix    = 100
  }

  geo_location {
    location          = "North Europe"
    failover_priority = 0
  }

  backup {
    type                = "Periodic"
    interval_in_minutes = 1440
    retention_in_hours  = 48
    storage_redundancy  = "Geo"
  }

  default_identity_type = "FirstPartyIdentity"
}

resource "azurerm_cosmosdb_sql_database" "this" {
  name                = var.cddb_name
  resource_group_name = azurerm_cosmosdb_account.this.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
}

resource "azurerm_cosmosdb_sql_container" "this" {
  name                = var.cdc_name
  resource_group_name = azurerm_cosmosdb_account.this.resource_group_name
  account_name        = azurerm_cosmosdb_account.this.name
  database_name       = azurerm_cosmosdb_sql_database.this.name
  partition_key_path  = "/id"
}