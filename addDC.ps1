$domain = $args[0]
$password = $args[1]
$SecurePassword = ConvertTo-SecureString $password -asplaintext -force 
$TextInfo = (Get-Culture).TextInfo

$script = @"
Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -InstallDns -DomainName `$domain -NoRebootOnCompletion -Force -SafeModeAdministratorPassword $SecurePassword
Add-DnsServerForwarder -IPAddress 168.63.129.16 -PassThru
"@

New-Item -Path C:\ -Name "buildDC.ps1" -ItemType "file" -Value $script
Restart-Computer -Force
exit 0