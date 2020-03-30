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
				spec repository: 'github://feenkcom/pharo-beacon:6dc8bb30429f355574f82a52b9fa33b465cab7f4/repository' ].
		spec package: 'GToolkit-LibraryInstaller' with: [
				spec requires: #(#Beacon ). ]. ].

]
