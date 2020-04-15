# Copyright (c) 2020 Palo Alto Networks
#
# Redistribution and use in source and binary forms, with or without modification,
# are permitted provided that the following conditions are met:
#
#    * Redistributions of source code must retain the above copyright
#      notice, this list of conditions and the following disclaimer.
#    * Redistributions in binary form must reproduce the above copyright notice,
#      this list of conditions and the following disclaimer in the documentation
#      and/or other materials provided with the distribution.
#
# THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS" AND
# ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
# WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.
# IN NO EVENT SHALL THE COPYRIGHT HOLDER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT,
# INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
# PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS
# INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
# LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE
# USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.


// Initialize the providers

provider "azuread" {
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
}

provider "azurerm" {
  version         = "=2.0.0"
  subscription_id = var.subscription_id
  tenant_id       = var.tenant_id
  features {}
}

provider "random" {}

locals {
  custom_role         = (var.remediation == true ? var.readwrite_role : var.readonly_role)
  password_expiration = timeadd(timestamp(), var.application_password_expiration)
}

// Setting up an Application & Service Principal

data "azuread_client_config" "azuread_client" {
}

data "azurerm_client_config" "azurerm_client" {
}

resource "random_string" "unique_id" {
  length    = 5
  min_lower = 5
  special   = false
}

resource "random_uuid" "app_password" {}

resource "azuread_application" "prisma_cloud_app" {
  name                       = "Prisma Cloud"
  homepage                   = "https://prismacloud.io/"
  available_to_other_tenants = true
}

resource "azuread_service_principal" "prisma_cloud_sp" {
  application_id = azuread_application.prisma_cloud_app.application_id
}

resource "azuread_application_password" "app_password" {
  application_object_id = azuread_application.prisma_cloud_app.id
  value                 = random_uuid.app_password.result
  end_date              = local.password_expiration
}

# resource "azuread_service_principal_password" "sp_password" {
#   service_principal_id = azuread_service_principal.prisma_cloud_sp.id
#   value                = random_uuid.app_password.result
#   end_date             = local.password_expiration
# }

// Assign the custom role

resource "random_uuid" "custom_role_uuid" {}

resource "azurerm_role_definition" "custom_prisma_role" {
  name               = "prisma-cloud-policy-${random_string.unique_id.result}"
  role_definition_id = random_uuid.custom_role_uuid.result
  scope              = "/subscriptions/${var.subscription_id}"
  description        = "Prisma Cloud custom role created via Terraform"
  assignable_scopes  = ["/subscriptions/${var.subscription_id}"]
  permissions {
    actions     = local.custom_role
    not_actions = []
  }
}

resource "azurerm_role_assignment" "assign_custom_prisma_role" {
  scope              = "/subscriptions/${var.subscription_id}"
  principal_id       = azuread_service_principal.prisma_cloud_sp.id
  role_definition_id = "${azurerm_role_definition.custom_prisma_role.id}"
}

// Not using the built-in role assignments

resource "azurerm_role_assignment" "assign_reader" {
  scope                = "/subscriptions/${var.subscription_id}"
  principal_id         = azuread_service_principal.prisma_cloud_sp.id
  role_definition_name = "Reader"
}

resource "azurerm_role_assignment" "assign_reader_data_access" {
  scope                = "/subscriptions/${var.subscription_id}"
  principal_id         = azuread_service_principal.prisma_cloud_sp.id
  role_definition_name = "Reader and Data Access"
}

# resource "azurerm_role_assignment" "assign_network_contrib" {
#   scope                = "/subscriptions/${var.subscription_id}"
#   principal_id         = azuread_service_principal.prisma_cloud_sp.id
#   role_definition_name = "Network Contributor"
# }

# resource "azurerm_role_assignment" "assign_storage_contrib" {
#   scope                = "/subscriptions/${var.subscription_id}"
#   principal_id         = azuread_service_principal.prisma_cloud_sp.id
#   role_definition_name = "Storage Account Contributor"
#   count                = (var.remediation == true ? 1 : 0)
# }

