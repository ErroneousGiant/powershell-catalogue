## Requires a Connection to Exchange/Exchange Online

## Array of users to set Out Of Office for
$users = @()

## Messages to be used, external for recipients Outside of the organisation, internal for those inside of the organisation
$externalmessage = " "
$internalmessage = " "

## Function to add users to the array, loops until you exit then sets the message

function Set-OutOfOffice {
    $continue = 1
    do{
        $username = Read-Host "User Principal Name"
        $users += $username
        $test = Read-host "Add another user? Y/N"
        switch ($test) {
            "Y" { $continue = 1 }
            "default" { $continue = 0 }
        }
    } while (1 -eq $continue)

    ForEach ($user in $users) {
        Set-MailboxAutoReplyConfiguration -Identity $user -AutoReplyState Enabled -ExternalMessage $externalmessage -InternalMessage $internalmessage
    }
}

Set-OutOfOffice
