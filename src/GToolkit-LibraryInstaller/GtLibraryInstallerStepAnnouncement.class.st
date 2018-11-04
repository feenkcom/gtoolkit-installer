"
I am sent when step is switched. I hold a new step
"
Class {
	#name : #GtLibraryInstallerStepAnnouncement,
	#superclass : #Announcement,
	#instVars : [
		'step'
	],
	#category : #'GToolkit-LibraryInstaller-Announcement'
}

{ #category : #accessing }
GtLibraryInstallerStepAnnouncement >> step [
	^ step
]

{ #category : #accessing }
GtLibraryInstallerStepAnnouncement >> step: anObject [
	step := anObject
]
