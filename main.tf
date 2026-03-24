terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~>4.5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~>3.0"
    }
  }
}

provider "azurerm" {
  features {}
}

provider "random" {}

# 0. Random string for unique storage account
resource "random_string" "rand" {
  length  = 6
  lower   = true
  upper   = false
  special = false
}

# 1. Resource Group
resource "azurerm_resource_group" "rg" {
  name     = "suraj-rg"
  location = "East US"
}

# 2. Storage Account for Static Website
resource "azurerm_storage_account" "storage" {
  name                     = "surajstorage${random_string.rand.result}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"

  static_website {
    index_document = "index.html"
    error_404_document = "index.html"
  }
}

# 3. Upload index.html
resource "azurerm_storage_blob" "index_file" {
  name                   = "index.html"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = "$web"               # Static website container
  type                   = "Block"
  source                 = "${path.module}/index.html"
  content_type           = "text/html"
}

# 4. Upload style.css
resource "azurerm_storage_blob" "css_file" {
  name                   = "style.css"
  storage_account_name   = azurerm_storage_account.storage.name
  storage_container_name = "$web"
  type                   = "Block"
  source                 = "${path.module}/style.css"
  content_type           = "text/css"
}

# 5. Output URL
output "static_website_url" {
  value = azurerm_storage_account.storage.primary_web_endpoint
}
