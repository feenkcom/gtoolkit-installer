"
I am sent when something important happened that is described in a message.

The UI may want to show it in big font
"
Class {
	#name : #GtLibraryInstallerSuccessAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'message'
	],
	#category : #'GToolkit-LibraryInstaller-Announcement'
}

{ #category : #accessing }
GtLibraryInstallerSuccessAnnouncement >> message [
	^ message
]

{ #category : #accessing }
GtLibraryInstallerSuccessAnnouncement >> message: anObject [
	message := anObject
]
