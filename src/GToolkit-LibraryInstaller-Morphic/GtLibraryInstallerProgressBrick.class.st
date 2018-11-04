"
A progress bar
"
Class {
	#name : #GtLibraryInstallerProgressBrick,
	#superclass : #GLMBrick,
	#instVars : [
		'progressColor',
		'progress'
	],
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #initialization }
GtLibraryInstallerProgressBrick >> initialize [
	super initialize.
	
	progress := 0.
	progressColor := Color gray
]

{ #category : #'morph-drawing' }
GtLibraryInstallerProgressBrick >> onDraw: aCanvas [
	| progressBounds |
	super onDraw: aCanvas.
	
	progressBounds := self brickBounds origin extent: ((self width * self progress) asInteger @ self height).
	aCanvas fillRectangle: progressBounds color: self progressColor.
]

{ #category : #accessing }
GtLibraryInstallerProgressBrick >> progress [
	^ progress
]

{ #category : #accessing }
GtLibraryInstallerProgressBrick >> progress: aProgress [
	progress := aProgress.
	self changed
]

{ #category : #accessing }
GtLibraryInstallerProgressBrick >> progressColor [
	^ progressColor
]

{ #category : #accessing }
GtLibraryInstallerProgressBrick >> progressColor: anObject [
	progressColor := anObject
]
