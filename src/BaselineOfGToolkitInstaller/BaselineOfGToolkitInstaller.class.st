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
				spec repository: 'github://feenkcom/pharo-beacon:9e869fd8b59bab452f31739cf52e615954b6ead3/repository' ].
		spec 
			package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ];
			package: 'GToolkit-LibraryInstaller-Morphic' with: [
				spec requires: #('GToolkit-LibraryInstaller' ). ]. ].

]
