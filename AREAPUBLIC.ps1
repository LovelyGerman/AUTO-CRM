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

$caminhoareapublica = "C:\Instalacao-CRM-BANCO-SANTANDER\ARCHIVESRC\4"

$caminhoagent = "C:\Instalacao-CRM-BANCO-SANTANDER\ARCHIVESRC\5"

robocopy $caminho $destino /mir

robocopy $caminhoareapublica C:\Users\Public\Desktop

New-Item -Path 'C:\Agent' -ItemType Directory

New-Item -Path 'C:\ajustarhora' -ItemType Directory

New-Item -Path 'C:\ajustarhora\ajustarhora.ps1' -ItemType File

New-Item -Path 'C:\AgentPortalClient' -ItemType Directory

robocopy $caminhoagent C:\AgentPortalClient /mir


exit




