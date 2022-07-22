If ($null -eq $args[0] -or "" -eq $args[0]) {
      Write-Host "Usage: $($MyInvocation.MyCommand.Name) ""<Title>"" ""<Description>"""
      exit 1
}

If ($null -eq $args[1] -or "" -eq $args[1]) {
      Write-Host "Usage: $($MyInvocation.MyCommand.Name) ""<Title>"" ""<Description>"""
      exit 1
}

Add-Type -AssemblyName System.Windows.Forms 
Add-Type -AssemblyName System.Drawing
$notify = New-Object System.Windows.Forms.NotifyIcon; $notify.Icon = [System.Drawing.SystemIcons]::Information
$notify.Visible = $true
$notify.ShowBalloonTip(
      0,
      $args[0],
      $args[1],
      [System.Windows.Forms.ToolTipIcon]::None
)