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
				spec repository: 'github://feenkcom/pharo-beacon:e6ab3f630bfd7e09dc4e983c9b094e62f44c817c/repository' ].
		spec 
			package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ];
			package: 'GToolkit-LibraryInstaller-Morphic' with: [
				spec requires: #('GToolkit-LibraryInstaller' ). ]. ].

]
