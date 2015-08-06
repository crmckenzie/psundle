<#
  .SYNOPSIS
  Imports all modules found in the PsundleModulesDirectory into the Global session.

  .DESCRIPTION
  Imports all modules found in the PsundleModulesDirectory into the Global session.
#>
function Import-PsundleModules(){
  Get-PsundleModules | Import-Module -Global
}
