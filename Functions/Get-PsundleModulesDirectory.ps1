<#
  .SYNOPSIS
  Returns the path to the PsundleModulesDirectory

  .DESCRIPTION
  Returns the path to the PsundleModulesDirectory
#>
function Get-PsundleModulesDirectory{
  $modulesPath = $env:PsModulePath.Split(';') | where {$_.Contains($home)}
  $psundleModules = "$modulesPath/.psundle"
  return $psundleModules
}
