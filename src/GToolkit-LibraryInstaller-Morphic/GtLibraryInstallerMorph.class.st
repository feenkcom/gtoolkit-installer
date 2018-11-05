"
Top most container of the whole installer
"
Class {
	#name : #GtLibraryInstallerMorph,
	#superclass : #GLMBrick,
	#instVars : [
		'lastUpdate',
		'stepBrick',
		'installer',
		'logger'
	],
	#category : #'GToolkit-LibraryInstaller-Morphic'
}

{ #category : #opening }
GtLibraryInstallerMorph >> closeWindow [
	self window
		ifNil: [ self delete ]
		ifNotNil: [ :aWindow | aWindow close ]
]

{ #category : #initialization }
GtLibraryInstallerMorph >> initialize [
	super initialize.
	
	lastUpdate := 0.
	
	self hSpaceFill.
	self vSpaceFill.
	self useHorizontalLinearLayout.
	self color: Smalltalk ui theme backgroundColor.
	self padding: 4.
	self borderWidth: 4.
	self borderColor: Smalltalk ui theme borderColor
]

{ #category : #initialization }
GtLibraryInstallerMorph >> initializeBricks [
	| aLogoContainer aSpartaLabel aStepList aListContainer aSpartaLogo aCloseButton |
	self
		assert: [ installer isNotNil ]
		description: [ 'Program must not be nil' ].

	aSpartaLogo := GLMActionButtonBrick new.
	aSpartaLogo icon: self installer icon.
	aSpartaLogo vShrinkWrap.

	aSpartaLabel := GLMLabelBrick new.
	aSpartaLabel text: self installer libraryName.
	aSpartaLabel vAlign: #center.
	aSpartaLabel fontSize: 15. 
	aSpartaLabel hSpaceFill.
	aSpartaLabel vShrinkWrap.

	aLogoContainer := GLMBrick new.
	aLogoContainer useHorizontalLinearLayout.
	aLogoContainer hSpaceFill.
	aLogoContainer vShrinkWrap.
	aLogoContainer padding: 5.

	aLogoContainer addAllBricks: { aSpartaLogo . aSpartaLabel }.

	aStepList := self newStepList.
	aStepList installer: self installer.
	aStepList hSpaceFill: 90.
	aStepList vSpaceFill.

	aListContainer := GLMBandBrick new.
	aListContainer width: 210.
	aListContainer vSpaceFill.
	aListContainer zIndex: 2.
	
	aCloseButton := GLMButtonBrick new.
	aCloseButton
		text: 'Close';
		hShrinkWrap;
		vShrinkWrap;
		margin:10;
		when: #onClicked do: [ self closeWindow ].

	aListContainer addAllBricks: { aLogoContainer . aStepList . aCloseButton }.

	stepBrick := self newStepBrick.
	stepBrick useHorizontalLinearLayout.
	stepBrick hSpaceFill.
	stepBrick vSpaceFill.
	stepBrick marginLeft: 0.
	stepBrick paddingLeft: 0.
	
	self addAllBricks: { aListContainer . stepBrick }
]

{ #category : #accessing }
GtLibraryInstallerMorph >> installer [
	^ installer
]

{ #category : #accessing }
GtLibraryInstallerMorph >> installer: anObject [
	installer := anObject.
	
	installer when: #flush send: #updateNow to: self.

	installer when: GtLibraryInstallerStepAnnouncement send: #stepSwitched: to: self.
	
	installer when: GtLibraryInstallerErrorAnnouncement send: #showError: to: self.
	installer when: GtLibraryInstallerLogAnnouncement send: #showLog: to: self.
	
	installer when: GtLibraryInstallerProgressAnnouncement send: #showProgress: to: self.
	installer when: GtLibraryInstallerSuccessAnnouncement send: #showSuccess: to: self.
	installer when: GtLibraryInstallerDoneAnnouncement send: #closeWindow to: self.

	self removeAllBricks.
	self initializeBricks
]

{ #category : #'change reporting' }
GtLibraryInstallerMorph >> invalidRect: aRectangle from: aMorph [
	
	super invalidRect: aRectangle from: aMorph.
	
	self update
]

{ #category : #'instance creation' }
GtLibraryInstallerMorph >> newStepBrick [
	^ GLMBrick new
]

{ #category : #'instance creation' }
GtLibraryInstallerMorph >> newStepList [
	^ GtLibraryInstallerStepListBrick new
]

{ #category : #opening }
GtLibraryInstallerMorph >> openInBorderlessWindow [
	^ (self asBrickedMorph gtInstallerOpenInWindowAt: World width @28)
		setProperty: #morphicLayerNumber toValue: SmallInteger minVal;
		makeBorderless;
		setToAdhereToEdge: #right;
		beWithoutGrips;
		removeLabelArea
]

{ #category : #opening }
GtLibraryInstallerMorph >> openInWindow [
	^ self asBrickedMorph gtInstallerOpenInWindowAt: 0@0
]

{ #category : #'ui - updating' }
GtLibraryInstallerMorph >> showError: anEvent [
	| aBrick |
	
	aBrick := GtLibraryInstallerErrorBrick new
		hSpaceFill;
		vSpaceFill;
		error: anEvent error.
		
	self updateWith: aBrick
]

{ #category : #'ui - updating' }
GtLibraryInstallerMorph >> showLog: anEvent [

	logger := (logger isNil or: [ logger textBrick hasOwner not ])
		ifTrue: [
			| aLogger |
			aLogger := GtLibraryInstallerMorphLogger new.
			self updateWith: aLogger textBrick.
			aLogger ]
		ifFalse: [ logger ].
	
	logger nextPutAll: anEvent message.
	self updateNow
]

{ #category : #'ui - updating' }
GtLibraryInstallerMorph >> showProgress: anEvent [
	| aProgress aMessage aContainer aLabel progressBrick |
	
	aProgress := anEvent progress.
	aMessage := anEvent message.

	self allSubbricksDo: [ :eachBrick |
		(eachBrick isKindOf: GtLibraryInstallerProgressBrick)
			ifTrue: [
				eachBrick progress: aProgress.
				^ self ] ].

	aContainer := GLMBandBrick new.
	aContainer margin: 20.
	aContainer hSpaceFill.
	aContainer vAlign: #center.
	
	aLabel := GLMLabelBrick new.
	aLabel text: aMessage asString.
	aLabel hSpaceFill.
	aLabel marginBottom: 5.
	
	progressBrick := GtLibraryInstallerProgressBrick new.
	progressBrick hSpaceFill.
	progressBrick height: 4.
	progressBrick marginTop: 5.
	progressBrick color: Color veryVeryLightGray.
	progressBrick progressColor: Color lightGray.
	
	progressBrick progress: aProgress asFloat.

	aContainer addAllBricks: { aLabel . progressBrick }.

	self updateWith: aContainer
]

{ #category : #'ui - updating' }
GtLibraryInstallerMorph >> showSuccess: anEvent [
	| aBrick |
	
	aBrick := GLMStringBrick new
		text: anEvent message;
		fontSize: 20;
		textColor: Color gray;
		hAlign: #center;
		vAlign: #center;
		hShrinkWrap;
		vSpaceFill;
		yourself.
		
	self updateWith: aBrick
]

{ #category : #accessing }
GtLibraryInstallerMorph >> stepBrick [
	^ stepBrick
]

{ #category : #'ui - updating' }
GtLibraryInstallerMorph >> stepSwitched: anAnnouncement [
	self updateWith: GLMBrick new.
	logger := nil
]

{ #category : #'private - ui' }
GtLibraryInstallerMorph >> update [
	| msRefreshRate isTimeForRefresh |

	msRefreshRate := 60 "roughly 16 times per second".
	isTimeForRefresh := Time millisecondClockValue - lastUpdate >= msRefreshRate.
	(self isInWorld and: [ isTimeForRefresh ])
		ifFalse: [ ^ self ].
	
	self updateNow
]

{ #category : #'private - ui' }
GtLibraryInstallerMorph >> updateNow [	
	"We may be blocking the UI thread, and thus have to draw the world ourselves when necessary"
	
	lastUpdate := Time millisecondClockValue.
	UIManager default uiProcess == Processor activeProcess
		ifTrue: [ self currentWorld doOneCycleNow ]
]

{ #category : #'private - ui' }
GtLibraryInstallerMorph >> updateWith: aBrick [
	"Update the main information pane with a given brick"
	self stepBrick removeAllBricks.
	self stepBrick addBrickBack: aBrick.
	self updateNow
]
