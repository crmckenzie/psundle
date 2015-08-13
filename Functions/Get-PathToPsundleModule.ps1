<#
  .SYNOPSIS
  Returns the full path to the psm1 file for a given psundle module.

  .PARAMETER owner
  The owner of the module.

  .PARAMETER name
  The name of the github repo the module is stored in.
#>
function Get-PathToPsundleModule(
  [Parameter(Mandatory = $true)][string] $owner,
  [Parameter(Mandatory = $true)][string] $name)
{
  $psundleModulesDirectory = Get-PsundleModulesDirectory
  $ModulePath = Join-Path $psundleModulesDirectory $owner
  $ModulePath = Join-Path $ModulePath $name
  $psm1 = (gci $ModulePath *.psm1)[0]
  return $psm1.FullName
}
