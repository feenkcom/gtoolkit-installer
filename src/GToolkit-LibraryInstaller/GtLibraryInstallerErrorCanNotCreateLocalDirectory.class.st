Class {
	#name : #GtLibraryInstallerErrorCanNotCreateLocalDirectory,
	#superclass : #GtLibraryInstallerError,
	#instVars : [
		'directory'
	],
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorCanNotCreateLocalDirectory >> defaultHelp [
	^ '
We were unable to create a temporary directory for the download of the library
({1})
 - Make sure you launch Pharo with enough permissions for read and write in its working directory.
 - Check if there is enough free space on disk drive
'
]

{ #category : #initialization }
GtLibraryInstallerErrorCanNotCreateLocalDirectory >> defaultMessage [
	^ 'Unable to create a temporary directory'
]

{ #category : #accessing }
GtLibraryInstallerErrorCanNotCreateLocalDirectory >> directory [
	^ directory
]

{ #category : #accessing }
GtLibraryInstallerErrorCanNotCreateLocalDirectory >> directory: anObject [
	directory := anObject.
	
	self help: (self help format: { directory asString })
]
