$domain = $args[0]
$password = $args[1]
$user = $args[2]

$TextInfo = (Get-Culture).TextInfo

$script = @"
`$user = "${domain}.local\${user}"
`$SecurePassword = ConvertTo-SecureString "$password" -asplaintext -force 
`$credential = New-Object -TypeName System.Management.Automation.PSCredential -ArgumentList `$user, `$SecurePassword
Add-Computer -DomainName ${domain}.local -Credential `$credential -Force

Install-WindowsFeature -name AD-Domain-Services -IncludeManagementTools
Install-ADDSDomainController -InstallDns -DomainName ${domain} -NoRebootOnCompletion -Credential `$credential -Force -SafeModeAdministratorPassword `$SecurePassword
Add-DnsServerForwarder -IPAddress 168.63.129.16 -PassThru
"@

New-Item -Path C:\ -Name "buildDC.ps1" -ItemType "file" -Value $script
#Restart-Computer -Force
#exit 0