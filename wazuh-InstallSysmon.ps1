# Author: Sam Dustin (polymorphicopcode)

$configPath = "C:\Program Files (x86)\ossec-agent\ossec.conf"
$tempPath = "$configPath.bak"

# Define the replacement block
$replacementBlock = @"
  <!-- Log analysis -->

  <localfile>
    <location>Microsoft-Windows-Sysmon/Operational</location>
    <log_format>eventchannel</log_format>
  </localfile>

"@

$fileContent = Get-Content -Path $configPath -Raw
$fileContent = $fileContent -replace '(?<=\s*)<!-- Log analysis -->', $replacementBlock
$fileContent | Set-Content -Path $tempPath -Encoding UTF8
Move-Item -Path $tempPath -Destination $configPath -Force
