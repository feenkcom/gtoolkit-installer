"
I am the installer of shared libraries along side image or vm.
I should be configured by the user for a specific library.

The following example shows how I am configured for Sparta/Moz2D library.

[[[
| installer |
installer := GtLibraryInstaller new.
installer library: 'Moz2D'.
installer version: 'development'.
installer binary: 'libMoz2D'.
installer url: 'https://dl.feenk.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'.
installer running: [ MozServices isRunning ].
installer works: [ MozLibrary uniqueInstance hasModule ].
installer postInstall: [ MozServices start ].
]]]
"
Class {
	#name : #GtLibraryInstaller,
	#superclass : #Object,
	#instVars : [
		'steps',
		'platform',
		'beacon',
		'destinationFolder',
		'installationFolder',
		'urlStencil',
		'version',
		'libraryName',
		'binaryName',
		'worksBlock',
		'runningBlock',
		'postInstallBlock',
		'icon'
	],
	#category : #'GToolkit-LibraryInstaller-Model'
}

{ #category : #'private - accessing' }
GtLibraryInstaller >> addStep: anInstallerStep [
	
	anInstallerStep installer: self.
	steps add: anInstallerStep.
	self announce: #stepAdded
]

{ #category : #'private - announcing' }
GtLibraryInstaller >> announce: anAnnouncement [
	self beacon announce: anAnnouncement
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> beacon [
	^ beacon
]

{ #category : #configuration }
GtLibraryInstaller >> binary: aString [
	"Set the name of the binary file without extension"
	
	binaryName := aString
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> destinationFolder [
	^ destinationFolder
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> destinationFolder: aFileReference [
	destinationFolder := aFileReference
]

{ #category : #'private - testing' }
GtLibraryInstaller >> doesWork [
	"Return true if the library we installed works or not"

	^ worksBlock value
]

{ #category : #'private - path' }
GtLibraryInstaller >> downloadedFilePath [
	^ self destinationFolder / (binaryName, '_', self platform arch, '.', self platform extension)
]

{ #category : #'private - announcing' }
GtLibraryInstaller >> flush [
	"Flush all changes to UI"
	
	self announce: #flush
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> generateUrl [
	<return: #String>

	^ urlStencil valueWithArguments: { 
		libraryName.
		platform name.
		platform arch.
		version.
		binaryName.
		platform extension }
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> icon [
	^ icon
]

{ #category : #configuration }
GtLibraryInstaller >> icon: aForm [
	icon := aForm
]

{ #category : #initialization }
GtLibraryInstaller >> initialize [
	super initialize.
	
	libraryName := 'Unknown'.
	binaryName := 'libUnknown'.
	icon := Smalltalk ui icons iconNamed: #pharo.

	version := 'development'.
	urlStencil := GtLibraryInstallerUrlStencil new.

	runningBlock := [ false ].
	worksBlock := [ true ].

	steps := OrderedCollection new.
	platform := Smalltalk platform gtLibraryInstallerPlatform.
	beacon := Beacon new.
	
	installationFolder := Smalltalk imageDirectory asFileReference.
	destinationFolder := Smalltalk imageDirectory asFileReference / self temporaryFolderName.

	self initializeSteps
]

{ #category : #initialization }
GtLibraryInstaller >> initializeSteps [
	self addStep: GtLibraryInstallerValidationStep new.
	self addStep: GtLibraryInstallerPreparationStep new.
	"self addStep: GtLibraryInstallerDownloadStep new.
	self addStep: GtLibraryInstallerInstallStep new.
	self addStep: GtLibraryInstallerDoneStep new"
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> installationFolder [
	^ installationFolder
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> installationFolder: aFileReference [
	installationFolder := aFileReference
]

{ #category : #'private - path' }
GtLibraryInstaller >> installedFilePath [
	^ self installationFolder / (binaryName, '.', self platform extension)
]

{ #category : #'private - testing' }
GtLibraryInstaller >> isRunning [
	"Return true if a library we are trying to install is already running"
	
	^ runningBlock value
]

{ #category : #configuration }
GtLibraryInstaller >> library: aString [
	"Set the library name, for example Moz2D or Winit"

	libraryName := aString
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> libraryName [
	^ libraryName
]

{ #category : #hooks }
GtLibraryInstaller >> onInstalled [
	"Is sent when installation is complete"
	
	postInstallBlock value
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> platform [
	^ platform
]

{ #category : #configuration }
GtLibraryInstaller >> postInstall: aBlock [
	"Set a bock to be executed after installation is complete"
	postInstallBlock := aBlock
]

{ #category : #running }
GtLibraryInstaller >> run [
	self steps do: [ :aStep |
		 [ [ aStep runIn: self ]
			on: GtLibraryInstallerError
			do: [ :anError | ^ aStep handleError: anError in: self ] ]
				on: Error
				do: [ :anError | ^ aStep handleError: (GtLibraryInstallerUnhandledError new error: anError) in: self] ]
]

{ #category : #configuration }
GtLibraryInstaller >> running: aBlock [
	"Set a block used to check wether a library is already running (otherwise we will not be able to upgrade it)"
	
	runningBlock := aBlock
]

{ #category : #'private - accessing' }
GtLibraryInstaller >> steps [
	^ steps
]

{ #category : #'private - path' }
GtLibraryInstaller >> temporaryFolderName [
	^ 'gtoolkit-installer'
]

{ #category : #configuration }
GtLibraryInstaller >> url: aStencilOrBlock [
	"It can be an instance of GtLibraryInstallerUrlStencil or a Block closure in a form of:
	[ :library :platform :arch :version :binary :extension | ]

	or string:
	'https://site.com/{library}/{platform}/{version}/{arch}/{binary}.{extension}'
	"

	urlStencil := GtLibraryInstallerUrlStencil new formatter: aStencilOrBlock
]

{ #category : #configuration }
GtLibraryInstaller >> version [
	"Set which version of the library to install.
	'development' by default"
	<return: #String>
	
	^ version
]

{ #category : #configuration }
GtLibraryInstaller >> version: aString [
	"Set which version of the library to install.
	'development' by default"
	
	version := aString
]

{ #category : #'private - announcing' }
GtLibraryInstaller >> when: anAnnouncementClass send: aSelector to: anObject [
	self beacon announcer weak when: anAnnouncementClass send: aSelector to: anObject
]

{ #category : #configuration }
GtLibraryInstaller >> works: aBlock [
	"Set a block used to check wether a library works or not"
	
	worksBlock := aBlock
]
