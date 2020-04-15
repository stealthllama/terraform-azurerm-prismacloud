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


output "tenant_id" {
  value       = data.azuread_client_config.azuread_client.tenant_id
  description = "Azure Active Directory ID"
}

output "subscription_id" {
  value       = data.azurerm_client_config.azurerm_client.subscription_id
  description = "Subscription ID"
}

output "application_id" {
  value       = azuread_application.prisma_cloud_app.application_id
  description = "Application ID"
}

output "application_key" {
  value       = random_uuid.app_password.result
  description = "Application Password"
}

output "service_principal_object_id" {
  value       = azuread_service_principal.prisma_cloud_sp.object_id
  description = "Service Principal Password"
}

output "service_principal_password" {
  value       = random_uuid.app_password.result
  description = "Service Principal Password"
}
