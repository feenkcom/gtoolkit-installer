Class {
	#name : #GtLibraryInstallerMac,
	#superclass : #GtLibraryInstallerPlatform,
	#category : #'GToolkit-LibraryInstaller-Model - Platform'
}

{ #category : #library }
GtLibraryInstallerMac >> directories [
	^ {
		Smalltalk image imageDirectory asFileReference.
		Smalltalk vm fullPath asFileReference parent / 'Plugins'
	}
]

{ #category : #accessing }
GtLibraryInstallerMac >> extension [
	"Return an extension of a binary file specific to the platform.
	For example for windows it is usually 'dll', for linux 'so' and 'dylib' in case of OSX"
	<return: #String>
	
	^ 'dylib'
]

{ #category : #accessing }
GtLibraryInstallerMac >> name [
	"Return a name of this platform"
	<return: #String>
	
	^ 'osx'
]
