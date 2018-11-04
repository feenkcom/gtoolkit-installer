Class {
	#name : #GtLibraryInstallerWindow,
	#superclass : #SystemWindow,
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #layout }
GtLibraryInstallerWindow >> layoutBounds [
	self perform: #layoutBounds withArguments: #() inSuperclass: Morph
]
