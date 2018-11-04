Class {
	#name : #GtLibraryInstallerMorphLogger,
	#superclass : #Object,
	#instVars : [
		'transcript',
		'font',
		'textBrick'
	],
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #initialization }
GtLibraryInstallerMorphLogger >> initialize [
	super initialize.

	transcript := ThreadSafeTranscript new.
	
	textBrick := GtLibraryInstallerGLMRubPluggableTextBrick new
		getTextSelector: #contents;
		setTextSelector: #clear;
		withoutAdornment;
		margin: 10;
		yourself.

	textBrick rubric on: transcript.
	textBrick beForPlainText.
		
	font := LogicalFont familyName: StandardFonts defaultFont familyName pointSize: 9
]

{ #category : #accessing }
GtLibraryInstallerMorphLogger >> nextPutAll: aString [
	transcript nextPutAll:aString.
	transcript endEntry.
	transcript stepGlobal.
	textBrick beForPlainText.
	textBrick textFont: font
]

{ #category : #accessing }
GtLibraryInstallerMorphLogger >> textBrick [
	^ textBrick
]

{ #category : #accessing }
GtLibraryInstallerMorphLogger >> textBrick: anObject [
	textBrick := anObject
]
