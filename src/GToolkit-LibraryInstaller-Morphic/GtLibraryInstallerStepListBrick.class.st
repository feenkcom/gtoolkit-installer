"
I am a visual list of installer steps
"
Class {
	#name : #GtLibraryInstallerStepListBrick,
	#superclass : #GLMBandBrick,
	#instVars : [
		'installerProgram'
	],
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #accessing }
GtLibraryInstallerStepListBrick >> installer [
	^ installerProgram
]

{ #category : #accessing }
GtLibraryInstallerStepListBrick >> installer: anObject [
	installerProgram := anObject.
	
	installerProgram when: #stepAdded send: #stepAdded to: self.
	
	self addAllBricks: (installerProgram steps collect: [ :aStep |
		self newStepItem installerStep: aStep ])
]

{ #category : #'instance creation' }
GtLibraryInstallerStepListBrick >> newStepItem [
	^ GtLibraryaInstallerStepListItemBrick new
]

{ #category : #adding }
GtLibraryInstallerStepListBrick >> stepAdded [

	self addBrickBack: (self newStepItem installerStep: self installer steps last)
]
