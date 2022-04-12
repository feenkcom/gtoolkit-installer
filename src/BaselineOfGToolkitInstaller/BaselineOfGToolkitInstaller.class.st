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
				spec repository: 'github://feenkcom/pharo-beacon:d9b5ea5ea796d8de032c693fe555f182754be5ff/repository' ].

		spec package: 'GToolkit-LibraryInstaller' with: [
			spec requires: #('Beacon') ].
	]
]
