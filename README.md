# gtoolkit-installer
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
installer running: [ MozServices isRunning ].
installer works: [ MozLibrary uniqueInstance hasModule ].
installer postInstall: [ MozServices start ].
```
