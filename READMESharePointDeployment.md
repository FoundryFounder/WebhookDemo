# SharePoint Webhooks SharePoint Component Deployment #

### Summary ###
This SharePoint deployment is part of [Collaboration Foundry's](https://www.collaboration-foundry.com) SharePoint webhook demonstration solution.  It deploys a list to an existing SharePoint site and creates a SharePoint webhook subscription referencing the previously deployed Azure function.

### Applies to ###
- Azure.  Project has been tested with Azure Commercial and Azure Government.

### Prerequisites ###
- All components&mdash;SharePoint add-in, Azure storage and apps service, and Azure webhook functions&mdash;have been successfully deployed.
- The SharePoint PnP PowerShell Commands are installed.  See [SharePointPnP.PowerShell Commands](https://github.com/SharePoint/PnP-PowerShell).
- Credentials for your Office 365 SharePoint site have been registered with the Windows Credential Manager.  See [How to use the Windows Credential Manager to ease authentication with PnP PowerShell](https://github.com/SharePoint/PnP-PowerShell/wiki/How-to-use-the-Windows-Credential-Manager-to-ease-authentication-with-PnP-PowerShell).
- [Windows PowerShell Integrated Scripting Environment (ISE)](https://docs.microsoft.com/en-us/powershell/scripting/getting-started/fundamental/windows-powershell-integrated-scripting-environment--ise-?view=powershell-5.1) is installed.  Technically, only PowerShell (not ISE) is required; however, our illustrations assume the ISE.

----------

## Deployment #
### Step 1: Deploy Lists to Existing SharePoint Site
*  Within the solutions items included here, you will find a *ImportWebHookDemo.ps1* PowerShell script. Open the script in PowerShell ISE.
*  Edit the *$WebUrl* within the script to reflect your SharePoint site address.
*  Run the script.
If the script run successfully, your ISE window should look like
![Deploying Azure webhook SharePoint lists](https://www.collaboration-foundry.com/CFGitImages/PowerShellDeployAzureWebhookLists.png)
and you should see two new lists within your SharePoint site:
![SharePoint lists for webhook](https://www.collaboration-foundry.com/CFGitImages/SharePointDeployedAzureWebhookLists.png)
**Note:**  The deployment only adds two lists to your SharePoint site. No other modifications are made.

### Step 2: Create Webhook Subscription
*  Within the solutions items included here, you will find a *AddWebHookSbuscription.ps1* PowerShell script. Open the script in PowerShell ISE.
*  Edit the *$WebUrl* and *$webHookServiceUrl* within the script to reflect your SharePoint site and Azure app service addresses.
*  Run the script.
If the script run successfully, your ISE window should look like
![Creating SharePoint webhook subscription](https://www.collaboration-foundry.com/CFGitImages/SharePointPowerShellCreateWebhookSubscription.png)
**Note:**  It is not unusual for the subscription creation to fail with an exception such as "System.invalidOperationException" because the subscription creation process is time-sensitive.  If you have a failure, simply verify that you have the script configured correctly (e.g., app service URL, SharePoint web URL) and re-run the script. If you redo an existing subscription, it will not be duplicated in error. You will not end up with multiple subscriptions for the same webhook.
  

