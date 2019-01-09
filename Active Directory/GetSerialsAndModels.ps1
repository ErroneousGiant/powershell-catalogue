# Get Serial Numbers and Models for devices in an OU by Antony Bragg
# Note WinRM can be enabled through Group Policy for this script to work

# Enter OU
$ou = "OU=Desktops,OU=Devices,DC=Example,DC=co,DC=uk"

$list = (Get-ADComputer -Filter * -SearchBase $ou | ForEach {
  $name = $_.name
  $serial = (Get-WmiObject win32_bios -ComputerName $name).SerialNumber
  $model = (Get-WmiObject Win32_ComputerSystem -ComputerName $name).Model
  $name+" : "+$model+ " - " +$serial
})

Out-File -FilePath C:\Serials.txt -Encoding ascii -InputObject $list