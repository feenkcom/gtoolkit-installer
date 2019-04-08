Class {
	#name : #GtLibraryInstallerWindows,
	#superclass : #GtLibraryInstallerPlatform,
	#category : #'GToolkit-LibraryInstaller-Model - Platform'
}

{ #category : #library }
GtLibraryInstallerWindows >> directories [
	^ {
		Smalltalk image imageDirectory asFileReference.
		Smalltalk vm fullPath asFileReference parent.
	}
]

{ #category : #accessing }
GtLibraryInstallerWindows >> extension [
	"Return an extension of a binary file specific to the platform.
	For example for windows it is usually 'dll', for linux 'so' and 'dylib' in case of OSX"
	<return: #String>
	
	^ 'dll'
]

{ #category : #accessing }
GtLibraryInstallerWindows >> name [
	"Return a name of this platform"
	<return: #String>
	
	^ 'windows'
]
