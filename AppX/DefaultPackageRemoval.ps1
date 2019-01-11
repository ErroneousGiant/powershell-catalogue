#Requires -RunAsAdministrator

$apps = ("Microsoft.Office", "Microsoft.Getstarted", "Microsoft.OneConnect", "Microsoft.NetworkSpeedTest", "*king*", "*Empires*","*Eclipse*", "ActiproSoftwareLLC.562882FEEB491", "*Duolingo*", "Microsoft.MinecraftUWP", "Microsoft.MicrosoftOfficeHub", "*OneNote*", "*XboxApp*", "*xbox*","*Pandora*", "Microsoft.XboxSpeechToTextOverlay", "*XboxOneSmartGlass*", "*Microsoft3DViewer*",  "*Twitter*", "*Office.Sway*", "*SkypeApp*", "*SketchBook*", "*Royal*", "*3DBuilder*", "*Bing*", "*ConnectivityStore*", "*Microsoft.WindowsFeedbackHub*", "*MicrosoftSolitaireCollection*", "*Netflix*", "*Sway*", "*WindowsMaps*", "*Zune*", "*AdobeSystemsIncorporated.AdobePhotoshopExpress*", "*Asphalt*", "*CandyCrushSodaSaga*", "*Microsoft.Drawboard*", "*FarmVille2CountryEscape*")
 
ForEach ($app in $apps) {
    write-host $app
    if (Get-AppxPackage $app) {
        try {
            Get-AppxPackage $app | Remove-AppxPackage
            Write-host $app was removed -ForegroundColor Green
        }
        catch [IOException] {
            write-host $app cannot be removed -ForegroundColor Red
        }
    }
    if (Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $app}) {
        try {
            Get-AppxProvisionedPackage -Online | Where-Object {$_.DisplayName -like $app} | Remove-AppxProvisionedPackage -Online
            Write-host $app was removed -ForegroundColor Green
        }
        catch [IOException] {
            write-host $app cannot be removed -ForegroundColor Red
        }
        
    }
}
