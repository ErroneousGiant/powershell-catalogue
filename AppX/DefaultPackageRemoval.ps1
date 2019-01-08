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
