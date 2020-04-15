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


variable "tenant_id" {
  type        = string
  description = "The Azure tenant ID"
}

variable "subscription_id" {
  type        = string
  description = "The Azure subscription ID"
}

variable "application_password_expiration" {
  type        = string
  default     = "8760h"
  description = "The application password expiration"
}

variable "remediation" {
  type        = bool
  default     = false
  description = "Allow auto-remediation?"
}

# variable "custom_role_permissions" {
#   type = "list"
#   default = [
#     "Microsoft.Network/networkInterfaces/effectiveNetworkSecurityGroups/action",
#     "Microsoft.Network/networkWatchers/securityGroupView/action",
#     "Microsoft.Network/networkWatchers/queryFlowLogStatus/action",
#     "Microsoft.Network/virtualwans/vpnconfiguration/action",
#     "Microsoft.ContainerRegistry/registries/webhooks/getCallbackConfig/action",
#     "Microsoft.Web/sites/config/list/action",
#     "Microsoft.Storage/storageAccounts/*"
#   ]
#   description = "The list of permissions added to the custom role"
# }

variable "readonly_role" {
  type = "list"
  default = [
    "Microsoft.Authorization/locks/read",
    "Microsoft.Authorization/policyAssignments/read",
    "Microsoft.ClassicCompute/domainNames/internalLoadBalancers/read",
    "Microsoft.Compute/availabilitySets/read",
    "Microsoft.Compute/disks/read",
    "Microsoft.Compute/virtualMachines/extensions/read",
    "Microsoft.Compute/virtualMachines/instanceView/read",
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.ContainerRegistry/registries/builds/read",
    "Microsoft.ContainerRegistry/registries/buildTasks/read",
    "Microsoft.ContainerRegistry/registries/read",
    "Microsoft.ContainerRegistry/registries/read",
    "Microsoft.ContainerRegistry/registries/webhooks/getCallbackConfig/action",
    "Microsoft.ContainerService/managedClusters/read",
    "Microsoft.EventHub/namespaces/virtualNetworkRules/read",
    "Microsoft.EventHub/namespaces/virtualNetworkRules/read",
    "Microsoft.Insights/actionGroups/read",
    "Microsoft.Insights/ActivityLogAlerts/Read",
    "Microsoft.Insights/eventtypes/values/Read",
    "Microsoft.Insights/LogProfiles/Read",
    "Microsoft.KeyVault/vaults/read",
    "Microsoft.Network/applicationGatewayAvailableSslOptions/read",
    "Microsoft.Network/applicationGateways/read",
    "Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies/read",
    "Microsoft.Network/connections/read",
    "Microsoft.Network/loadBalancers/read",
    "Microsoft.Network/loadBalancers/read",
    "Microsoft.Network/locations/usages/read",
    "Microsoft.Network/networkInterfaces/effectiveNetworkSecurityGroups/action",
    "Microsoft.Network/networkInterfaces/read",
    "Microsoft.Network/networkSecurityGroups/defaultSecurityRules/read",
    "Microsoft.Network/networkSecurityGroups/read",
    "Microsoft.Network/networkSecurityGroups/read",
    "Microsoft.Network/networkSecurityGroups/securityRules/read",
    "Microsoft.Network/networkWatchers/queryFlowLogStatus/action",
    "Microsoft.Network/networkWatchers/read",
    "Microsoft.Network/networkWatchers/securityGroupView/action",
    "Microsoft.Network/p2sVpnGateways/read",
    "Microsoft.Network/publicIPAddresses/read",
    "Microsoft.Network/virtualNetworkGateways/read",
    "Microsoft.Network/virtualNetworks/read",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualwans/vpnconfiguration/action",
    "Microsoft.Network/vpnGateways/read",
    "microsoft.network/vpnGateways/vpnConnections/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Resources/subscriptions/resourcegroups/resources/read",
    "Microsoft.Security/*/read",
    "Microsoft.Security/pricings/read",
    "Microsoft.Security/securityContacts/read",
    "Microsoft.Sql/managedInstances/databases/read",
    "Microsoft.Sql/managedInstances/databases/securityAlertPolicies/read",
    "Microsoft.Sql/managedInstances/databases/transparentDataEncryption/read",
    "Microsoft.Sql/managedInstances/metrics/read",
    "Microsoft.Sql/managedInstances/read",
    "Microsoft.Sql/managedInstances/securityAlertPolicies/read",
    "Microsoft.Sql/managedInstances/securityAlertPolicies/read",
    "Microsoft.Sql/servers/auditingSettings/read",
    "Microsoft.Sql/servers/databases/auditingPolicies/read",
    "Microsoft.Sql/servers/databases/auditingSettings/read",
    "Microsoft.Sql/servers/databases/read",
    "Microsoft.Sql/servers/databases/securityAlertPolicies/read",
    "Microsoft.Sql/servers/databases/securityAlertPolicies/read",
    "Microsoft.Sql/servers/databases/transparentDataEncryption/read",
    "Microsoft.Sql/servers/read",
    "Microsoft.Sql/servers/securityAlertPolicies/read",
    "Microsoft.Sql/servers/securityAlertPolicies/read",
    "Microsoft.Storage/storageAccounts/listKeys/action",
    "Microsoft.Storage/storageAccounts/queueServices/read",
    "Microsoft.Storage/storageAccounts/read",
    "Microsoft.Storage/storageAccounts/tableServices/read",
    "Microsoft.Web/sites/config/list/action",
    "Microsoft.Web/sites/Read"
  ]
}

variable "readwrite_role" {
  type = "list"
  default = [
    "Microsoft.Authorization/locks/read",
    "Microsoft.Authorization/policyAssignments/read",
    "Microsoft.ClassicCompute/domainNames/internalLoadBalancers/read",
    "Microsoft.Compute/availabilitySets/read",
    "Microsoft.Compute/disks/read",
    "Microsoft.Compute/virtualMachines/extensions/read",
    "Microsoft.Compute/virtualMachines/instanceView/read",
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.Compute/virtualMachines/read",
    "Microsoft.ContainerRegistry/registries/builds/read",
    "Microsoft.ContainerRegistry/registries/buildTasks/read",
    "Microsoft.ContainerRegistry/registries/read",
    "Microsoft.ContainerRegistry/registries/read",
    "Microsoft.ContainerRegistry/registries/webhooks/getCallbackConfig/action",
    "Microsoft.ContainerService/managedClusters/read",
    "Microsoft.EventHub/namespaces/virtualNetworkRules/read",
    "Microsoft.EventHub/namespaces/virtualNetworkRules/read",
    "Microsoft.Insights/actionGroups/read",
    "Microsoft.Insights/ActivityLogAlerts/Read",
    "Microsoft.Insights/eventtypes/values/Read",
    "Microsoft.Insights/LogProfiles/Read",
    "Microsoft.KeyVault/vaults/read",
    "Microsoft.Network/applicationGatewayAvailableSslOptions/read",
    "Microsoft.Network/applicationGateways/read",
    "Microsoft.Network/ApplicationGatewayWebApplicationFirewallPolicies/read",
    "Microsoft.Network/connections/read",
    "Microsoft.Network/loadBalancers/read",
    "Microsoft.Network/loadBalancers/read",
    "Microsoft.Network/locations/usages/read",
    "Microsoft.Network/networkInterfaces/effectiveNetworkSecurityGroups/action",
    "Microsoft.Network/networkInterfaces/read",
    "Microsoft.Network/networkSecurityGroups/defaultSecurityRules/read",
    "Microsoft.Network/networkSecurityGroups/read",
    "Microsoft.Network/networkSecurityGroups/read",
    "Microsoft.Network/networkSecurityGroups/securityRules/read",
    "Microsoft.Network/networkWatchers/queryFlowLogStatus/action",
    "Microsoft.Network/networkWatchers/read",
    "Microsoft.Network/networkWatchers/securityGroupView/action",
    "Microsoft.Network/p2sVpnGateways/read",
    "Microsoft.Network/publicIPAddresses/read",
    "Microsoft.Network/virtualNetworkGateways/read",
    "Microsoft.Network/virtualNetworks/read",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualNetworks/subnets/read",
    "Microsoft.Network/virtualwans/vpnconfiguration/action",
    "Microsoft.Network/vpnGateways/read",
    "microsoft.network/vpnGateways/vpnConnections/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Resources/subscriptions/resourceGroups/read",
    "Microsoft.Resources/subscriptions/resourcegroups/resources/read",
    "Microsoft.Security/*/read",
    "Microsoft.Security/pricings/read",
    "Microsoft.Security/securityContacts/read",
    "Microsoft.Sql/managedInstances/databases/read",
    "Microsoft.Sql/managedInstances/databases/securityAlertPolicies/read",
    "Microsoft.Sql/managedInstances/databases/transparentDataEncryption/read",
    "Microsoft.Sql/managedInstances/metrics/read",
    "Microsoft.Sql/managedInstances/read",
    "Microsoft.Sql/managedInstances/securityAlertPolicies/read",
    "Microsoft.Sql/managedInstances/securityAlertPolicies/read",
    "Microsoft.Sql/servers/auditingSettings/read",
    "Microsoft.Sql/servers/databases/auditingPolicies/read",
    "Microsoft.Sql/servers/databases/auditingSettings/read",
    "Microsoft.Sql/servers/databases/read",
    "Microsoft.Sql/servers/databases/securityAlertPolicies/read",
    "Microsoft.Sql/servers/databases/securityAlertPolicies/read",
    "Microsoft.Sql/servers/databases/transparentDataEncryption/read",
    "Microsoft.Sql/servers/read",
    "Microsoft.Sql/servers/securityAlertPolicies/read",
    "Microsoft.Sql/servers/securityAlertPolicies/read",
    "Microsoft.Storage/storageAccounts/*",
    "Microsoft.Web/sites/config/list/action",
    "Microsoft.Web/sites/Read"
  ]
}
