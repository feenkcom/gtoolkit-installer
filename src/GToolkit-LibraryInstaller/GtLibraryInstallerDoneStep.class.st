Class {
	#name : #GtLibraryInstallerDoneStep,
	#superclass : #GtLibraryInstallerStep,
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #initialization }
GtLibraryInstallerDoneStep >> defaultTitle [
	^ 'Finish'
]

{ #category : #running }
GtLibraryInstallerDoneStep >> doActionIn: anInstaller [
	anInstaller onInstalled.

	anInstaller announce: (GtLibraryInstallerSuccessAnnouncement new message: 'Done!').
	self debugLogCr: 'Success! ', self installer libraryName, ' is up and running :)'.
	1 second wait.
	anInstaller announce: GtLibraryInstallerDoneAnnouncement new
]
