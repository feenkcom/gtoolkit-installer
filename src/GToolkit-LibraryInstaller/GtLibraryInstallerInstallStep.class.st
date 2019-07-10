Class {
	#name : #GtLibraryInstallerInstallStep,
	#superclass : #GtLibraryInstallerStep,
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #initialization }
GtLibraryInstallerInstallStep >> defaultTitle [
	^ 'Install'
]

{ #category : #running }
GtLibraryInstallerInstallStep >> doActionIn: anInstaller [
	| pluginPath downloadFileName |
		
	downloadFileName := anInstaller downloadedFilePath.

	"Library already exists and running, no need to install it again"
	anInstaller isRunning
		ifTrue: [ GtLibraryInstallerErrorAlreadyInstalled signal ].

	downloadFileName exists
		"Bug in installer"
		ifFalse: [ Error signal: 'Library is not downloaded' ].
	
	pluginPath := anInstaller installedFilePath.

	self ensureNotExist: pluginPath.
	anInstaller installationFolder isWritable
		ifFalse: [  Error signal: 'Library destination must be writable ', anInstaller installationFolder asString ].

	self debugLogCr: 'Installing library to ', pluginPath asString.
	
	 [ downloadFileName moveTo: pluginPath ]
		on: Error
		do: [ GtLibraryInstallerErrorSandboxed signal ].

	[ anInstaller destinationFolder deleteAll. ]
		on: Error
		do: [ Error signal: 'Was not able to delete temporary directory: ', anInstaller destinationFolder asString ].
		
	pluginPath exists
		ifFalse: [ Error signal: 'Failed to move library to VM directory' ].

	anInstaller doesWork
		ifFalse: [ GtLibraryInstallerErrorUnmetDependencies signal ]
]

{ #category : #running }
GtLibraryInstallerInstallStep >> ensureNotExist: aFile [
	| file |
	
	file := aFile asFileReference.
	file exists ifTrue: [
		NonInteractiveTranscript stdout show: 'File exists: ', file asString; cr.
		file delete ].

	self
		assert: [ file exists not ]
		description: [ file asString , ' must not exist' ].
]
