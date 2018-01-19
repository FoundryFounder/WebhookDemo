# SharePoint Webhooks Sample #

### Summary ###
This [Collaboration Foundry](https://www.collaboration-foundry.com) solution provides a simple demonstration of SharePoint webhooks. It includes a two-tier Azure functions architecture, a SharePoint add-in that provides the webhook handler with SharePoint read and update functionality, webhook state management in SharePoint, and Azure Recource Manager Templates for deployment.

### Applies to ###
- Office 365 Multi Tenant (MT).

### Prerequisites ###
- Microsoft Azure account in which to host the webhook functions and over which you are an administrator.
- An Office 365 account and SharePoint site to which the webhook functionality can be attached and over which you are an administrator.
- The SharePoint PnP PowerShell Commands are installed.  See [SharePointPnP.PowerShell Commands](https://github.com/SharePoint/PnP-PowerShell).

### Solution ###
Solution | Author(s)
---------|----------
WebhookDemo| John E. Huschka (**Collaboration Foundry**)

### Version history ###
Version  | Date | Comments
---------| -----| --------
1.0  | August 11th 2016 | Initial release

### Disclaimer ###
**THIS CODE IS PROVIDED *AS IS* WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**

----------

## Deploying this sample #
This solution is deployed in five steps:
1. Register and deploy the SharePoint add-in used by the webhook functions to read and update SharePoint. See [EventsHanderAddIn README.md](EventsHandlerAddIn/README.md).
2.  Deploy the Azure storage account. See [AzureAppStorage README.md](AzureAppStorage/README.md).
3.  Deploy the Azure app service. See [AzureApps README.md](AzureApps/README.md).
4.  Publish the Azure webhook functions. See [AzureFunctions README.md](AzureFunctions/README.md).
5.  Deploy the required SharePoint objects and create the webhook subscription. See [READMESharePointDeployment.md](READMESharePointDeployment.md).
