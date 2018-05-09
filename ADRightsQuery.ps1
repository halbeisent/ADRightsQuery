Add-Type -AssemblyName System.DirectoryServices.AccountManagement
$username = read-host -prompt "Enter a username"
$FILE = "ntfs-$username.txt"
$ct = [System.DirectoryServices.AccountManagement.ContextType]::Domain
$user = [System.DirectoryServices.AccountManagement.UserPrincipal]::FindByIdentity($ct, $username)
$groups = $user.GetGroups()
foreach($i in $groups){
  $i.SamAccountName | Out-File $File -append
}
Write-Output $File
