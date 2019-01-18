Class {
	#name : #GtLibraryInstallerValidationStep,
	#superclass : #GtLibraryInstallerStep,
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #initialization }
GtLibraryInstallerValidationStep >> defaultTitle [
	^ 'Validation'
]

{ #category : #running }
GtLibraryInstallerValidationStep >> doActionIn: anInstaller [
	
	"log VM stats to stdout"
	NonInteractiveTranscript stdout cr.
	(String streamContents: [ :aStream | SystemReporter new reportVMStats: aStream ])
		linesDo: [ :each | NonInteractiveTranscript stdout show: each; cr ].
	NonInteractiveTranscript stdout cr.

	self logCr: '
=====================================================
=============== GToolkit Installer ==================
=====================================================
'.

	self logCr: 'Library is already installed:'.
	anInstaller doesWork
		ifTrue: [ self logCr: String tab, ' - yes' ]
		ifFalse: [ self logCr: String tab, ' - no' ].

	"Library already exists and running, no need to install it again"
	anInstaller isRunning
		ifTrue: [ ^ GtLibraryInstallerErrorAlreadyInstalled signal ]
]
