Class {
	#name : #GtLibraryInstallerLinux,
	#superclass : #GtLibraryInstallerPlatform,
	#category : #'GToolkit-LibraryInstaller-Model - Platform'
}

{ #category : #library }
GtLibraryInstallerLinux >> directories [
	^ { 
		Smalltalk image imageDirectory asFileReference.
		Smalltalk vm fullPath asFileReference parent / 'bin'.
		Smalltalk vm fullPath asFileReference parent.
	}
]

{ #category : #accessing }
GtLibraryInstallerLinux >> extension [
	"Return an extension of a binary file specific to the platform.
	For example for windows it is usually 'dll', for linux 'so' and 'dylib' in case of OSX"
	<return: #String>

	^ 'so'
]

{ #category : #accessing }
GtLibraryInstallerLinux >> name [
	"Return a name of this platform"
	<return: #String>
	
	^ 'linux'
]
