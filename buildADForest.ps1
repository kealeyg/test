Install-WindowsFeature -IncludeAllSubFeature RSAT
Add-WindowsFeature AD-Domain-Services
Install-ADDSForest -DomainName "gktest.local" -DomainMode Win2012R2 -ForestMode Win2012R2 -DatabasePath "c:\NTDS" -SysvolPath "c:\SYSVOL" -LogPath "c:\Logs" -DomainNetbiosName "gktest" -InstallDns -NoRebootOnCompletion -Force -SafeModeAdministratorPassword "Canada1!" 
exit 0