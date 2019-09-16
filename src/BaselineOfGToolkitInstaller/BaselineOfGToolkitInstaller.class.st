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
				spec repository: 'github://feenkcom/pharo-beacon:e5c91f9a77cb675d60ab54c758add457eaefb9c4/repository' ].
		spec 
			package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ];
			package: 'GToolkit-LibraryInstaller-Morphic' with: [
				spec requires: #('GToolkit-LibraryInstaller' ). ]. ].

]
