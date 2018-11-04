Class {
	#name : #GtLibraryInstallerErrorUnmetDependencies,
	#superclass : #GtLibraryInstallerError,
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerErrorUnmetDependencies >> defaultHelp [
	OSPlatform current isWindows
		ifTrue: [ ^ self windowsHelp ].
		
	OSPlatform current isUnix
		ifTrue: [ ^ self linuxHelp ].
		
	^ ''
]

{ #category : #initialization }
GtLibraryInstallerErrorUnmetDependencies >> defaultMessage [
	^ 'The library has unmet dependencies'
]

{ #category : #help }
GtLibraryInstallerErrorUnmetDependencies >> linuxHelp [
	
	^ '
Please, make sure that you have installed the following packages:
 - gtk2 & gtk3
 - libGL (for example libgl1-mesa)
'
]

{ #category : #help }
GtLibraryInstallerErrorUnmetDependencies >> windowsHelp [
	| link |

	link := 'https://www.microsoft.com/en-us/download/details.aspx?id=52685' asText allBold.

	^ '
Please, install Microsoft Visual C++ 2015 Redistributable and try again:
' asText, link, String cr
]
