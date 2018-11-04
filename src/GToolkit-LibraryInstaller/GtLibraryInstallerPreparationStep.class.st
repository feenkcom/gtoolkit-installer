Class {
	#name : #GtLibraryInstallerPreparationStep,
	#superclass : #GtLibraryInstallerStep,
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #initialization }
GtLibraryInstallerPreparationStep >> defaultTitle [
	^ 'Preparation'
]

{ #category : #running }
GtLibraryInstallerPreparationStep >> detectDownloadDirectory [
	| downloadDirectory |

	downloadDirectory := self downloadDirectories
		detect: [ :each | each exists ]
		ifNone: [ ^ GtLibraryInstallerErrorNoLocalDirectory signal ].

	^ downloadDirectory
]

{ #category : #running }
GtLibraryInstallerPreparationStep >> detectInstallDirectoryFor: anInstaller [
	| installDirectory |

	installDirectory := anInstaller platform directories
		detect: [ :each | each exists ]
		ifNone: [ ^ GtLibraryInstallerErrorNoInstallDirectory signal ].

	^ installDirectory
]

{ #category : #running }
GtLibraryInstallerPreparationStep >> doActionIn: anInstaller [
	| downloadDirectory installDirectory |

	downloadDirectory := self detectDownloadDirectory / anInstaller temporaryFolderName.
	anInstaller destinationFolder: downloadDirectory.
	self logCr: 'Download directory: ', String cr, String tab, downloadDirectory pathString, String cr.
	
	installDirectory := self detectInstallDirectoryFor: anInstaller.
	anInstaller installationFolder: installDirectory.
	self logCr: 'Installation directory: ',  String cr, String tab, installDirectory pathString.
	
	1 seconds wait
]

{ #category : #folders }
GtLibraryInstallerPreparationStep >> downloadDirectories [
	^ {
		SystemResolver userLocalDirectory.
		FileSystem disk workingDirectory
	}
]
