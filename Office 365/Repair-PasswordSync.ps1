#Requires -Modules ADSync
#Requires -RunAsAdministrator

Import-Module ADSync

function Repair-PasswordSync {
  
  process {
    $connectors = Get-ADSyncConnector
    $aadConnectors = $connectors | Where-Object {$_.SubType -eq "Windows Azure Active Directory (Microsoft)"}
    $adConnectors = $connectors | Where-Object {$_.ConnectorTypeName -eq "AD"}
    
    if ($null -ne $aadConnectors -and $null -ne $adConnectors) {
      $c = Get-ADSyncConnector -Name ($adConnectors).Name
      $p = New-Object Microsoft.IdentityManagement.PowerShell.ObjectModel.ConfigurationParameter "Microsoft.Synchronize.ForceFullPasswordSync", String, ConnectorGlobal, $null, $null, $null
      $p.Value = 1
      $c.GlobalParameters.Remove($p.Name)
      $c.GlobalParameters.Add($p)
      $c = Add-ADSyncConnector -Connector $c
      Set-ADSyncAADPasswordSyncConfiguration -SourceConnector ($adConnectors).Name -TargetConnector ($aadConnectors).Name -Enable $false
      Set-ADSyncAADPasswordSyncConfiguration -SourceConnector ($adConnectors).Name -TargetConnector ($aadConnectors).Name -Enable $true
    }
  }
}
