#Requires -Modules ADSync
#Requires -RunAsAdministrator

Import-Module ADSync

function Repair-PasswordSync {
  
  process {
    $connectors = Get-ADSyncConnector
    $aadConnectors = $connectors | Where-Object {$_.SubType -eq "Windows Azure Active Directory (Microsoft)"}
    $adConnectors = $connectors | Where-Object {$_.ConnectorTypeName -eq "AD"}
    
    if ($null -ne $aadConnectors -and $null -ne $adConnectors) {
      $local = Get-ADSyncConnector -Name ($adConnectors).Name
      $new = New-Object Microsoft.IdentityManagement.PowerShell.ObjectModel.ConfigurationParameter "Microsoft.Synchronize.ForceFullPasswordSync", String, ConnectorGlobal, $null, $null, $null
      $new.Value = 1
      $local.GlobalParameters.Remove($new.Name)
      $local.GlobalParameters.Add($new)
      $local = Add-ADSyncConnector -Connector $local
      Set-ADSyncAADPasswordSyncConfiguration -SourceConnector ($adConnectors).Name -TargetConnector ($aadConnectors).Name -Enable $false
      Set-ADSyncAADPasswordSyncConfiguration -SourceConnector ($adConnectors).Name -TargetConnector ($aadConnectors).Name -Enable $true
    }
  }
}
