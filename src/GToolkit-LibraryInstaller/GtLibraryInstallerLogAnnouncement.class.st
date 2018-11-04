"
I am sent by installer when it tries to log some messages.

The UI may want to display them in a Transcript
"
Class {
	#name : #GtLibraryInstallerLogAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'message'
	],
	#category : #'GToolkit-LibraryInstaller-Announcement'
}

{ #category : #accessing }
GtLibraryInstallerLogAnnouncement >> message [
	^ message
]

{ #category : #accessing }
GtLibraryInstallerLogAnnouncement >> message: anObject [
	message := anObject
]
