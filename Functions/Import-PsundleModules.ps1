<#
  .SYNOPSIS
  Imports all modules found in the PsundleModulesDirectory into the Global session.

  .DESCRIPTION
  Imports all modules found in the PsundleModulesDirectory into the Global session.
#>
function Import-PsundleModules(){
  $modules = Get-PsundleModules
  $modules | Import-Module -Global
}
