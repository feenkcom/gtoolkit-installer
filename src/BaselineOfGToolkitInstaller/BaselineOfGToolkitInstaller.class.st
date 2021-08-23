Class {
	#name : 'BaselineOfGToolkitInstaller',
	#superclass : 'BaselineOf',
	#category : 'BaselineOfGToolkitInstaller'
}

{ #category : 'baseline' }
BaselineOfGToolkitInstaller >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec
			baseline: 'Beacon' with: [
				spec repository: 'github://feenkcom/pharo-beacon:e0669184913a76cfffca4eaecb7de025a3e65861/repository' ].

		spec package: 'GToolkit-LibraryInstaller' with: [
			spec requires: #('Beacon') ].
	]
]
