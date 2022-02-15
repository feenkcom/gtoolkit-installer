Class {
	#name : #BaselineOfGToolkitInstaller,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitInstaller
}

{ #category : #baseline }
BaselineOfGToolkitInstaller >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'Beacon' with: [
				spec repository: 'github://feenkcom/pharo-beacon:7bf686dbffb21f310edaaa16c1588a444d09fb37/repository' ].

		spec package: 'GToolkit-LibraryInstaller' with: [
			spec requires: #('Beacon') ].
	]
]
