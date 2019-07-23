function Send-ByFTP {
    param (
        $userFTP = "anonymous",
        $passFTP = "anonymous",
        [Parameter(Mandatory=$True)]$serverFTP,
        [Parameter(Mandatory=$True)]$localFile,
        [Parameter(Mandatory=$True)]$remotePath
    )
    if(Test-Path $localFile){
        $remoteFile = $localFile.Split("\")[-1]
        $remotePath = Join-Path -Path $remotePath -ChildPath $remoteFile
        $ftpAddr = "ftp://${serverFTP}/$remotePath"
        $browser = New-Object System.Net.WebClient
        $browser.Credentials = New-Object System.Net.NetworkCredential($userFTP,$passFTP)
        $url = New-Object System.Uri($ftpAddr)
        $browser.UploadFile($url, $localFile)    
    }
    else{
        Return "Unable to find $localFile"
    }
}
