"
I am sent when an error happens during installation

The UI may want to subscribe to this event and show error message
"
Class {
	#name : #GtLibraryInstallerErrorAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'error'
	],
	#category : #'GToolkit-LibraryInstaller-Announcement'
}

{ #category : #accessing }
GtLibraryInstallerErrorAnnouncement >> error [
	^ error
]

{ #category : #accessing }
GtLibraryInstallerErrorAnnouncement >> error: anError [
	error := anError
]
