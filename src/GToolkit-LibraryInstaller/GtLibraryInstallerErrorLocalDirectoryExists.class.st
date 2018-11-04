Class {
	#name : #GtLibraryInstallerErrorLocalDirectoryExists,
	#superclass : #GtLibraryInstallerError,
	#instVars : [
		'directory'
	],
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorLocalDirectoryExists >> defaultHelp [
	^ '
We could not delete a temporary directory where the library should be downloaded.
Please, delete ({1}) and try again.
'
]

{ #category : #initialization }
GtLibraryInstallerErrorLocalDirectoryExists >> defaultMessage [
	^ 'Unable to delete temporary directory'
]

{ #category : #accessing }
GtLibraryInstallerErrorLocalDirectoryExists >> directory [
	^ directory
]

{ #category : #accessing }
GtLibraryInstallerErrorLocalDirectoryExists >> directory: anObject [
	directory := anObject.
	
	self help: (self help format: { directory asString })
]
