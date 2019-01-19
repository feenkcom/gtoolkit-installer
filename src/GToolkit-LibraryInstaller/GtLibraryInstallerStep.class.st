Class {
	#name : #GtLibraryInstallerStep,
	#superclass : #Object,
	#instVars : [
		'installer',
		'beacon',
		'isActive',
		'isDone',
		'title'
	],
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #accessing }
GtLibraryInstallerStep >> announce: anAnnouncement [
	self beacon announce: anAnnouncement
]

{ #category : #accessing }
GtLibraryInstallerStep >> beacon [
	^ beacon
]

{ #category : #logging }
GtLibraryInstallerStep >> debugLog: aString [
	| aNonInteractiveTranscript |

	Transcript show: aString.
	Transcript flush.
	
	aNonInteractiveTranscript := NonInteractiveTranscript stdout.
	aString linesDo: [ :each | aNonInteractiveTranscript show: each; cr ].
	aNonInteractiveTranscript flush
]

{ #category : #logging }
GtLibraryInstallerStep >> debugLogCr: aString [
	self debugLog: String cr, aString, String cr
]

{ #category : #initialization }
GtLibraryInstallerStep >> defaultTitle [
	^ 'Step'
]

{ #category : #running }
GtLibraryInstallerStep >> doActionIn: anInstaller [
	self subclassResponsibility
]

{ #category : #running }
GtLibraryInstallerStep >> handleError: anError in: anInstaller [

	anInstaller announce: (GtLibraryInstallerErrorAnnouncement new error: anError).	
	anInstaller flush
]

{ #category : #initialization }
GtLibraryInstallerStep >> initialize [
	super initialize.
	
	isActive := false.
	isDone := false.

	beacon := Beacon new.

	title := self defaultTitle
]

{ #category : #accessing }
GtLibraryInstallerStep >> installer [
	^ installer
]

{ #category : #accessing }
GtLibraryInstallerStep >> installer: anObject [
	installer := anObject
]

{ #category : #accessing }
GtLibraryInstallerStep >> isActive [
	^ isActive
]

{ #category : #accessing }
GtLibraryInstallerStep >> isActive: anObject [
	isActive := anObject.
	
	isActive
		ifTrue: [ self announce: #activated ]
		ifFalse: [ self announce: #deactivated ]
]

{ #category : #accessing }
GtLibraryInstallerStep >> isDone [
	^ isDone
]

{ #category : #accessing }
GtLibraryInstallerStep >> isDone: anObject [
	isDone := anObject.
	
	isDone
		ifTrue: [ self announce: #done ]
		ifFalse: [ self announce: #ready ]
]

{ #category : #logging }
GtLibraryInstallerStep >> log: aString [
	installer announce: (GtLibraryInstallerLogAnnouncement new message: aString).
	
	self debugLog: aString
]

{ #category : #logging }
GtLibraryInstallerStep >> logCr: aString [
	self log: aString, String cr
]

{ #category : #running }
GtLibraryInstallerStep >> runIn: anInstaller [
	
	self isActive: true.
	anInstaller announce: (GtLibraryInstallerStepAnnouncement new step: self).
	
	anInstaller flush.
	
	self doActionIn: anInstaller.
	
	self isActive: false.
	self isDone: true.
	
	anInstaller flush
]

{ #category : #accessing }
GtLibraryInstallerStep >> title [
	^ title
]

{ #category : #accessing }
GtLibraryInstallerStep >> title: anObject [
	title := anObject.
	
	self announce: #titleChanged
]

{ #category : #announcing }
GtLibraryInstallerStep >> when: anAnnouncementClass do: aValuable [
	self beacon announcer when: anAnnouncementClass do: aValuable
]

{ #category : #announcing }
GtLibraryInstallerStep >> when: anAnnouncementClass send: aSelector to: anObject [
	self beacon announcer weak when: anAnnouncementClass send: aSelector to: anObject
]
