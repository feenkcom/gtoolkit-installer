Class {
	#name : #GtLibraryInstallerPlatform,
	#superclass : #Object,
	#category : #'GToolkit-LibraryInstaller-Model - Platform'
}

{ #category : #accessing }
GtLibraryInstallerPlatform >> arch [
	<return: #String>

	^ Smalltalk vm is32bit
		ifTrue: [ 'i386' ]
		ifFalse: [ Smalltalk vm is64bit
			ifTrue: [ 'x86_64' ]
			ifFalse: [ Error signal: 'Unknown platform ARCH: ', Smalltalk vm asString ] ]
]

{ #category : #library }
GtLibraryInstallerPlatform >> directories [
	"Return a collection of possible library directories where to install a binary.
	The framework checks them in the order specified by this method"

	^ self subclassResponsibility
]

{ #category : #accessing }
GtLibraryInstallerPlatform >> extension [
	"Return an extension of a binary file specific to the platform.
	For example for windows it is usually 'dll', for linux 'so' and 'dylib' in case of OSX"
	<return: #String>
	
	^ self subclassResponsibility
]

{ #category : #accessing }
GtLibraryInstallerPlatform >> name [
	"Return a name of this platform"
	<return: #String>
	
	^ self subclassResponsibility
]
