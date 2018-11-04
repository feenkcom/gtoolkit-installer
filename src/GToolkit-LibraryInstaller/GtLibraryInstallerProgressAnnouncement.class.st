"
I am sent when the progress value of the current step changes.

The UI may want to subscribe to this event and show a progressbar
"
Class {
	#name : #GtLibraryInstallerProgressAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'progress',
		'message'
	],
	#category : #'GToolkit-LibraryInstaller-Announcement'
}

{ #category : #accessing }
GtLibraryInstallerProgressAnnouncement >> message [
	^ message
]

{ #category : #accessing }
GtLibraryInstallerProgressAnnouncement >> message: anObject [
	message := anObject
]

{ #category : #accessing }
GtLibraryInstallerProgressAnnouncement >> progress [
	^ progress
]

{ #category : #accessing }
GtLibraryInstallerProgressAnnouncement >> progress: anObject [
	progress := anObject
]
