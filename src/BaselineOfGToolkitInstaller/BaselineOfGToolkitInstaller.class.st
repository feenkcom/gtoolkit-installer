Class {
	#name : #BaselineOfGToolkitInstaller,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitInstaller
}

{ #category : #baselines }
BaselineOfGToolkitInstaller >> baseline: spec [
	<baseline>
	spec for: #common do: [ 
		spec
		   baseline: 'Beacon' with: [ spec repository: 'github://pharo-project/pharo-beacon/repository' ];
			package: 'GToolkit-LibraryInstaller' with: [ spec requires: #(Beacon) ];
			package: 'GToolkit-LibraryInstaller-Morphic' with: [ spec requires: #('GToolkit-LibraryInstaller') ] ]
]
