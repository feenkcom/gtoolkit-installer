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
	self debugLogCr: 'Downloading ', anInstaller generateUrl, ' to ', downloadFilename asString, ' ...'.

	 [
		| previousProgress |	
		previousProgress := 0.

		[
			self debugLog: String cr, 'Progress '.
			ZnClient new
				url: anInstaller generateUrl;
				signalProgress: true;
				numberOfRetries: 5;
				timeout: 100;
				logToTranscript;
				downloadTo: downloadFilename.

			self debugLog: ' Done!' ]
		on: HTTPProgress
		do: [ :progress |
			(progress isEmpty not and: [ progress fraction asFloat > (previousProgress + 0.05) ])
				ifTrue: [
					previousProgress := progress fraction asFloat.
					self debugLog: '.'.

					anInstaller announce: (GtLibraryInstallerProgressAnnouncement new
						progress: progress fraction asFloat ;
						message: 'Downloading ', anInstaller libraryName ,'...')].

			progress resume ]
		
		]
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
