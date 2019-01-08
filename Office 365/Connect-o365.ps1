#Requires -Modules MSOnline

function connect-o365 {
[CmdletBinding()]
param (
    [parameter(Mandatory=$true,
    HelpMessage = "Enter Global Admin UPN")]
    [ValidateNotNullOrEmpty()]
    [ValidateLength(6,113)]
    [string] $user,
    [parameter(Mandatory=$true,
    HelpMessage = "Enter Password")]
    [ValidateNotNullOrEmpty()]
    [securestring] $password,
    [parameter(Mandatory=$true,
    HelpMessage = "Usage: E for Exchange Online, O for Office 365 Admin")]
    [ValidateNotNullOrEmpty()]
    [ValidateSet("E","O","e","o")]
    [string] $context
)
process {
        $Usercredential = new-object -typename System.Management.Automation.PSCredential -argumentlist $user,$password
        if ($context.ToUpper() -eq "E") {
            $Session = New-PSSession -ConfigurationName Microsoft.Exchange -ConnectionUri https://outlook.office365.com/powershell-liveid/ -Credential $UserCredential -Authentication Basic -AllowRedirection
            Import-PSSession $Session
        }
        else {
            Import-Module MSOnline
            Connect-MsolService -Credential $Usercredential
        }
    }
}
