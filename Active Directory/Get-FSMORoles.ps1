#Requires -Modules ActiveDirectory
Import-Module ActiveDirectory

class fsmo {
    [string] $SchemaMaster
    [string] $DomainNamingMaster
    [string] $PDCEmulator
    [string] $RIDMaster
    [string] $InfrastructureMaster
    [array] $GlobalCatalogs
}

$domain = New-Object fsmo

function Get-FSMORoles {
    $domain.SchemaMaster = (Get-ADForest $env:USERDNSDOMAIN).SchemaMaster
    $domain.DomainNamingMaster = (Get-ADForest $env:USERDNSDOMAIN).DomainNamingMaster
    $domain.PDCEmulator = (Get-ADDomain $env:USERDNSDOMAIN).PDCEmulator
    $domain.RIDMaster = (Get-ADDomain $env:USERDNSDOMAIN).RIDMaster
    $domain.InfrastructureMaster = (Get-ADDomain $env:USERDNSDOMAIN).InfrastructureMaster

    ForEach ($dc in (Get-ADForest $env:USERDNSDOMAIN).GlobalCatalogs) {
        $domain.GlobalCatalogs += $dc
    }

    return $domain
}

Get-FSMORoles
