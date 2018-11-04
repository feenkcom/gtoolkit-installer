Extension { #name : #WinPlatform }

{ #category : #'*GToolkit-LibraryInstaller' }
WinPlatform >> gtLibraryInstallerPlatform [
	<return: #GtLibraryInstallerPlatform>

	^ GtLibraryInstallerWindows new
]
