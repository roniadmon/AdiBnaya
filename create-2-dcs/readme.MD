---
description: This solution creates 2 new Windows VMs, a new AD Forest, Domain and 2 DCs in separate availability zones
page_type: sample
products:
- azure
- azure-resource-manager
urlFragment: vm-domain-join
languages:
- json
- bicep
---
# Deploy a pair of Azure VMs running highly available Active Directory domain controllers

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fadibnaya%2FAzureDevopsTest%2Fmain%2Fcreate-2-dcs%2Fazuredeploy.json)
[![Deploy To Azure US Gov](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazuregov.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fadibnaya%2FAzureDevopsTest%2Fmain%2Fcreate-2-dcs%2Fazuredeploy.json)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fadibnaya%2FAzureDevopsTest%2Fmain%2Fcreate-2-dcs%2Fazuredeploy.json)

This templte creates a pair of azure VMs, creates an AD domain and make the 2 VMs the domain controllers

## Troubleshooting

If the deployment fails with the Conflict error message during deployment of the CustomScriptExtension component, use the following steps to remediate this issue:

In the Azure portal, on the Deployment blade, review the deployment details and identify the VM(s) where the installation of the CustomScriptExtension failed
In the Azure portal, navigate to the blade of the VM(s) you identified in the previous step, select Extensions, and from the Extensions blade, remove the CustomScript extension
Redeploy your bicep template with the same code

`Tags: Microsoft.Storage/storageAccounts, Microsoft.Network/networkInterfaces, Microsoft.Compute/virtualMachines, Microsoft.Compute/virtualMachines/extensions, JsonADDomainExtension, Microsoft.Resources/deployments`
