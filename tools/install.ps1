try
{
  $repository = "https://github.com/crmckenzie/psundle.git"

  $modulesDirectory = ($env:PsModulePath.Split(';') | where {$_.contains($env:UserProfile)})

  if ((Test-Path $modulesDirectory) -eq $false)
  {
    write-host "Creating Modules Directory at $modulesDirectory"
    mkdir $modulesDirectory
  }

  $psundleDirectory = Join-Path $modulesDirectory "Psundle"

  if (Test-Path $psundleDirectory){
    write-host "Updating Psundle"
    Remove-Module Psundle
    pushd $psundleDirectory
    git pull origin master
    popd
  }
  else
  {
    write-host "Installing Psundle"
    pushd $modulesDirectory
    git clone $repository
    popd
  }

  $psm1 = (gci $psundleDirectory "Psundle.psm1")[0]
  Import-Module $psm1

  write-host "Psundle installed and loaded." -ForegroundColor Green
}
catch {
  write-host "Failed to install psundle." -ForegroundColor Red
  write-host $_ -ForegroundColor Red
}
