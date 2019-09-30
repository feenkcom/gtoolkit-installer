Class {
	#name : #BaselineOfGToolkitInstaller,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitInstaller
}

{ #category : #baseline }
BaselineOfGToolkitInstaller >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec baseline: 'Beacon' with: [
				spec repository: 'github://feenkcom/pharo-beacon:356e472e1d355e3a38054f1e6db42ab1ee95f472/repository' ].
		spec 
			package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ];
			package: 'GToolkit-LibraryInstaller-Morphic' with: [
				spec requires: #('GToolkit-LibraryInstaller' ). ]. ].

]
