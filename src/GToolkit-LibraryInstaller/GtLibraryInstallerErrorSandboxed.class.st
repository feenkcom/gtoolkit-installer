Class {
	#name : #GtLibraryInstallerErrorSandboxed,
	#superclass : #GtLibraryInstallerError,
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorSandboxed >> defaultHelp [
	OSPlatform current isMacOS
		ifTrue: [ ^ self osxHelp ].
		
	^ '
We were not able to install the library in VM folder.
 - Make sure you launch Pharo with enough permissions to read and write in VM directory.
'
]

{ #category : #initialization }
GtLibraryInstallerErrorSandboxed >> defaultMessage [
	^ 'Unable to install the library in VM directory'
]

{ #category : #help }
GtLibraryInstallerErrorSandboxed >> osxHelp [

	^ '
According to Apple security policies, applications that are not installed in /Applications folder run in a sandbox that prevents installation of additional libraries.
 - ' asText, 'Please, move Pharo.app to /Applications folder' asText allBold, '
'
]
