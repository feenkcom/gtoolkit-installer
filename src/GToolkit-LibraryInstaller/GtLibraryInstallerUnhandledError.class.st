Class {
	#name : #GtLibraryInstallerUnhandledError,
	#superclass : #GtLibraryInstallerError,
	#instVars : [
		'error'
	],
	#category : #'GToolkit-LibraryInstaller-Errors'
}

{ #category : #initialization }
GtLibraryInstallerUnhandledError >> defaultHelp [
	| email github |

	email := 'YWxleC5zeXJlbEBnbWFpbC5jb20=' base64Decoded asString asText allBold.
	github := 'https://github.com/syrel/Sparta/issues' asText allBold.

	^ '
Unknown error... Please copy the whole text
 - and send it to ' asText, email,'
 - or open a bug report ', github
]

{ #category : #initialization }
GtLibraryInstallerUnhandledError >> defaultMessage [
	^ ''
]

{ #category : #accessing }
GtLibraryInstallerUnhandledError >> error: anError [
	error := anError.

	self messageText: anError description
]

{ #category : #accessing }
GtLibraryInstallerUnhandledError >> stack [
	^ error signalerContext stack
]
