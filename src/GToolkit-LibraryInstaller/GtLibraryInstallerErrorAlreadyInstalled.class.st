Class {
	#name : #GtLibraryInstallerErrorAlreadyInstalled,
	#superclass : #GtLibraryInstallerError,
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorAlreadyInstalled >> defaultHelp [
	^ '
Library can not be upgraded once installed.
 - perform a fresh install in a new Pharo image
 - or manually delete the binary from the Virtual Machine or Image folder and try again
'
]

{ #category : #initialization }
GtLibraryInstallerErrorAlreadyInstalled >> defaultMessage [
	^ 'Library is already installed'
]

{ #category : #accessing }
GtLibraryInstallerErrorAlreadyInstalled >> shouldBeLogged [
	^ false
]
