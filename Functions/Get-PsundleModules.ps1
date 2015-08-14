<#
  .SYNOPSIS
  Returns a list of .psm1 filenames found in the PsundleModulesDirectory

  .DESCRIPTION
  Returns a list of .psm1 filenames found in the PsundleModulesDirectory
#>
function Get-PsundleModules()
{
  write-debug "Get-PsundleModules Invoked"
  $PsundleModulesDirectory = Get-PsundleModulesDirectory
  $modules = (gci $PsundleModulesDirectory *.psm1 -recurse) | select -expand FullName
  return $modules
}
