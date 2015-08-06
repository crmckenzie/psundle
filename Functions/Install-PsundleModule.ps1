<#
  .SYNOPSIS
  Clones the specified module from github into the PsundleModuleDirectory and imports it

  .DESCRIPTION
  Clones the specified module from github into the PsundleModuleDirectory and imports it

  .EXAMPLE
  Install-PsundleModule crmckenzie psundle-vsex
#>
function Install-PsundleModule($owner, $moduleName) {
  $PsundleModuleDirectory = Get-PsundleModulesDirectory

  $moduleDir = "$PsundleModuleDirectory/$owner/$moduleName"

  if ([System.IO.Directory]::Exists($moduleDir)) {
    write-debug "Psundle: $owner/$moduleName is already installed. Skipping."
  }
  else
  {
    $cmd = "git clone http://github.com/$owner/$modulename.git $moduleDir"
    $cmd
    Invoke-Expression $cmd
  }


  $moduleDefinitions = (gci $moduleDir *.psm1)
  if ($moduleDefinitions.Count -eq 0) {
    throw "Could not find any module definitions in $moduleDir. This repository does not appear to be a powershell module."
    Remove-Item $ModuleDir -force -recurse
    return
  }

  $moduleDefinition = $moduleDefinitions[0].FullName

  $cmd = "Import-Module '$moduleDefinition' -Global"
  $cmd
  Invoke-expression $cmd
}
