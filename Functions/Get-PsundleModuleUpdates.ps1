<#
  .SYNOPSIS
  Displays metadata about a single Psundle Module

  .PARAMETER pathToModule
  The full path to the psm1 file for the psundle module.
#>
function Get-PsundleModuleUpdates(
  [Parameter(Mandatory = $true)][string]$pathToModule
)
{
  $file = New-Object "System.IO.FileInfo" $pathToModule
  $directory = $file.Directory.FullName

  pushd $directory
  $fetchData = (git fetch)
  $updates = (git log head..origin/master --oneline)
  popd
  $hash = @{
    "Module"= $file.Basename
    "Path"=$pathToModule
    "Updates" = [Array]$updates
    "HasUpdates" = ($updates.Length -gt 0)
    }

  $result = New-Object PSObject -Property $hash
  return $result
}
