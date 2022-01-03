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
				spec repository: 'github://feenkcom/pharo-beacon:381db2ac12df5c0693090a864ee70ba35a92326c/repository' ].

		spec package: 'GToolkit-LibraryInstaller' with: [
			spec requires: #('Beacon') ].
	]
]
