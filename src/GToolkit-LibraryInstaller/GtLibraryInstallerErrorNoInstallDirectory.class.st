Class {
	#name : #GtLibraryInstallerErrorNoInstallDirectory,
	#superclass : #GtLibraryInstallerError,
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorNoInstallDirectory >> defaultHelp [
	^ '
We were not able to find a suitable directory where we could install the library.
 - Make sure you launch Pharo with enough permissions to read and write in VM directory.
 - Check if there is enough free space on your disk drive
'
]

{ #category : #initialization }
GtLibraryInstallerErrorNoInstallDirectory >> defaultMessage [
	^ 'Unable to find installation directory'
]
