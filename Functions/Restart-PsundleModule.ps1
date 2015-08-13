<#
  .SYNOPSIS
  Updates and reloads a specific psundle module.

  .PARAMETER owner
  The owner of the module.

  .PARAMETER name
  The name of the github repo the module is stored in.
#>
function Restart-PsundleModule(
  [Parameter(Mandatory=$true)][string] $owner,
  [Parameter(Mandatory=$true)][string] $name
)
{
  try
  {
    $ModulePath = Get-PathToPsundleModule $owner $name
    $psm1 = (gci $ModulePath *.psm1)[0]
    $ModuleName = $psm1.Basename

    if ([string]::IsNullOrEmpty($psm1.FullName)){
      throw "Could not find module at $psm1"
    }

    $ModuleName = $psm1.Basename

    "Psundle: Removing $ModuleName"
  	Remove-Module $ModuleName

  	"Psundle: Importing $ModulePath"
  	Import-Module -Global $psm1.FullName

  }
  catch {
    throw $_.Exception
  }
  finally {

  }

  return


}
