#Requires -Version 5

$sourceArray = @()
$copyArray = @()

$source = ""   # Example "D:\source"
$copy = ""   # Example "D:\copy"
$output = ""   # Example "D:\Comparison.txt"

class file {
  [string] $fullname
  [string] $Filename
  [string] $type
}

Get-ChildItem -Path $source -Recurse | ForEach {
    $file = New-Object file
    $file.fullname = $_.FullName
    $file.filename = $_.Name
    if (0 -ne ($_.Extension).length) {
        $file.type = $_.Extension
    }
    else {
        $file.type = "Directory"
    }

    $sourceArray += $file
}

Get-ChildItem -Path $copy -Recurse | ForEach {
    $file = New-Object file
    $file.fullname = $_.FullName
    $file.filename = $_.Name
    if (0 -ne ($_.Extension).length) {
        $file.type = $_.Extension
    }
    else {
        $file.type = "Directory"
    }

    $copyArray += $file
}

$list = Compare-Object -ReferenceObject $sourceArray -DifferenceObject $copyArray -Property Name -PassThru
$list | Group-Object -Property type -NoElement

Out-File -FilePath $output -Encoding ascii -InputObject ($list | Sort-Object type | Select-Object fullname, filename, type)
