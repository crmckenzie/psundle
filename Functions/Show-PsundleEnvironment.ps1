<#
  .SYNOPSIS
  Displays information about the installed Psundle Modules.
#>
function Show-PsundleEnvironment(){
  Get-PsundleModules | foreach { Get-PsundleModuleUpdates $_}
}
