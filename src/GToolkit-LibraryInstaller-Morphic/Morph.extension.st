Extension { #name : #Morph }

{ #category : #'*GToolkit-LibraryInstaller-Morphic' }
Morph >> gtInstallerOpenInWindowAt: aPoint [
	| aWorld window extent aPosition windowOutsets |
	
	aWorld := self currentWorld.
	
	window := (GtLibraryInstallerWindow labelled: '') model: nil.
	windowOutsets := (window borderWidth @ window labelHeight)
		+ window borderWidth + (window class borderWidth * 2 @ (window class borderWidth + 1)).
	
	aPosition := aPoint min: (aWorld extent - self fullBounds extent - windowOutsets x).
	
	window 
		" guess at initial extent"
		bounds:  (aPosition extent: self fullBounds extent);
		addMorph: self frame: (0@0 extent: 1@1);
		updatePaneColors.

	"calculate extent after adding in case any size related attributes were changed.  Use
	fullBounds in order to trigger re-layout of layout morphs"
	extent := self fullBounds extent + windowOutsets. "include inset margin"
	window extent: extent.
	
	aWorld addMorphFront: window.

	window activate.
	aWorld startSteppingSubmorphsOf: window.
	
	window announceOpened.
	^window

]
