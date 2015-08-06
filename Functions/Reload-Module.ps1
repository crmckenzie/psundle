<#
  .SYNOPSIS
  Unloads and reloads a module in the current session.

  .PARAMETER ModuleName

  The name of the module to be reloaded.

  .EXAMPLE
  Reload-Module Psundle
#>
Function Reload-Module(
  [Parameter(Mandatory=$true)] [string] $ModuleName
)
{
	$module = Get-Module $ModuleName

  if ($module -eq $null) {
    throw "No module found in the current session named '$module'"
    return
  }

	$path = $module.Path

	"removing $ModuleName"
	Remove-Module $ModuleName

	"importing $path"
	Import-Module -Global $path
}
