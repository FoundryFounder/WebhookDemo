<#
   ImportWebHookDemo.ps1
   Imports the WebHookDemo PnP Template into an existing SharePoint site.
   Copyright © 2018 John Huschka, Collaboration Foundry, www.collaboration-foundry.com
   January 10, 2018
#>

#  Make sure you CD to directory in which this is located.
$path = ".\WebHookDemo.xml"
 
#  Update to reflect your SharePoint site.
$webUrl = "https://foundry323.sharepoint.com/sites/WebhookDemo" 
write-host $("Connecting to {0}..." -f $webUrl)

#  Assuming credentials stored for site.
Connect-PnPOnline -Url $webUrl -Credentials WCMStoredCredentials
write-host "Context obtained"
 
# Import template
write-host Importing PnP template...
Set-PnPTraceLog -On -LogFile ImportWebHookDemo.trace.txt -Level Debug
Apply-PnPProvisioningTemplate -Path $path 

Disconnect-PnPOnline
