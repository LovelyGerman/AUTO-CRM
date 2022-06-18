param([switch]$Elevated)

function Test-Admin {
  $currentUser = New-Object Security.Principal.WindowsPrincipal $([Security.Principal.WindowsIdentity]::GetCurrent())
  $currentUser.IsInRole([Security.Principal.WindowsBuiltinRole]::Administrator)
}

if ((Test-Admin) -eq $false)  {
    if ($elevated) 
    {
        # tried to elevate, did not work, aborting
    } 
    else {
        Start-Process powershell.exe -Verb RunAs -ArgumentList ('-noprofile -noexit -file "{0}" -elevated' -f ($myinvocation.MyCommand.Definition))
}

exit
}

'running with full privileges'

$file = “C:\Windows\System32\drivers\etc\hosts”
$hostfile = Get-Content $file
$hostfile += “
10.80.100.30 portalcrm-me
10.80.100.30 CMELDR01
10.80.100.31 cmeldr02
10.80.100.32 CMELDR03
”
Set-Content -Path $file -Value $hostfile -Force


exit