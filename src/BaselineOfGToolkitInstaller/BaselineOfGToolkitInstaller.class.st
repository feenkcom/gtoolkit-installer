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
				spec repository: 'github://feenkcom/pharo-beacon:740e7b334360eeee66646d14bfeebef28fd72799/repository' ].

		spec package: 'GToolkit-LibraryInstaller' with: [
			spec requires: #('Beacon') ].
	]
]
