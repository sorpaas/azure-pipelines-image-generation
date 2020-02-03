################################################################################
##  File:  Initialize-VM.ps1
##  Team:  CI-Platform
##  Desc:  VM initialization script, machine level configuration
################################################################################

function Disable-UserAccessControl {
    Set-ItemProperty "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value 00000000 -Force
    Write-Host "User Access Control (UAC) has been disabled."
}

Import-Module -Name ImageHelpers -Force

Write-Host "Setup PowerShellGet"
# Set-PSRepository -InstallationPolicy Trusted -Name PSGallery
Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
Install-Module -Name PowerShellGet -Force
Set-PSRepository -InstallationPolicy Trusted -Name PSGallery

Write-Host "Disable Antivirus"
Set-MpPreference -DisableRealtimeMonitoring $true

# Disable Windows Update
$AutoUpdatePath = "HKLM:SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
If (Test-Path -Path $AutoUpdatePath) {
    Set-ItemProperty -Path $AutoUpdatePath -Name NoAutoUpdate -Value 1
    Write-Host "Disabled Windows Update"
}
else {
    Write-Host "Windows Update key does not exist"
}

# Insatll Windows .NET Features
Install-WindowsFeature -Name NET-Framework-45-Features -IncludeAllSubFeature
Install-WindowsFeature -Name BITS -IncludeAllSubFeature
Install-WindowsFeature -Name DSC-Service

# Install Data Deduplication filter driver, but don't enable it on any drives
Install-WindowsFeature -Name FS-Data-Deduplication

Write-Host "Disable UAC"
Disable-UserAccessControl

Write-Host "Setting local execution policy"
Set-ExecutionPolicy -ExecutionPolicy Unrestricted -Scope MachinePolicy -ErrorAction Continue | Out-Null
Get-ExecutionPolicy -List

Write-Host "Enable long path behavior"
# See https://docs.microsoft.com/en-us/windows/desktop/fileio/naming-a-file#maximum-path-length-limitation
Set-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\FileSystem' -Name 'LongPathsEnabled' -Value 1

Write-Host "Install chocolatey"
$chocoExePath = 'C:\ProgramData\Chocolatey\bin'

if ($($env:Path).ToLower().Contains($($chocoExePath).ToLower())) {
    Write-Host "Chocolatey found in PATH, skipping install..."
    Exit
}

# Add to system PATH
$systemPath = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::Machine)
$systemPath += ';' + $chocoExePath
[Environment]::SetEnvironmentVariable("PATH", $systemPath, [System.EnvironmentVariableTarget]::Machine)

# Update local process' path
$userPath = [Environment]::GetEnvironmentVariable('Path', [System.EnvironmentVariableTarget]::User)
if ($userPath) {
    $env:Path = $systemPath + ";" + $userPath
}
else {
    $env:Path = $systemPath
}

# Run the installer
[Net.ServicePointManager]::SecurityProtocol = [Net.ServicePointManager]::SecurityProtocol -bor "Tls12"
Invoke-Expression ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))

# Turn off confirmation
choco feature enable -n allowGlobalConfirmation

# Expand disk size of OS drive

New-Item -Path d:\ -Name cmds.txt -ItemType File -Force

Add-Content -Path d:\cmds.txt "SELECT VOLUME=C`r`nEXTEND"

$expandResult = (diskpart /s 'd:\cmds.txt')

Write-Host $expandResult

Write-Host "Disk sizes after expansion"

wmic logicaldisk get size,freespace,caption

# Adding description of the software to Markdown

$Content = @"
# Azure Pipelines Windows Container 1803 image

The following software is installed on machines in the Azure Pipelines **Windows Container 1803** (v$env:ImageVersion) pool.

Components marked with **\*** have been upgraded since the previous version of the image.

"@

Add-ContentToMarkdown -Content $Content

$SoftwareName = "Chocolatey"

if( $( $(choco version) | Out-String) -match  'Chocolatey v(?<version>.*).*' )
{
   $chocoVersion = $Matches.version.Trim()
}

$Description = @"
_Version:_ $chocoVersion<br/>
_Environment:_
* PATH: contains location for choco.exe
"@

Add-SoftwareDetailsToMarkdown -SoftwareName $SoftwareName -DescriptionMarkdown $Description
