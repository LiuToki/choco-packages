$name = "lhaplus"
$installerType = "exe"
$url = "http://www7a.biglobe.ne.jp/~schezo/lpls174.exe"
$silentArgs = "/VERYSILENT /NORESTART"
$checksum      = '142D8F2ED308EFE9E1DCB8657757D99848827C40A5199436EB36C53F2B9D40FE'
$checksumType  = 'sha256'

try {
  Install-ChocolateyPackage $name $installerType $silentArgs $url -checksum $checksum -checksumType $checksumType
} catch {
  Write-ChocolateyFailure "$packageName" $($_.Exception.Message)
  throw
}
