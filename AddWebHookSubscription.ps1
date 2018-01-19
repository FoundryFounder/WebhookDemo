<#
   AddWebHookSubscription.ps1
   Adds a webhook subscription, connecting a designated SharePoint list to a webhook handler.
     PowerShell has been developed under the assumption that the webhook handler is hosted
	  in an Azure App Service function.
   Copyright © 2018 John Huschka, Collaboration Foundry, www.collaboration-foundry.com
   January 10, 2018
#>

#  Update to reflect your SharePoint site.
$webUrl = "https://foundry323.sharepoint.com/sites/WebhookDemo" 
write-host $("Connecting to {0}..." -f $webUrl)

#  Assuming stored credentials.
Connect-PnPOnline -Url $webUrl -Credentials WCMStoredCredentials
write-host "Context obtained"
Set-PnPTraceLog -On -LogFile AddWebHookSubscriptions.Trace.txt -Level Debug

#  Update to reflect your Azure App Service URL.
$webHookServiceUrl = "https://CFWebHookAppServiceDEV.azurewebsites.net/api/WebHookHandler"

$listTitle = "Webhook List"

$list = Get-PnPList $listTitle
$expirationDate = [System.DateTime]::Now.AddDays(1)
$webRequestResults = Add-PnPWebhookSubscription -NotificationUrl $webHookServiceUrl -list $list -ExpirationDate $expirationDate -ClientState "CFWebHookDemo"
write-host "Webhook $($webRequestResults.Id) created"

Disconnect-PnPOnline