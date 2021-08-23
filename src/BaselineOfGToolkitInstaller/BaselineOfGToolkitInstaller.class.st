Class {
	#name : 'BaselineOfGToolkitInstaller',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGToolkitInstaller'
}

{ #category : 'baseline' }
BaselineOfGToolkitInstaller >> baseline: spec [
	<baseline>
	spec for: #'common' do: [ spec package: 'GToolkit-LibraryInstaller' ].

]
