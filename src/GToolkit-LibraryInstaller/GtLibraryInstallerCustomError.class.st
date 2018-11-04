Class {
	#name : #GtLibraryInstallerCustomError,
	#superclass : #GtLibraryInstallerError,
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerCustomError >> defaultHelp [
	^ ''
]

{ #category : #initialization }
GtLibraryInstallerCustomError >> defaultMessage [
	^ ''
]

{ #category : #accessing }
GtLibraryInstallerCustomError >> help: aText [
	super help: String cr asText, aText, String cr
]

{ #category : #accessing }
GtLibraryInstallerCustomError >> message: aText [
	messageText := aText
]
