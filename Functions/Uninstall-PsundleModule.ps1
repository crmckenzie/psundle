<#
  .SYNOPSIS
  Unloads a psundle module and removes it from disk

  .PARAMETER Name
  Required: The name of the module to remove
#>
function Uninstall-PsundleModule
(
  [Parameter(Mandatory=$true)][string] $ModuleName
)
{
  $module = Get-Module $ModuleName
  if ($module -eq $null) {
    throw "No module found in the current session named '$module'"
    return
  }

  $path = $module.Path
  write-debug "Psundle: Uninstalling $path"

  "Psundle: Removing $ModuleName"
  Remove-Module $ModuleName

  $psm1 = (new-Object "System.IO.FileInfo" $module.Path)
  $parent = $psm1.Directory.FullName

  Remove-Item $parent -force -recurse
}
