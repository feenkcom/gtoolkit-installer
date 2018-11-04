"
I am a special GLMBrick renderer for polygonal geometry
"
Class {
	#name : #GtLibraryInstallerGLMBrickVerticesRenderer,
	#superclass : #GLMBrickRenderer,
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #rendering }
GtLibraryInstallerGLMBrickVerticesRenderer >> renderBackgroundColorOf: aBrick on: aCanvas in: aRectangle [

	aCanvas
		drawPolygon: (aBrick vertices collect: [ :each | each + aRectangle origin ])
		color: aBrick color
		borderWidth: 0
		borderColor: Color transparent
]
