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
				spec repository: 'github://feenkcom/pharo-beacon:82c0ed0251c99915441db32d21c9365585c2317c/repository' ].
		spec 
			package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ];
			package: 'GToolkit-LibraryInstaller-Morphic' with: [
				spec requires: #('GToolkit-LibraryInstaller' ). ]. ].

]
