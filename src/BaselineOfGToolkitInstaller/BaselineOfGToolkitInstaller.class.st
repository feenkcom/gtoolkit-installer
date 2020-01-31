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
				spec repository: 'github://feenkcom/pharo-beacon:38cb3436c9593de5abd580b8bb23d06753afdb33/repository' ].
		spec package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ]. ].

]
