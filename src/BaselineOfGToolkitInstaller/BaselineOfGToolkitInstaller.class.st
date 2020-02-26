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
				spec repository: 'github://feenkcom/pharo-beacon:12ccdd418e939ee64d3ebdcfb75c5e3c5a2ce199/repository' ].
		spec package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ]. ].

]
