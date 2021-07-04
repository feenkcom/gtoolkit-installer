Class {
	#name : #GtLibraryInstallerError,
	#superclass : #Error,
	#instVars : [
		'help'
	],
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerError >> defaultHelp [
	^ self subclassResponsibility
]

{ #category : #initialization }
GtLibraryInstallerError >> defaultMessage [
	^ self subclassResponsibility
]

{ #category : #accessing }
GtLibraryInstallerError >> help [
	^ help
]

{ #category : #accessing }
GtLibraryInstallerError >> help: aText [
	help := aText
]

{ #category : #initialization }
GtLibraryInstallerError >> initialize [
	super initialize.
	
	messageText := self defaultMessage.
	help := self defaultHelp
]

{ #category : #accessing }
GtLibraryInstallerError >> shouldBeLogged [
	^ true
]

{ #category : #signaling }
GtLibraryInstallerError >> signal [
	self shouldBeLogged
		ifTrue: [
			| aMessage |
			aMessage := '[' , self class name , '] ' , self messageText.
			aMessage traceCr.
			NonInteractiveTranscript stderr
				cr;
				show: aMessage;
				cr ].
	super signal
]

{ #category : #accessing }
GtLibraryInstallerError >> stack [
	^ self signalerContext stack
]

{ #category : #accessing }
GtLibraryInstallerError >> systemInfo [
	| delimiter image stack |

	delimiter := 'System information: ', String cr, '---------------' asText.
	image := 'Pharo ', SystemVersion current dottedMajorMinor,  String cr, SmalltalkImage current lastUpdateString.
	stack := 'Stack trace:', String cr, '---------------', String cr, self stack printString.

	^
		delimiter,
		String cr, image,
		String cr, String cr, stack
]
