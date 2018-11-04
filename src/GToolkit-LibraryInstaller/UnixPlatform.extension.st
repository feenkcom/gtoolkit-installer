Extension { #name : #UnixPlatform }

{ #category : #'*GToolkit-LibraryInstaller' }
UnixPlatform >> gtLibraryInstallerPlatform [
	<return: #GtLibraryInstallerPlatform>

	^ GtLibraryInstallerLinux new
]
