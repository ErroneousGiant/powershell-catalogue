# PowerShell-Catalogue
Collection of PowerShell scripts for various functions

# File Management
## Set-Owner

This function takes three parameters, the owner, the directory and if recursion is to be used.
The owner must be a member of an Active Directory Domain. and the root target must exist on a Domain Joined computer.

>
>## Example
>
>For the user Joe Blogs, with sAMAccountName jblogs:
>
>```Set-Owner -owner jblogs -root "\\DATSVR\Users\jblogs" -recurse $false```  
>This will set jblogs as the owner of "\\\\DATASVR\Users\jblogs" only, not effecting subfiles or folders
>
> ---
>```Set-Owner -owner jblogs -root "\\DATSVR\Users\jblogs" -recurse $true```  
>This will set jblogs as the owner of "\\\\DATASVR\Users\jblogs" including all subfolders and files
>
