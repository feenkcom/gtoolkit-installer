Class {
	#name : #GtLibraryInstallerUrlStencil,
	#superclass : #Object,
	#instVars : [
		'library',
		'platform',
		'version',
		'arch',
		'binary',
		'extension',
		'formatter'
	],
	#category : #'GToolkit-LibraryInstaller-Model'
}

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> arch [
	^ arch
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> arch: anObject [
	arch := anObject
]

{ #category : #converting }
GtLibraryInstallerUrlStencil >> asDictionary [
	^ { 
		#library -> library.
		#platform -> platform.
		#arch -> arch.
		#version -> version.
		#binary -> binary.
		#extension -> extension
	 } asDictionary
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> binary [
	^ binary
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> binary: anObject [
	binary := anObject
]

{ #category : #'api - instantiation' }
GtLibraryInstallerUrlStencil >> create [
	<return: #String>
	
	self formatter isString
		ifTrue: [ ^ self formatter format: self asDictionary ].
	
	self formatter isBlock
		ifTrue: [ ^ self formatter valueWithArguments: self asDictionary values ].

	^ 	self library, '/',
		self platform, '/',
		self version, '/',
		self arch, '/',
		self binary, '.',
		self extension
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> extension [
	^ extension
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> extension: anObject [
	extension := anObject
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> formatter [
	^ formatter
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> formatter: anObject [
	formatter := anObject
]

{ #category : #initialization }
GtLibraryInstallerUrlStencil >> initialize [
	super initialize.
	
	formatter := nil
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> library [
	^ library
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> library: anObject [
	library := anObject
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> platform [
	^ platform
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> platform: anObject [
	platform := anObject
]

{ #category : #evaluating }
GtLibraryInstallerUrlStencil >> valueWithArguments: theArguments [
	self library: theArguments first.
	self platform: theArguments second.
	self arch: theArguments third.
	self version: theArguments fourth.
	self binary: theArguments fifth.
	self extension: theArguments sixth.

	^ self create
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> version [
	^ version
]

{ #category : #accessing }
GtLibraryInstallerUrlStencil >> version: anObject [
	version := anObject
]
