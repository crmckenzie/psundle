# PSUNDLE - The 'P' is silent cuz' it's _fancy_!

Psundle is a powershell implementation of a package manager similar to Vundle. Psundle uses github as the repository for powershell modules.
Psundle will automatically load psundle modules when psundle itself is loaded into a powershell session.

Psundle is _dumb_, meaning it cannot distinguish github repos which are powershell modules from other repos. You must exercise due dilligence and make sure you are installing valid and trusted powershell modules.

#Dependencies

**git** must be installed and available in `$env:PATH`

#Installing Psundle

Installation is currently manual. I'm working on it.

```powershell
git clone http://github.com/crmckenzie/psundle.git "$home/Documents/WindowsPowershell/Modules/Psundle"
```
In your powershell profile, make sure you `Import-Module Psundle`. Your powershell profile is located at `$home/Documents/WindowsPowershell/Profile.ps1`.

## Installing a module

```powershell
Install-PsModule "owner" "repo"
```

This command is equivalent to

```powershell
git clone http://github.com/owner/repo.git "$home/Documents/WindowsPowershell/Modules/.psundle/repo"

Import-Module "$home/Documents/WindowsPowershell/Modules/.psundle/repo/repo.psm1" -Global
```
