"
Represent an item in a steps list.

Can be finished, waiting, active
"
Class {
	#name : #GtLibraryaInstallerStepListItemBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'label',
		'installerStep'
	],
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #colors }
GtLibraryaInstallerStepListItemBrick >> activeColor [
	^ Smalltalk ui theme lightBackgroundColor
]

{ #category : #area }
GtLibraryaInstallerStepListItemBrick >> activeVertices [
	"rectangle with right arrow"
	| aHeight aTriangleCathetus aWidth |
	
	aHeight := self height.
	aTriangleCathetus := aHeight // 2.
	
	aWidth := self width.
	
	^ { 
		0@0.
		(aWidth - aTriangleCathetus) @ 0.
		(aWidth @ aTriangleCathetus).
		(aWidth - aTriangleCathetus) @ (aTriangleCathetus * 2).
		0@(aTriangleCathetus * 2).
	}
]

{ #category : #controlling }
GtLibraryaInstallerStepListItemBrick >> beActive [
	self color: self activeColor.
	self changed
]

{ #category : #controlling }
GtLibraryaInstallerStepListItemBrick >> beDone [
	label textColor: self doneTextColor.
	self changed
]

{ #category : #controlling }
GtLibraryaInstallerStepListItemBrick >> beNotActive [
	self color: self inactiveColor.
	self changed
]

{ #category : #controlling }
GtLibraryaInstallerStepListItemBrick >> beNotDone [
	label textColor: self readyTextColor.
	self changed
]

{ #category : #controlling }
GtLibraryaInstallerStepListItemBrick >> beReady [
	label textColor: self readyTextColor
]

{ #category : #initialization }
GtLibraryaInstallerStepListItemBrick >> defaultRenderer [
	^ GtLibraryInstallerGLMBrickVerticesRenderer new
]

{ #category : #colors }
GtLibraryaInstallerStepListItemBrick >> doneTextColor [
	^ Smalltalk ui theme disabledColor
]

{ #category : #colors }
GtLibraryaInstallerStepListItemBrick >> inactiveColor [
	^ Color transparent
]

{ #category : #area }
GtLibraryaInstallerStepListItemBrick >> inactiveVertices [
	"rectangle with right arrow"
	| aHeight aTriangleCathetus aWidth |
	
	aHeight := self height.
	aTriangleCathetus := aHeight // 2.
	
	aWidth := self width.
	
	^ { 
		0@0.
		(aWidth - aTriangleCathetus) @ 0.
		(aWidth @ aTriangleCathetus).
		0@(aTriangleCathetus * 2).
	}
]

{ #category : #initialization }
GtLibraryaInstallerStepListItemBrick >> initialize [
	super initialize.
	
	self hSpaceFill.
	self useHorizontalLinearLayout.
	self paddingRight: 40.
	self paddingLeft: 20.
	self paddingTop: 10.
	self paddingBottom: 10.
	self height: 40.
	
	label := self newLabelBrick.
	label vAlign: #center.
	
	self addBrickBack: label
]

{ #category : #accessing }
GtLibraryaInstallerStepListItemBrick >> installerStep [
	^ installerStep
]

{ #category : #accessing }
GtLibraryaInstallerStepListItemBrick >> installerStep: anInstallerStep [
	installerStep := anInstallerStep.
	
	installerStep when: #activated send: #beActive to: self.
	installerStep when: #deactivated send: #beNotActive to: self.
	installerStep when: #done send: #beDone to: self.
	installerStep when: #ready send: #beNotDone to: self.
	installerStep when: #titleChanged send: #titleChanged to: self.
	
	installerStep isActive
		ifTrue: [ self beActive ]
		ifFalse: [ self beNotActive ].
		
	installerStep isDone
		ifTrue: [ self beDone ]
		ifFalse: [ self beNotDone ].
		
	self titleChanged
]

{ #category : #accessing }
GtLibraryaInstallerStepListItemBrick >> label [
	^ label
]

{ #category : #accessing }
GtLibraryaInstallerStepListItemBrick >> label: anObject [
	label := anObject
]

{ #category : #'instance creation' }
GtLibraryaInstallerStepListItemBrick >> newLabelBrick [
	^ GLMLabelBrick new
]

{ #category : #colors }
GtLibraryaInstallerStepListItemBrick >> readyTextColor [
	^ Smalltalk ui theme textColor
]

{ #category : #accessing }
GtLibraryaInstallerStepListItemBrick >> text: aString [

	label text: aString
]

{ #category : #'changes handling' }
GtLibraryaInstallerStepListItemBrick >> titleChanged [
	label text: self installerStep title.
	self changed
]

{ #category : #area }
GtLibraryaInstallerStepListItemBrick >> vertices [
	^ self installerStep isActive
		ifTrue: [ self activeVertices ]
		ifFalse: [ self inactiveVertices ]
]
