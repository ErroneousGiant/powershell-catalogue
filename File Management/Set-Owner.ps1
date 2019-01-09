#Requires -RunAsAdministrator

function Set-Owner {
    param([string]$owner, [String]$root, [Boolean]$recurse)

    $netBIOS = (Get-ADDomain).netBIOSName
    if ($recurse -eq $true) {
        $acl = Get-ACL -Path $root
        $newOwner = New-Object System.Security.Principal.NTAccount("$netBIOS","$owner")
        $acl.SetOwner($newOwner)
        Set-Acl -Path $root -AclObject $acl
        Get-ChildItem -Path $root -Recurse | ForEach-Object {
            $acl = Get-ACL -Path $_.FullName
            $newOwner = New-Object System.Security.Principal.NTAccount("$netBIOS","$owner")
            $acl.SetOwner($newOwner)
            Set-Acl -Path $_.FullName -AclObject $acl
        }
    }
    else {
        $acl = Get-ACL -Path $root
        $newOwner = New-Object System.Security.Principal.NTAccount("$netBIOS","$owner")
        $acl.SetOwner($newOwner)
        Set-Acl -Path $root -AclObject $acl
    }
}
