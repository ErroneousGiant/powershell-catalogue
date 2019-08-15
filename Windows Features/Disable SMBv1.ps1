##Distinguished Name of OU in Active Directory
$ou = ""

##Gather all PC's in OU; Test if online; then remove feature without forcing a restart
Get-ADComputer -Filter * -Searchbase $ou | ForEach {
    if (Test-Connection $_.Name -quiet) {
        Invoke-Command -ComputerName $_.Name - ScriptBlock {
            if ((Get-WindowsOptionalFeature -FeatureName SMB1Protocol-Deprecation).State -eq "Enabled") {
                Disable-WindowsOptionalFeature -FeatureName SMB1Protocol-Deprecation -Remove -Online -NoRestart
            }
        }
    }
}
