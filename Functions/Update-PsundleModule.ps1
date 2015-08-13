<#
  .SYNOPSIS
  Updates and reloads a specific psundle module.

  .PARAMETER owner
  The owner of the module.

  .PARAMETER name
  The name of the github repo the module is stored in.
#>
function Update-PsundleModule(
  [Parameter(Mandatory=$true)][string] $owner,
  [Parameter(Mandatory=$true)][string] $name
){
  try
  {
    $psm1 = New-Object "System.IO.FileInfo" (Get-PathToPsundleModule $owner $name)
    $ModulePath = $psm1.Directory.FullName
    $ModuleName = $psm1.Basename

    if ([string]::IsNullOrEmpty($psm1)){
      throw "Could not find module at $psm1"
    }

    $ModuleName = $psm1.Basename

    "Psundle: Removing $ModuleName"
  	Remove-Module $ModuleName

    pushd $ModulePath
    git pull origin master
    popd

  	"Psundle: Importing $ModulePath"
  	Import-Module -Global $psm1.FullName

  }
  catch {
    throw $_
  }
  finally {

  }

  return
}
