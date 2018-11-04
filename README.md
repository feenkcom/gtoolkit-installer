# GToolkit Installer
GT Installer is a set of tools for installation of various software system artefacts such as shared libraries or projects

## Library Installer
Library Installer helps with downloading and installation shared libraries along side the image or vm.
I should be configured by the user for a specific library.

The following example shows how Library Installer is configured for the Sparta/Moz2D library.

```smalltalk
| installer |
installer := GtLibraryInstaller new.
installer library: 'Moz2D'.
installer version: 'development'.
installer binary: 'libMoz2D'.
installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
installer icon: (SpartaCanvas logo scaledToSize: 50@50).
installer running: [ MozServices isRunning ].
installer works: [ MozLibrary uniqueInstance hasModule ].
installer postInstall: [ MozServices start ].
```

Running the installer:
```
installer run
```

## Library Installer UI

Library Installer supports visual logging of the installation process. It can is optional and should be connected to the installer explicitely:
```smalltalk
| ui |
ui := GtLibraryInstallerMorph new.
ui installer: installer.
ui extent: 650@300.
ui openInBorderlessWindow.
```
**The UI must be connected to the Installer before begin of the installation process!**
