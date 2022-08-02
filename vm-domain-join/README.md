---
description: This template demonstrates create 2 servers and join them to a private AD domain on azure.
page_type: sample
products:
- azure
- azure-resource-manager
urlFragment: vm-domain-join
languages:
- json
- bicep
---
# Join a VM to an existing domain

[![Deploy To Azure](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazure.svg?sanitize=true)](https://portal.azure.com/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fadibnaya%2FAzureDevopsTest%2Fmain%2Fvm-domain-join%2Fvm-domain-join.bicep)
[![Deploy To Azure US Gov](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/deploytoazuregov.svg?sanitize=true)](https://portal.azure.us/#create/Microsoft.Template/uri/https%3A%2F%2Fraw.githubusercontent.com%2Fadibnaya%2FAzureDevopsTest%2Fmain%2Fvm-domain-join%2Fvm-domain-join.bicep)
[![Visualize](https://raw.githubusercontent.com/Azure/azure-quickstart-templates/master/1-CONTRIBUTION-GUIDE/images/visualizebutton.svg?sanitize=true)](http://armviz.io/#/?load=https%3A%2F%2Fraw.githubusercontent.com%2Fadibnaya%2FAzureDevopsTest%2Fmain%2Fvm-domain-join%2Fvm-domain-join.bicep)

This template creates 2 member servers and joins the VMs to an existing domain. The template requires a domain controller to already be setup.

## REQUIREMENTS

1. Existing domain controller
2. Deploy to the resource group, VNET and Subnet of the domain controller

`Tags: Microsoft.Storage/storageAccounts, Microsoft.Network/networkInterfaces, Microsoft.Compute/virtualMachines, Microsoft.Compute/virtualMachines/extensions, JsonADDomainExtension, Microsoft.Resources/deployments`
