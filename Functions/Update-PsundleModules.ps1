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

    $ownerPath = $_.FullName

    write-debug "Updating modules from $ownerPath"

    $modules = (gci $ownerPath)
    $modules | foreach {
      $modulePath = $_.FulLname

      write-debug "Updating PsModule $modulePath"

      pushd $modulePath

      $psm1 = (gci $modulePath *.psm1)[0]
      $moduleName = $psm1.Basename

      "Psundle: Removing $ModuleName"
    	Remove-Module $ModuleName

      git pull origin master

    	"Psundle: Importing $path"
      $psm1 = (gci $modulePath *.psm1)[0].FullName
    	Import-Module -Global $psm1
      popd
    }
  }

}
