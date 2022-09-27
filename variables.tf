variable "cda_name" {
  description = "Cosmos DB account name"
  type        = string
  default     = ""
}

variable "cda_location" {
  description = "Cosmos DB account location"
  type        = string
  default     = ""
}

variable "cda_rg" {
  description = "Cosmos DB account resource group"
  type        = string
  default     = ""
}

variable "cda_offer" {
  description = "Cosmos DB account resource group"
  type        = string
  default     = "Standard"
}

variable "cda_kind" {
  description = "Cosmos DB type of documents"
  type        = string
  default     = "GlobalDocumentDB"
}

variable "cddb_name" {
  description = "Database name in Cosmos DB account"
  type        = string
  default     = ""
}

variable "cdc_name" {
  description = "Container name for items in database in Cosmos DB account"
  type        = string
  default     = ""
}