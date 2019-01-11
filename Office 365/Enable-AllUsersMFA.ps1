$username = Read-Host -Prompt "Username"
$password = Read-Host -Prompt "Password" -AsSecureString
$credential = New-Object System.Management.Automation.PSCredential -ArgumentList $username,$password

Connect-MsolService -Credential $credential
$users = Get-MsolUser -All # | where {$_.isLicensed -eq $true}

$auth = New-Object -TypeName Microsoft.Online.Administration.StrongAuthenticationRequirement
$auth.RelyingParty = "*"
$auth.State = "Enabled"
$auth.RememberDevicesNotIssuedBefore = (Get-Date)
$auths = @($auth)

foreach ($user in $users)
{
    Set-MsolUser -UserPrincipalName $user.UserPrincipalName -StrongAuthenticationRequirements $auths
}
