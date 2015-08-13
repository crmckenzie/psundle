<#
  .SYNOPSIS
  Performs a git pull on all modules in the PsundleModulesDirectory

  .DESCRIPTION
  Unloads the psundle modules, performs a git pull on all modules in the
  PsundleModulesDirectory, and reloads the modules

  .EXAMPLE
  Update-PsundleModules
#>
function Update-PsundleModules
{
  $psundleModulesDirectory = Get-PsundleModulesDirectory

  write-debug "PsundleModulesDirectory: $PsundleModulesDirectory"

  $owners = (gci $psundleModulesDirectory)
  $owners | foreach {
    $owner = $_.Name
    $modules = (gci $_.FullName)
    $modules | foreach {
      $name = $_.Name
      Update-PsundleModule $owner $name
    }
  }

}
