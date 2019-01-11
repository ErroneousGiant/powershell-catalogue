$apps = Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -match "Microsoft.Office" -or $_.PackageName -match "Microsoft.MicrosoftOfficeHub"}

if ($apps.length -gt 0)
{
    foreach ($app in $apps)
    {
        Remove-AppxProvisionedPackage -Online -PackageName $app.PackageName
    }
}

$apps = Get-AppxPackage | Where-Object {$_.Name -match "Microsoft.Office" -or $_.PackageName -match "Microsoft.MicrosoftOfficeHub"}

if ($apps.length -gt 0)
{
    foreach ($app in $apps)
    {
        Remove-AppxPackage -Package $app.PackageFullName
    }
}

##Remove Current installs on all users.-all users removes the application from all current users.
Get-AppxPackage -allusers *OneNote* | Remove-AppxPackage
Get-AppxPackage -allusers *Xbox* | Remove-AppxPackage
Get-AppxPackage -allusers *Office* | Remove-AppxPackage
##Define Vairiable and load package names
$Applist = Get-AppXProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*OneNote*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*XboxApp*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*xbox*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*MicrosoftOfficeHub*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*OneNote*"} | Remove-AppxProvisionedPackage –online
$Applist = Get-AppXProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*3DBuilder*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*BingFinance*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*BingNews*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*BingSports*"} | Remove-AppxProvisionedPackage -online
$Applist = Get-AppXProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*ConnectivityStore*"} | Remove-AppxProvisionedPackage -online
$Applist = Get-AppXProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*MicrosoftOfficeHub*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*MicrosoftSolitaireCollection*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*OneNote*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*Sway*"} | Remove-AppxProvisionedPackage -online
$Applist = Get-AppXProvisionedPackage -online
$Applist = Get-AppXProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*WindowsMaps*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*XboxApp*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*ZuneMusic*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*ZuneVideo*"} | Remove-AppxProvisionedPackage -online
$Applist | WHere-Object {$_.packagename -like "*xbox*"} | Remove-AppxProvisionedPackage -online
##Ones that are giving issue when ran in line with other package removals
Get-appxpackage -allusers *Microsoft.BingWeather* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*BingWeather*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.3dbuilder* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*3dbuilder*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *AdobeSystemsIncorporated.AdobePhotoshopExpress* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*AdobeSystemsIncorporated.AdobePhotoshopExpress*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.Asphalt8Airborne* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Asphalt*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *king.com.CandyCrushSodaSaga* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*CandyCrushSodaSaga*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.DrawboardPDF* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.Drawboard*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Facebook* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Facebook*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *BethesdaSoftworks.FalloutShelter* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*BethesdaSoftworks.FalloutShelter*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *FarmVille2CountryEscape* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*FarmVille2CountryEscape*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.WindowsFeedbackHub* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.WindowsFeedbackHub*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.ZuneMusic* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.ZuneMusic*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.Messaging* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.Messaging*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.Wallet* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.Wallet*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.MicrosoftSolitaireCollection*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *MinecraftUWP* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Minecraft*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.OneConnect* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.OneConnect*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *bingfinance* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*bing*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.ZuneVideo* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.ZuneVideo*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.BingNews* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*BingNews*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Netflix* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Netflix*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *PandoraMediaInc* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Pandora*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *flaregamesGmbH.RoyalRevolt2* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Royal*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *AutodeskSketchBook* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*SketchBook*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.SkypeApp* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*SkypeApp*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *bingsports* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*bingsports*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Office.Sway* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Office.Sway*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Twitter* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Twitter*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft3DViewer* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft3DViewer*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.BingWeather* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*BingWeather*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.XboxGameOverlay* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.XboxGameOverlay*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.XboxApp* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.XboxApp*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.XboxIdentityProvider* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*Microsoft.XboxIdentityProvider*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *XboxOneSmartGlass* | Remove-AppxPackage
Get-appxprovisionedpackage –online | where-object {$_.packagename –like "*XboxOneSmartGlass*"} | remove-appxprovisionedpackage –online
Get-appxpackage -allusers *Microsoft.XboxSpeechToTextOverlay* | Remove-AppxPackage
Get-AppxProvisionedPackage -Online | where-object {$_.PackageName -like "Microsoft.XboxSpeechToTextOverlay"} | remove-appxprovisionedpackage -online

$list = { "Microsoft.Office", "Microsoft.MicrosoftOfficeHub", "*OneNote*", "*XboxApp*", "*xbox*","*Pandora*", "Microsoft.XboxSpeechToTextOverlay", "*XboxOneSmartGlass*", "*Microsoft3DViewer*",  "*Twitter*", "*Office.Sway*", "*SkypeApp*", "*SketchBook*", "*Royal*", "*3DBuilder*", "*Bing*", "*ConnectivityStore*", "*Microsoft.WindowsFeedbackHub*", "*MicrosoftSolitaireCollection*", "*Netflix*", "*Sway*", "*WindowsMaps*", "*Zune*", "*AdobeSystemsIncorporated.AdobePhotoshopExpress*", "*Asphalt*", "*CandyCrushSodaSaga*", "*Microsoft.Drawboard*", "*FarmVille2CountryEscape*" }

ForEach ($app in $list) {
    if (Get-AppxProvisionedPackage -Online | Where-Object {$_.PackageName -match $app -or $_.PackageName -like $app}) {
        Remove-AppxProvisionedPackage -Online -PackageName $app.PackageName | Out-Null
    }

    if (Get-AppxPackage | Where-Object {$_.Name -match $app -or $_.PackageName -match $app -or $_.PackageName -like $app -or $_.Name -like $app }) {
        Remove-AppxPackage -Package $app.PackageFullName | Out-Null
    }
}
