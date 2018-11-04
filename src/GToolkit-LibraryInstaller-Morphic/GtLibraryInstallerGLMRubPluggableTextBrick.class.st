"
I wrap RubPluggableTextMorph and allow it to be embedded in Morphic-Brick
"
Class {
	#name : #GtLibraryInstallerGLMRubPluggableTextBrick,
	#superclass : #GLMRubScrolledTextBrick,
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #'change reporting' }
GtLibraryInstallerGLMRubPluggableTextBrick >> invalidRect: aRectangle from: aMorph [
	aMorph == self
		ifTrue: [ super invalidRect: aRectangle from: aMorph ]
		ifFalse: [ self changed ]
]

{ #category : #'instance creation' }
GtLibraryInstallerGLMRubPluggableTextBrick >> newRubricMorph [
	^ RubPluggableTextMorph new beWrapped
]
