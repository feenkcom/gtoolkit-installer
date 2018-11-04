Class {
	#name : #GtLibraryInstallerErrorNoLocalDirectory,
	#superclass : #GtLibraryInstallerError,
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorNoLocalDirectory >> defaultHelp [
	^ '
We were not able to find a suitable directory where we could download the library.
 - Make sure you launch Pharo with enough permissions for read and write in its working directory.
 - Check if there is enough free space on your disk drive
'
]

{ #category : #initialization }
GtLibraryInstallerErrorNoLocalDirectory >> defaultMessage [
	^ 'Unable to find local directory for download'
]
