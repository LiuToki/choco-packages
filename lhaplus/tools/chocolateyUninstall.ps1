$packageName = "lhaplus"

try {
  $key = "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall"
  $key64 = "HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall"
  $entries = (Get-ChildItem $key) + (Get-ChildItem $key64)
  $target = $entries|?{$_.GetValue("DisplayName") -match "Lhaplus"}

  if (-not $target) {
    Write-Host "$packageName is not installed."
  } else {
    $uninst = $target.GetValue('UninstallString')
    Write-Host "Uninstall $packageName by [$uninst]"
    & cmd /c "$uninst"
  }

  Write-ChocolateySuccess "$packageName"
} catch {
  Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
  throw
}