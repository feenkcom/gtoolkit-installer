Class {
	#name : #BaselineOfGToolkitInstallerMorphic,
	#superclass : #BaselineOf,
	#category : #BaselineOfGToolkitInstallerMorphic
}

{ #category : #baseline }
BaselineOfGToolkitInstallerMorphic >> baseline: spec [
	<baseline>
	spec for: #'common' do: [
		spec 
			baseline: 'GToolkitInstaller' with: [ 
				spec repository: 'github://feenkcom/gtoolkit-installer/src' ].
		spec 
			package: 'GToolkit-LibraryInstaller-Morphic' with: [
				spec requires: #('GToolkitInstaller' ). ]. ].

]
