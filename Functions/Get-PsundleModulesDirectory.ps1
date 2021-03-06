<#
  .SYNOPSIS
  Returns the path to the PsundleModulesDirectory

  .DESCRIPTION
  Returns the path to the PsundleModulesDirectory
#>
function Get-PsundleModulesDirectory{
  write-debug "Get-PsundleModulesDirectory Invoked"
  $modulesPath = $env:PsModulePath.Split(';') | where {$_.Contains($env:UserProfile)}
  $psundleModules = "$modulesPath/.psundle"
  return $psundleModules
}
