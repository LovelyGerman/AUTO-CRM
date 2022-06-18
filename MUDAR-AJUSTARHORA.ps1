'running with full privileges'

$file = "C:\ajustarhora\ajustarhora.ps1"
$hostfile = Get-Content $file
$hostfile +='

Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sCountry -Value "Brazil";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLongDate -Value "dddd, d. MMMM yyyy";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortDate -Value "dd.MM.yyyy";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sShortTime -Value "HH:mm";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sTimeFormat -Value "HH:mm:ss";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sYearMonth -Value "MMMM yyyy";
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name iFirstDayOfWeek -Value 6;
Set-ItemProperty -Path "HKCU:\Control Panel\International" -Name sLanguage -Value "PTB";
Set-Culture pt-BR
Set-WinSystemLocale pt-BR
Set-WinHomeLocation -GeoId 32
exit
'
Set-Content -Path $file -Value $hostfile -Force

exit