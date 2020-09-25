$domain = "gktest"
$password = 'Canada1!'
$SecurePassword = ConvertTo-SecureString $password -asplaintext -force 
$TextInfo = (Get-Culture).TextInfo

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSForest -DomainName "${domain}.local" -DomainMode Win2012R2 -ForestMode Win2012R2 -DatabasePath "c:\NTDS" -SysvolPath "c:\SYSVOL" -LogPath "c:\Logs" -DomainNetbiosName "${domain}" -InstallDns -NoRebootOnCompletion -Force -SafeModeAdministratorPassword $SecurePassword

$createUsersScript = @"

`$TextInfo = (Get-Culture).TextInfo
`$SecurePassword = ConvertTo-SecureString "$password" -asplaintext -force 

`$users = ConvertFrom-Json -InputObject '[
	{"firstName":"greg","lastName":"kealey"}
]';

foreach(`$user in `$users){
	`$firstName = `$user.firstName
	`$lastName = `$user.lastName
	`$name = "`${firstName} `${lastName}"
	`$name = `$TextInfo.ToTitleCase(`$name.ToLower())
	`$samName = "`${lastName}" + `$firstName[0]
	`$UPName = "`${samName}@${domain}.local"
	`$path = "CN=Users,DC=${domain},DC=local"
    if (-not [bool] (Get-ADUser -Filter { SamAccountName -eq `$samName })) {
	    New-ADUSER -Name `$name -GivenName `$TextInfo.ToTitleCase(`$firstName) -Surname `$TextInfo.ToTitleCase(`$lastName) -SamAccountName `$samName -userprincipalname `$UPName -Path `$path -AccountPassword `$SecurePassword -Enable `$true
    }
}
"@

New-Item -Path C:\ -Name "createUsers.ps1" -ItemType "file" -Value $createUsersScript
Restart-Computer
exit 0