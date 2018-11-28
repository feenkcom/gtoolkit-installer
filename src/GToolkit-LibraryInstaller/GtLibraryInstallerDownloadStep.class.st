Class {
	#name : #GtLibraryInstallerDownloadStep,
	#superclass : #GtLibraryInstallerStep,
	#category : #'GToolkit-LibraryInstaller-Model - Steps'
}

{ #category : #initialization }
GtLibraryInstallerDownloadStep >> defaultTitle [
	^ 'Download'
]

{ #category : #running }
GtLibraryInstallerDownloadStep >> doActionIn: anInstaller [
	| destinationFolder downloadFilename |
	
	destinationFolder := anInstaller destinationFolder asFileReference.
	self ensureDestinationFolder: destinationFolder.
	
	downloadFilename := anInstaller downloadedFilePath.
	NonInteractiveTranscript stdout cr; show: 'Downloading ', anInstaller generateUrl, ' to ', downloadFilename asString, ' ...'; cr.
	
	 [
		| previousProgress |	
		previousProgress := 0.

		[ ZnClient new
			url: anInstaller generateUrl;
			signalProgress: true;
			numberOfRetries: 3;
			timeout: 42; "timeout 42 seconds"
			downloadTo: downloadFilename.
			NonInteractiveTranscript stdout cr. ]
		on: HTTPProgress
		do: [ :progress |
			(progress isEmpty not and: [ progress fraction asFloat > (previousProgress + 0.05) ])
				ifTrue: [
					previousProgress := progress fraction asFloat.
					anInstaller announce: (GtLibraryInstallerProgressAnnouncement new
						progress: progress fraction asFloat ;
						message: 'Downloading Moz2D...') ].

			progress resume ] ]
				on: NameLookupFailure
				do: [ :anError | GtLibraryInstallerCustomError new message: anError messageText capitalized; help: 'Double check your internet connection and try again'; signal ]
]

{ #category : #private }
GtLibraryInstallerDownloadStep >> ensureDestinationFolder: aFileReference [

	(aFileReference isDirectory or: [ aFileReference exists not ]) ifFalse: [ 
		^ GtLibraryInstallerCustomError new
				message: 'Destination must be a directory';
				help: 'Check your installer configuration';
				signal ].

	aFileReference asFileReference = Smalltalk imageDirectory asFileReference
		ifTrue: [
			^ GtLibraryInstallerCustomError new
				message: 'Destination folder must not be the same as image directory';
				help: 'Check your installer configuration';
				signal ].
			
	(aFileReference asFileReference containsPath: Smalltalk imageDirectory asFileReference fullPath)
		ifTrue: [
			^ GtLibraryInstallerCustomError new
				message: 'Destination folder must not be the same as image directory';
				help: 'Check your installer configuration';
				signal ].

	aFileReference exists
		ifTrue: [ aFileReference deleteAll ].
	
	aFileReference exists
		ifTrue: [ ^ (GtLibraryInstallerErrorLocalDirectoryExists new directory: aFileReference) signal ].
	
	aFileReference createDirectory.	
	
	aFileReference exists
		ifFalse: [ ^ (GtLibraryInstallerErrorCanNotCreateLocalDirectory new directory: aFileReference) signal ]
]
