$domain = "gktest"
$SecurePassword = ConvertTo-SecureString 'Canada1!' -asplaintext -force 
$TextInfo = (Get-Culture).TextInfo

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools

Install-ADDSForest -DomainName "${domain}.local" -DomainMode Win2012R2 -ForestMode Win2012R2 -DatabasePath "c:\NTDS" -SysvolPath "c:\SYSVOL" -LogPath "c:\Logs" -DomainNetbiosName "${domain}" -InstallDns -NoRebootOnCompletion -Force -SafeModeAdministratorPassword $SecurePassword

$users = ConvertFrom-Json -InputObject '[
    {"firstName":"tarek","lastName":"ali"},
    {"firstName":"gerald","lastName":"hill"},
    {"firstName":"simon","lastName":"earl"},
    {"firstName":"adam","lastName":"huisman"},
	{"firstName":"greg","lastName":"kealey"},
    {"firstName":"tho","lastName":"nguyen"}
]';

foreach($user in $users){
	$firstName = $user.firstName
	$lastName = $user.lastName
	$name = "${firstName} ${lastName}"
	$name = $TextInfo.ToTitleCase($name.ToLower())
	$samName = $firstName[0] + "${lastName}"
	$UPName = "${samName}@${domain}.local"
	$path = "CN=Users,DC=${domain},DC=local"
	New-ADUSER -Name $name -GivenName $TextInfo.ToTitleCase($firstName) -Surname $TextInfo.ToTitleCase($lastName) -SamAccountName $samName -userprincipalname $UPName -Path $path -AccountPassword $SecurePassword -Enable $true
}

exit 0