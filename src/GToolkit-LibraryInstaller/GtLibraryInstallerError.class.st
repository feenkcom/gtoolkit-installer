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

{ #category : #signaling }
GtLibraryInstallerError >> signal [
	| aMessage |
	
	aMessage := '[', self class name, '] ', self messageText.
	
	aMessage logCr.
	NonInteractiveTranscript stderr
		cr;
		show: aMessage;
		cr.

	super signal
]

{ #category : #accessing }
GtLibraryInstallerError >> stack [
	^ self signalerContext stack
]

{ #category : #accessing }
GtLibraryInstallerError >> systemInfo [
	| delimiter image vm stack |

	delimiter := 'System information: ', String cr, '---------------' asText.
	image := 'Pharo ', SystemVersion current dottedMajorMinor,  String cr, SmalltalkImage current lastUpdateString.
	vm := String streamContents: [ :aStream | SystemReporter new reportVM: aStream ].
	stack := 'Stack trace:', String cr, '---------------', String cr, self stack printString.

	^
		delimiter,
		String cr, image,
 		String cr, String cr, vm,
		String cr, String cr, stack
]
