try
{
  $repository = "https://github.com/crmckenzie/psundle.git"

  $modulesDirectory = ($env:PsModulePath.Split(';') | where {$_.contains($env:UserProfile)})

  $psundleDirectory = Join-Path $modulesDirectory "Psundle"

  if (Test-Path $psundleDirectory){
    throw "Psundle directory already exists."
  }

  pushd $modulesDirectory
  git clone $repository
  popd

  $psm1 = (gci $psundleDirectory "Psundle.psm1")[0]
  Import-Module $psm1

  write-host "Psundle installed." -ForegroundColor Green
}
catch {
  write-host "Failed to install psundle." -ForegroundColor Red
  write-host $_ -ForegroundColor Red

}
