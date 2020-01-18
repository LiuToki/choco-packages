$name = "ltspice"
$installerType = "exe"
$url = "http://ltspice.analog.com/software/LTspiceXVII.exe"
$silentArgs = "/VERYSILENT /NORESTART"
$checksum      = 'f7ff1e7f1ae6958637ac15fd5e88f0ce17608978e34fb7e93ac0d962eeca41e0'
$checksumType  = 'sha256'

try {
  Install-ChocolateyPackage $name $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType
} catch {
  Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
  throw
}
