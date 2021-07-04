Class {
	#name : #GtLibraryInstallerValidationStep,
	#superclass : #GtLibraryInstallerStep,
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #initialization }
GtLibraryInstallerValidationStep >> defaultTitle [
	^ 'Validation'
]

{ #category : #running }
GtLibraryInstallerValidationStep >> doActionIn: anInstaller [
	| doesWork |
	self logCr: '
=====================================================
=============== GToolkit Installer ==================
=====================================================
'.

	doesWork := anInstaller doesWork.

	self logCr: anInstaller libraryName, ' library is already installed:'.
	doesWork
		ifTrue: [ self logCr: String tab, ' - yes' ]
		ifFalse: [ self logCr: String tab, ' - no' ].

	"Library already exists and running, no need to install it again"
	doesWork
		ifTrue: [ ^ GtLibraryInstallerErrorAlreadyInstalled signal ]
]
