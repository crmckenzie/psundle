# PSUNDLE - The 'P' is silent 'cuz it's _fancy_!

Psundle is a powershell implementation of a package manager similar to Vundle. Psundle uses github as the repository for powershell modules.
Psundle will automatically load psundle modules when psundle itself is loaded into a powershell session.

Psundle is _dumb_, meaning it cannot distinguish github repos which are powershell modules from other repos. You must exercise due dilligence and make sure you are installing valid and trusted powershell modules.

## Installation

```powershell
iex ((new-object net.webclient).DownloadString('https://raw.githubusercontent.com/crmckenzie/psundle/master/tools/install.ps1'))
```

## What's wrong with PsGet?

Nothing. [PsGet](http://psget.net/) is great. However, not every powershell module can be made public, and not every powershell module developer goes through the process of registering their modules at PsGet. Psundle bypasses all of that and lets you install any powershell module you like as long as it's hosted on github.

## The Future of Psundle

If there is interest in Psundle, I'd like to add

* support for alternative source control systems
* support selecting specific versions of the module by release or commit
* one-step installation script

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
Install-PsundleModule "owner" "repo"
```

This command is equivalent to

```powershell
git clone http://github.com/owner/repo.git "$home/Documents/WindowsPowershell/Modules/.psundle/repo"

Import-Module "$home/Documents/WindowsPowershell/Modules/.psundle/repo/repo.psm1" -Global
```

## Example Powershell Modules

For examples of powershell modules that are compatible with Psundle, see

| Module | Description |
| ------ | ----------- |
|[ChefDk](http://github.com/crmckenzie/psundle-chefdk)|Powershell Tools for ChefDk|
|[Ruby](http://github.com/crmckenzie/psundle-ruby)|Ruby tools (including version switcher) for Windows|
|[VSCX](http://github.com/crmckenzie/psundle-vscx)|Visual Studio Community Extensions for Powershell|
