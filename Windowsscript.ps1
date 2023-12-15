# Define Wazuh Agent MSI download URL
$wazuhAgentUrl = "https://github.com/wazuh/wazuh/releases/download/v4.7.0/wazuh-agent-4.7.0-1.msi"

# Define the download path
$downloadPath = ".\wazuh-agent-4.7.0-1.msi"

# Download the Wazuh Agent MSI
Invoke-WebRequest -Uri $wazuhAgentUrl -OutFile $downloadPath

# Get the current date and time
$currentDateTime = Get-Date -Format "yyyyMMdd-HHmmss"

# Define Wazuh Manager IP
$wazuhManagerIP = "192.168.122.69"

# Define the installation command
$installCommand = "$downloadPath /q WAZUH_MANAGER=$wazuhManagerIP WAZUH_AGENT_NAME=$currentDateTime"

# Install Wazuh agent
Start-Process -FilePath "msiexec.exe" -ArgumentList "/i", $installCommand -Wait
