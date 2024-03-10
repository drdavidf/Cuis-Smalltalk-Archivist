'From Cuis6.3 [latest update: #6253] on 10 March 2024 at 11:33:06 pm'!
'Description '!
!provides: 'Archivist' 1 108!
!requires: 'PostgresAdapter' 1 62 nil!
!requires: 'UI-Mold' 1 15 nil!
!requires: 'LayoutAlgebra' 1 4 nil!
SystemOrganization addCategory: #Archivist!


!classDefinition: #ArchivistCacheModel category: #Archivist!
TextProvider subclass: #ArchivistCacheModel
	instanceVariableNames: 'settings connection cache selection incomingSelectionIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchivistCacheModel class' category: #Archivist!
ArchivistCacheModel class
	instanceVariableNames: ''!

!classDefinition: #NonDeterministicChoice category: #Archivist!
OrderedCollection subclass: #NonDeterministicChoice
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'NonDeterministicChoice class' category: #Archivist!
NonDeterministicChoice class
	instanceVariableNames: ''!

!classDefinition: #ArchiLinkMorph category: #Archivist!
LayoutMorph subclass: #ArchiLinkMorph
	instanceVariableNames: 'button entry model navigator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchiLinkMorph class' category: #Archivist!
ArchiLinkMorph class
	instanceVariableNames: ''!

!classDefinition: #MoldScrollPane category: #Archivist!
PluggableScrollPane subclass: #MoldScrollPane
	instanceVariableNames: 'mold objectGetter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'MoldScrollPane class' category: #Archivist!
MoldScrollPane class
	instanceVariableNames: ''!

!classDefinition: #ArchivistCacheWindow category: #Archivist!
SystemWindow subclass: #ArchivistCacheWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchivistCacheWindow class' category: #Archivist!
ArchivistCacheWindow class
	instanceVariableNames: ''!

!classDefinition: #ArchiDiff category: #Archivist!
Object subclass: #ArchiDiff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchiDiff class' category: #Archivist!
ArchiDiff class
	instanceVariableNames: ''!

!classDefinition: #ArchiLink category: #Archivist!
Object subclass: #ArchiLink
	instanceVariableNames: 'model src dst label'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchiLink class' category: #Archivist!
ArchiLink class
	instanceVariableNames: ''!

!classDefinition: #ArchivistCache category: #Archivist!
Object subclass: #ArchivistCache
	instanceVariableNames: 'connection vobjects fresh next expires'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchivistCache class' category: #Archivist!
ArchivistCache class
	instanceVariableNames: ''!

!classDefinition: #KeyHolder category: #Archivist!
Object subclass: #KeyHolder
	instanceVariableNames: 'key dict'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'KeyHolder class' category: #Archivist!
KeyHolder class
	instanceVariableNames: ''!

!classDefinition: #VersionedEntity category: #Archivist!
Object subclass: #VersionedEntity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'VersionedEntity class' category: #Archivist!
VersionedEntity class
	instanceVariableNames: ''!

!classDefinition: #RealizedEntity category: #Archivist!
VersionedEntity subclass: #RealizedEntity
	instanceVariableNames: 'oid rid dirty'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'RealizedEntity class' category: #Archivist!
RealizedEntity class
	instanceVariableNames: ''!

!classDefinition: #VersionedObject category: #Archivist!
RealizedEntity subclass: #VersionedObject
	instanceVariableNames: 'slots description in out'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'VersionedObject class' category: #Archivist!
VersionedObject class
	instanceVariableNames: ''!

!classDefinition: #VersionedObjectStub category: #Archivist!
VersionedEntity subclass: #VersionedObjectStub
	instanceVariableNames: 'oid cache in'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'VersionedObjectStub class' category: #Archivist!
VersionedObjectStub class
	instanceVariableNames: ''!

!classDefinition: #AsciiStringField category: #Archivist!
Field subclass: #AsciiStringField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'AsciiStringField class' category: #Archivist!
AsciiStringField class
	instanceVariableNames: ''!

!classDefinition: #LinkField category: #Archivist!
Field subclass: #LinkField
	instanceVariableNames: 'model navigator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'LinkField class' category: #Archivist!
LinkField class
	instanceVariableNames: ''!


!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/9/2024 23:30:54'!
addSlotToSelectedObject: aString default: anObject
	
	anObject 
		ifNil:[ self assert: (selection outgoing includesKey: aString) not. 
			selection linkAt: aString put: nil ] 
	
		ifNotNil:[ 	selection slots at: aString asSymbol put: anObject ].
	
	selection dirty: true.
	
	self selectionIndex: self selectionIndex.
	
	! !

!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/8/2024 13:07:09'!
openAddSlotDialog
	
 | mold  defaults |

	defaults := OrderedDictionary new.
	
	{#Link -> nil . #Integer -> 0 . #Float -> 0.0 . #String -> '' . #Boolean -> true . #Date -> Date today . #Time -> Time now } do: [:each | defaults at: each key put: each value ].
	
	mold := Mold new.
	
	(mold stringField)
		label: 'Name';
		on: #propertyValue of: ValueHolder new;
		beRequired.
	(mold selectField)
		label: 'Type';
		on: #listIndex of: (ListModel with: defaults keys :: listIndex: 1) ;
		beRequired.

	mold when: #edited evaluate:[ self addSlotToSelectedObject: (mold fields at:1) value default: (defaults at: (mold fields at:2) value) ].
	
	mold openDialog: 'Add a slot'.
	
	! !

!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/9/2024 23:30:54'!
openRemoveSlotDialog
	
 | mold  |

	mold := Mold new.
	
	(mold selectField)
		label: 'Type';
		on: #listIndex of: (ListModel with: selection slots keys :: listIndex: 1) ;
		beRequired.

	mold when: #edited evaluate:[ self removeSlotFromSelectedObject: (mold fields at:1) value ].
	
	mold openDialog: 'Remove a slot'.
	
	! !

!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/7/2024 20:52:05'!
removeSlotFromSelectedObject: aString 

	selection removeSlotAt: aString.
	
	selection dirty: true.
	
	self selectionIndex: self selectionIndex.
	
	! !

!ArchivistCacheModel methodsFor: 'accessing' stamp: 'DF 3/8/2024 16:05:55'!
cache
	^cache! !

!ArchivistCacheModel methodsFor: 'accessing' stamp: 'DF 2/26/2024 22:27:11'!
cache: anArchivistCache

	cache := anArchivistCache.
	
! !

!ArchivistCacheModel methodsFor: 'accessing' stamp: 'DF 3/8/2024 12:11:07'!
connection: aPgClientConnection
	connection := aPgClientConnection ! !

!ArchivistCacheModel methodsFor: 'accessing' stamp: 'DF 3/8/2024 12:20:09'!
settings: aDictionary

	settings := aDictionary ! !

!ArchivistCacheModel methodsFor: 'initialization' stamp: 'DF 3/8/2024 12:37:17'!
initialize

	incomingSelectionIndex := 0.! !

!ArchivistCacheModel methodsFor: 'updating' stamp: 'DF 3/9/2024 22:03:25'!
changed

	self changed: #cacheState; changed: #oidDisplayList; changed: #description ; changed: #incoming ; changed: #outgoing ; changed: #selectionDetails ; changed: #slots! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 19:11:11'!
cacheState

	^'cache has {1} resident objects, {2} new objects, {3} modified objects. updated on {4} at {5}' format:{ cache old size . cache fresh size . cache dirtySize . cache expires date . cache expires time } ! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/3/2024 20:37:06'!
commit: aText

	cache checkin: aText asString.
	
	self changed: #oidDisplayList ; changed: #selectionDetails! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:05:50'!
connectionStatus
	
	connection ifNil:[^'Uninitialized'].
	
	connection isConnected ifFalse:[^'Not connected'].

	^'Session {1} connected as {2} to database {3} on host {4} at port {5}.' format:{ connection session. settings at:#user . settings at: #database .  settings at: #host . settings at: #port }.
	
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 15:29:53'!
description

	selection ifNil:[^''].
	
	selection isRealized :: ifFalse: [^''].

	^selection description! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 18:16:34'!
description: aString

	selection ifNil:[^false].
	
	selection isRealized :: ifFalse: [^false].

	selection description: aString.
	
	self changed: #oidDisplayList ; changed: #cacheState.
	
	^true
! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 12:09:23'!
incoming

	| pairs |
	
	selection ifNil:[^{}].
	
	selection isObject ifFalse:[^''].

	pairs := selection incoming collect:[:each | each oid -> (each linkName: selection oid)  ] :: asOrderedCollection sort:[:x : y | x key <= y key ].
	
	^ pairs collect:[:each | '{1} ({2})' format: { each value . each key } ].! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 16:34:04'!
incomingSelectionIndex

	^0! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 23:19:56'!
incomingSelectionIndex: anInteger

	| oids |
	
	oids := selection incoming collect:[:each | each oid ] :: asOrderedCollection sort:[:x : y | x <= y ].

	self navigateTo: (oids at: anInteger).! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 16:48:14'!
mergeLatestChanges

	cache mergeLatestChanges.
	
	self changed.
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 23:20:21'!
navigateTo: oid

	self assert: oid notNil.
	
	selection :=  cache resolve: oid.
	
	self changed.! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 19:41:51'!
oidDisplayList
	
	| oids |
	
	oids := (cache old values , cache fresh values ) collect:[:each | 		| prefix | 
		prefix := each dirty ifTrue:['*'] ifFalse:[''].
		each oid -> (prefix, each oid asString) ].
		
	^ (oids sort: [:x :y | x key <= y key]) collect:[:each | each value ]! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:26:51'!
oids
	
	| oids |
	
	oids := cache old keys , cache fresh keys.
		
	^oids sort! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 12:31:09'!
outgoing
	selection ifNil:[^Dictionary new].
	
	selection isRealized ifFalse:[^Dictionary new].

	^selection outgoing collect:[:each | each value ifNil:[0] ifNotNil:[each oid] ].! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:09:13'!
reconnect
	
	connection ifNotNil:[connection close].
	
	connection := PgClient newFrom: settings.
	
	cache connection: connection.
	
	connection connect.

	self changed: #connectionStatus.! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:02:10'!
resolve: aValueHolder

	| vobj |
	
	vobj := cache resolve: aValueHolder propertyValue.
	
	selection := vobj.
	
	self changed.
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 15:04:41'!
selectionDetails

	selection ifNil:[^''].
	
	^selection details! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:18:46'!
selectionIndex

	| oids |
	
	selection ifNil:[^0].

	oids := self oids.
	
	^ oids indexOf: selection oid! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 12:38:37'!
selectionIndex: anInteger

	| oids |
	
	anInteger = 0 ifFalse:[
	
		oids := self oids.
	
		selection :=  cache resolve: (oids at: anInteger).
		
		incomingSelectionIndex := 0.
	].
	
	self changed
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 23:30:54'!
slots

	| aDictionary |
	
	selection ifNil:[^JsonObject new].
	
	selection isRealized ifFalse:[^JsonObject new].
	
	aDictionary := OrderedDictionary new addAll: selection slots associations ; yourself.
	
	aDictionary addAll: (selection outgoing associations collect:[:each | | v | 
		v := each value ifNil:[0] ifNotNil:[each value oid].		
		
		each key -> (ArchiLink new model: self ; src: selection; label: each key; dst: v ; yourself) ]).
	
	^aDictionary
! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2024 22:21:35'!
updateSlots
	
	self assert: selection notNil.
	
	selection dirty: true.
	
	self changed: #oidDisplayList ; changed: #selectionDetails! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/2/2024 19:36:40'!
cloneSelectedObject

	selection ifNil:[^self].
	
	selection := cache clone: selection.
	
	self selectionIndex: self selectionIndex. "not terribly efficient but this way we have just one place that sends  change messages"
	
	
	
	! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/7/2024 12:20:26'!
deleteSelectedObject

	selection ifNil:[^self].
	
	cache delete: selection.
	
	selection := nil.
	
	self selectionIndex: self selectionIndex. "not terribly efficient but this way we have just one place that sends  change messages"
	
	
	
	! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/9/2024 23:30:54'!
fetchSelectedObject

	selection ifNil:[^self].
	
	selection isRealized ifTrue:[^self].
	
	selection slots. "force the stub to fetch itself from the db"
	
	self selectionIndex: self selectionIndex.! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/9/2024 20:39:59'!
openConnectionDialog
	
	|mold|
	
	mold := Mold new .
	
	(mold fields add: AsciiStringField new) label:'Host name' ; 	on: #valueAtKey of: 
		(KeyHolder on: settings at: #host); beRequired.
	(mold integerField) label:'Port number' ; on: #valueAtKey of: 
		(KeyHolder on: settings at: #port); beRequired.
	(mold fields add: AsciiStringField new) label:'Database name' ; on: #valueAtKey of: 
		(KeyHolder on: settings at: #database); beRequired.
	(mold fields add: AsciiStringField new) label:'User name' ; on: #valueAtKey of: 
		(KeyHolder on: settings at: #user); beRequired.
	(mold fields add: AsciiStringField new) label:'Password' ; on: #valueAtKey of: 
		(KeyHolder on: settings at: #password); beRequired.
	(mold integerField) label:'Timeout' ; on: #valueAtKey of: 
		(KeyHolder on: settings at: #timeout); beRequired.
	
	mold fields do:[:each | each 		customize:[:w :i :e | i borderColor: Color veryLightGray ] ].

	mold when: #edited send: #reconnect to: self.
	
	mold openDialog: 'Connect to server'.
	! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/9/2024 22:01:31'!
openResolveDialog

	|mold holder |
	
	mold := Mold new .
	
	holder := ValueHolder new.
	
	(mold integerField) label:'Object identifier' ; on: #propertyValue of: holder ; customize:[:w :i :e | i borderColor: Color veryLightGray ] ; beRequired.

	mold when: #edited send: #resolve: to: self with: holder.
	
	mold openDialog: 'Resolve object identifier'.
! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/10/2024 19:49:30'!
revertSelectedObject

	selection ifNil:[^self].
	
	selection isRealized ifFalse:[^self].
	
	cache refresh: selection oid.
	
	self changed.! !

!NonDeterministicChoice methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 22:16:47'!
addFieldOn: anObject at: aKey to: aMold
	^aMold stringField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!NonDeterministicChoice methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 23:26:41'!
dst
	^self! !

!NonDeterministicChoice methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 23:25:26'!
oid
	^self! !

!NonDeterministicChoice methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 22:18:34'!
printOn: aStream

	self at:1 :: printOn: aStream.
	
	aStream nextPutAll: ' | ' .
	
	self at: 2 :: printOn: aStream.! !

!NonDeterministicChoice methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 23:27:37'!
removeIncoming: aVersionedObject 
	! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 13:18:17'!
backgroundColor: aColor
	self color: aColor! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:15:27'!
borderColor: aColor
	
	entry borderColor: aColor! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 14:00:26'!
contents

	^entry contents! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:53:39'!
contents: anInteger
	
	entry contents: anInteger asString! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 13:17:11'!
defaultBackgroundColor
	^entry defaultBackgroundColor! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:12:47'!
initialize

	super initialize.
	
	entry := TextEntryMorph new.

	button := ButtonMorph new model: self; action: #pressed ; icon: Theme current playIcon ; color: Color gray ; selectedColor: Color lightGray ; borderColor: Color black; yourself. 

	button morphExtent: 32 @ entry morphHeight.
	
	self addMorph: (entry pw:1 ) ; addMorph: (button align: #center ).
	
	self separation: 8@0.
	
	self color: Color transparent.! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 21:47:11'!
model: anObject

	model := anObject! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:26:05'!
navigator: anArchivistCacheModel

	navigator := anArchivistCacheModel ! !

!ArchiLinkMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:26:12'!
pressed

	navigator navigateTo: (Integer readFrom: entry contents readStream)! !

!MoldScrollPane methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 13:15:32'!
getMenu

	| aMenu |
	
	aMenu := MenuMorph new defaultTarget: model.
	
	aMenu addTitle: 'Object slots'.
	aMenu addItemsFromDictionaries: {
		{
			#label 			-> 			'add slot ...'.
			#selector 		-> 			#openAddSlotDialog.
			#balloonText 	-> 			'Add a new slot to the object.'
		} asDictionary.

		{
			#label 			-> 			'remove slot ...'.
			#selector 		-> 			#openRemoveSlotDialog.
			#balloonText 	-> 			'Remove a slot from the object.'
		} asDictionary.
		
		nil.
		
		{
			#label 			-> 			'accept'.
			#object -> self.
			#selector 		-> 			#save.
			#balloonText 	-> 			'Accept the changes.'
		} asDictionary.
		
	}.
	^aMenu! !

!MoldScrollPane methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 19:21:42'!
objectGetter: aSymbol
	objectGetter := aSymbol! !

!MoldScrollPane methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:44:46'!
save

	mold validate.
	
	mold isValid ifTrue: [ mold save. model updateSlots ].! !

!MoldScrollPane methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:22:50'!
update: aSymbol

	| obj form |
	
	mold := Mold new.
	
	obj := 	model perform: objectGetter.
	
	obj keysAndValuesDo: [:key :value | ( value addFieldOn:obj at:key to: mold ) label: key ; customize:[:w :i :e | i borderColor: Color veryLightGray ] ].
	
	form := obj isEmpty ifTrue:[LabelGroup new] ifFalse:[mold renderForms].
	
	form morphExtent: self viewableWidth @ form morphHeight.
	
	self scroller: form.! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 19:44:08'!
buildMorphicWindow

self layoutMorph addMorph:

(TextModelMorph textProvider: model textGetter: #cacheState  :: pw:1.0 ; fh:18)
</>
(
	(PluggableListMorph model: model listGetter: #oidDisplayList indexGetter: #selectionIndex indexSetter: #selectionIndex: mainView: self menuGetter: #residentObjectsMenu keystrokeAction: nil :: ph:1 ; pw:(1/4))
	<+>
	(MoldScrollPane new model: model ; objectGetter: #slots ; yourself :: ph:1 ;pw:(1/2))
	<+>
	(PluggableListMorph model: model listGetter: #incoming indexGetter: #incomingSelectionIndex indexSetter: #incomingSelectionIndex: :: ph:1 ; pw:(1/4)) ph:0.3
)
</>
(TextModelMorph textProvider: model textGetter: #selectionDetails  :: pw:1.0 ; fh:18)
</>
(TextModelMorph textProvider: model textGetter: #description textSetter:#description: :: pw:1.0 ; ph:0.7)
</>
((TextModelMorph textProvider: model textGetter: #connectionStatus  :: pw:1.0 ; fh:32) + (PluggableButtonMorph model: model stateGetter: nil action: #openConnectionDialog :: label:'connect' ) fh:48) .

self setLabel:'Archivist Browser'.

! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 21:52:59'!
openCommitDialog

	| panel dh dw t cp cw |
	
	t := TextModelMorph withText: ''.
	
	panel := PluggableDialogPanel 
		open:  t 
		label: 'Commit changes'
		view: self "#yourself"
		action: [ panel delete. model commit: t text ].

	dh := FontFamily defaultFamilyAndPointSize lineSpacing.

	dw := FontFamily defaultFamilyAndPointSize widthOf:$M.

	panel morphExtent: dw * 64 @ (dh * 9).

	panel openInWorld.
	
	t focusText.
	
	cp := (panel morphPosition extent: panel morphExtent ) center. 
	
	cw := (self morphPosition extent: self morphExtent) center.
	
	panel morphPosition: panel morphPosition - (cp - cw).

! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 19:51:05'!
residentObjectsMenu

	| aMenu |
	
	aMenu := MenuMorph new defaultTarget: self.
	
	aMenu addTitle: 'Resident objects'.
	aMenu addItemsFromDictionaries: {
		{
			#label 			-> 			'commit changes ...'.
			#selector 		-> 			#openCommitDialog .
			#balloonText 	-> 			'Commit all the changes to objects that were modified since the last commit.'
		} asDictionary.
		{
			#label 			-> 			'merge latest changes'.
			#object -> model.
			#selector 		-> 			#mergeLatestChanges .
			#balloonText 	-> 			'Load the latest changes to objects resident in the cache and merge their content with the content of any modified objects.'
		} asDictionary.
		nil.
		{
			#label 			-> 			'resolve...'.
			#object -> model.
			#selector 		-> 			#openResolveDialog.
			#balloonText 	-> 			'Select an object by its oid. Fetch it from the database if it is not already in the cache.'
		} asDictionary.
		nil.
		{
			#label 			-> 			'clone'.
			#object -> model.
			#selector 		-> 			#cloneSelectedObject.
			#balloonText 	-> 			'Clone the selected object. The selected object becomes the clone''s prototype.'
		} asDictionary.

		{
			#label 			-> 			'fetch'.
			#object -> model.
			#selector 		-> 			#fetchSelectedObject.
			#balloonText 	-> 			'Replace the selected stub with the actual object.'
		} asDictionary.
		{
			#label 			-> 			'revert'.
			#object -> model.
			#selector 		-> 			#revertSelectedObject.
			#balloonText 	-> 			'Cancel any changes done to the object.'
		} asDictionary.
		{
			#label 			-> 			'delete'.
			#object -> model.
			#selector 		-> 			#deleteSelectedObject.
			#balloonText 	-> 			'Remove any links adjacent on the selected object and evict it from the cache.'
		} asDictionary.

	}.
	^aMenu! !

!ArchiDiff class methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 22:28:27'!
attributesFor: condition 
	condition == #unchanged
		ifTrue: [ 
			^ {TextEmphasis normal} ].
	condition == #removed
		ifTrue: [ 
			^ { TextColor color: (Color red). } ].
	condition == #inserted
		ifTrue: [ 
			^ {TextColor color: (Color green)} ]! !

!ArchiDiff class methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 22:32:14'!
between: aString and: anotherString

	| finder aWriteStream diff |

	finder := DifferenceFinder 	base: aString case: anotherString.

	finder compareLines; compute.

	aWriteStream := WriteStream on: '' asText.

	diff := finder differences anyOne.

	diff do: [:item :condition | | attributes |
		attributes := self attributesFor: condition.
		aWriteStream withAttributes: attributes do: [
			aWriteStream nextPutAll: item asString]		].

	^aWriteStream contents   
! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:29:06'!
addFieldOn: anObject at: aKey to: aMold

	| aLinkField |
	
	aLinkField := LinkField new on: aKey of: anObject ; yourself.
	
	aLinkField inputMorph model: anObject ; navigator: model.
	
	^aMold fields add: aLinkField! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 22:17:32'!
asUnicodeString

	^ oid asString! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:31:26'!
dst
	^dst! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:30:17'!
dst: anInteger

	dst := anInteger ! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:30:30'!
label: aString
	label := aString! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:20:40'!
model: anArchivistCacheModel
	model := anArchivistCacheModel ! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:30:10'!
src: aVersionedObject

	src := aVersionedObject ! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:35:39'!
value
	^dst! !

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 16:27:02'!
value: anInteger

	| vobj |
	
	anInteger = 0 ifTrue:[src linkAt: label put: nil. ^self ].
	
	vobj := model cache resolve: anInteger.
	
	src linkAt: label put: vobj. ! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/9/2024 22:56:49'!
lookup: aString

	| statement result aDictionary |
	
	[
		statement := connection prepare: 'SELECT oid FROM global WHERE root.name = $1'.

		result := statement executeQuery: (Array with: aString).
	
	] on:Error do:[:ex | ex signal ] ensure: [		statement close ].
	
	aDictionary := result recordsAsDictionaries first.

	^aDictionary at:#oid.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/9/2024 22:53:28'!
spCheckoutLinks: oid

	| statement result |
	
	[
		statement := connection prepare: 'SELECT * FROM checkout_links($1)'.

		result := statement executeQuery: (Array with: oid).
	] on: Error do:[:ex | ex signal] ensure:[ 	statement close].

	^result recordsAsDictionaries
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/10/2024 23:03:16'!
spCheckoutLinks: oid version: rid

	| statement result |
	
	[
		statement := connection prepare: 'SELECT * FROM checkout_links_version($1,$2)'.

		result := statement executeQuery: (Array with: oid with:rid).
	
	] on: Error do:[:ex | ex signal ] ensure:[	statement close ].
	
	^ result recordsAsDictionaries.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/9/2024 22:50:07'!
spCheckoutVobject: oid

	| statement result |
	
	[ 
		statement := connection prepare: 'SELECT * FROM checkout_vobject($1)'.

		result := statement executeQuery: (Array with: oid).
	
	] on: Error do:[:ex | ex signal ] ensure:[	statement close ].
	
	^ result recordsAsDictionaries first.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/9/2024 22:51:19'!
spCheckoutVobject: oid version: rid

	| statement result |
	
	[
		statement := connection prepare: 'SELECT * FROM checkout_vobject_version($1,$2)'.

		result := statement executeQuery: (Array with: oid with:rid).
	
	] on: Error do:[:ex | ex signal ] ensure:[	statement close ].
	
	^ result recordsAsDictionaries first.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/9/2024 22:45:57'!
spNewChangeSetComment: comment encoding: content

	| statement result |
	
	connection executeQuery: 'START TRANSACTION'.

	[	
	statement := connection prepare: 'CALL new_changeset($1, $2, $3)'.

	result := statement executeQuery: { comment .  content . 0 }.

	connection executeQuery: 'COMMIT'.
	
	] on: Error do:[ :ex | ex signal ] ensure:[ 	statement close ].

	^ result recordsAsDictionaries first at:#_max_oid.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/9/2024 22:58:55'!
spObjectsModifiedSince: aDateTime

	| statement result |
	
	[
	statement := connection prepare: 'SELECT * FROM objects_modified_since($1)'.

	result := statement executeQuery: (Array with: aDateTime).
	]
	ensure:[ 	statement close ].
	
	^ result records.
! !

!ArchivistCache methodsFor: 'initialization' stamp: 'DF 3/9/2024 19:02:46'!
initialize

	vobjects := Dictionary new. "maps existing objects by their oid"
	
	next := -1. "the first object identifier for new objects."
	
	fresh := Dictionary new. "maps newly created vobjects by their oid"
	
	expires := DateAndTime now. "initialy the cache is up to date until the moment it was created" ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:47:09'!
checkin: comment 

	| changes aWriteStream base |
	
	changes := OrderedCollection new.
	
	fresh do:[:each | each addChangesTo: changes].
	
	vobjects do:[:each | 			each dirty ifTrue:[each addChangesTo: changes ] ]. 
	
	aWriteStream := WriteStream on:''.
	
	aWriteStream nextPut:$[.
	
	changes do:[:each | aWriteStream nextPutAll: each ] separatedBy:[aWriteStream nextPut:$, ].
	
	aWriteStream nextPut:$].
	
	base := self spNewChangeSetComment: comment  encoding: aWriteStream contents.
	
	fresh do:[:each | each rid:0 ; fix:base ].

	fresh do:[:each | vobjects at: each oid put: each ].

	vobjects do:[:each | each dirty ifTrue:[ each incrementRid ; clean ] ]. 
	
	fresh := Dictionary new.
	
	next := -1.
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:25:06'!
clone: aVersionedObject

	| vobj |
	
	vobj := aVersionedObject 	clone: next.
	
	next := next - 1.
	
	fresh at: vobj oid put: vobj.
	
	" We do not add the fresh vobjects to the vobjects dictionary because they cannot be referenced by 
	objects that we fetch from the database. "
	
	^ vobj ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/19/2024 19:56:58'!
connection: aPgConnection
	connection := aPgConnection! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2024 20:43:34'!
deferredFetch: oid

	oid ifNil:[^nil]. 

	self assert: oid > 0.
	
	^ vobjects at: oid ifAbsent:[ | vobj |
		vobj := VersionedObjectStub new oid: oid ; cache: self ; yourself. 
		vobjects at: oid put: vobj. vobj		]. ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 11:33:29'!
delete: vobj

	fresh at: vobj oid ifPresent:[ :p | p disconnect . fresh removeKey: p oid . ^ self ].
	
	self assert: (vobjects includesKey: vobj oid).
	
	vobjects at: vobj oid :: disconnect.
	
	vobjects removeKey: vobj oid.
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 19:09:48'!
dirtySize

	^(vobjects count:[:each | each dirty ]) + (fresh count:[:each | each dirty ])
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 20:23:14'!
evict: oid

	self assert: (fresh includesKey: oid) not. "we cannot evict a modified object"
	
	self assert: (vobjects includesKey:oid). "oid in vobjects"
	
	vobjects removeKey: oid.
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 19:03:29'!
expires
	^expires! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:50:07'!
fetch: oid

	| attrs |
	
	self assert: oid notNil.
	
	self assert: oid > 0.
	
	attrs := self spCheckoutVobject: oid.

	^ VersionedObject from: attrs.
! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:52:10'!
fetch: oid revision: rid

	| attrs |
	
	self assert: oid notNil.
	
	self assert: oid > 0.

	self assert: rid notNil.

	self assert: rid >0.
	
	attrs := self spCheckoutVobject: oid version: rid.

	^ VersionedObject from: attrs.
! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:54:11'!
fetchLinks: oid

	self assert: oid notNil.
			
	self spCheckoutLinks: oid :: do:[:each | | source target |
		
		source := self deferredFetch: (each at:#oid).
		target := self deferredFetch: (each at:#oidtarget).
		
		self assert: source notNil.
		
		source linkAt: (each at:#name) put: target.
		source clean. "normally changing links makes the object dirty but not the first time we fetch it from the db." ].  
		
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 23:06:29'!
fetchOutgoingLinks: oid version: rid

	self assert: oid notNil.
			
	^self spCheckoutLinks: oid version: rid :: collect:[:each | 
		 (each at:#name) -> (self deferredFetch: (each at:#oidtarget)) ] ::asDictionary
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 18:58:59'!
fresh
	^fresh  ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 23:01:20'!
mergeLatestChanges
	
	| oids |
		
	self halt.
	
	oids := Set new.
	
	self spObjectsModifiedSince: expires :: do:[:each | oids add: each first ].
	
	oids do:[:each |
		vobjects at: each ifPresent:[:vobj | 
			vobj dirty 
				ifTrue:[ | pred succ |
					pred := self fetch: each revision: vobj rid. 
					pred outgoing: (self fetchOutgoingLinks: pred oid version: pred rid).
					
					succ := self fetch: each.
					succ outgoing: (self fetchOutgoingLinks: succ oid version: succ rid).

					vobj merge: pred latest: succ. 
					]
				ifFalse:[ self refresh: each ] ] ].
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 18:58:53'!
old
	^vobjects ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 21:04:09'!
refresh: oid

	| vobj newobj | 

	self assert: oid notNil.

	self assert: oid > 0.

	self assert: (vobjects includesKey: oid).

	newobj := self fetch: oid. 
	
	vobj := vobjects at: oid.	

	vobj removeAllOutgoingLinks.	
		
	newobj become: vobj. 
	
	self fetchLinks: oid.
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:28:47'!
resolve: oid

	self assert: oid notNil.
	
	oid < 0 ifTrue:[		^fresh at: oid		].

	^vobjects at: oid ifAbsent:[ 
		|vobject| 
		
		vobject := self fetch: oid. 
		
		vobjects at: oid put: vobject.
		
		self fetchLinks: oid. 
		
		vobject]
	! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:56:56'!
dictionary: aDictionary
	dict := aDictionary ! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:56:43'!
key: anObject
	key := anObject! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:55:41'!
valueAtKey
	^ dict at:key! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 16:12:41'!
valueAtKey: anObject

	^dict at:key put: anObject! !

!KeyHolder class methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:57:42'!
on: aDictionary at: anObject
	
	| aKeyHolder |
	
	aKeyHolder := self new.
	
	^ aKeyHolder dictionary: aDictionary ; key: anObject ; yourself! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/24/2024 19:00:07'!
addChangesTo: anOrderedCollection

	self subclassResponsibility ! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:55:27'!
dirty

	self subclassResponsibility! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 10:16:09'!
disconnect
	self subclassResponsibility ! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:58:01'!
isObject
	^self subclassResponsibility ! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:58:06'!
isRealized
	^self subclassResponsibility ! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:55:35'!
oid

	self subclassResponsibility! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 21:24:14'!
details

	^String streamContents:[:s | s nextPutAll: self class name ; nextPutAll: ' oid: ' , oid asString ; nextPutAll: ' rid: ' , rid asString ; nextPutAll: (dirty ifTrue:[' dirty'] ifFalse:[' clean']) ] ! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:54:58'!
dirty
	^dirty! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:54:11'!
dirty: aBoolean
	dirty := aBoolean! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:58:17'!
isRealized
	^true! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:55:05'!
oid
	^oid! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:54:20'!
oid: anInteger
	oid := anInteger ! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:55:12'!
rid
	^rid! !

!RealizedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:54:27'!
rid: anInteger
	rid := anInteger ! !

!VersionedObject methodsFor: 'testing' stamp: 'DF 2/26/2024 20:58:48'!
isObject
	^true! !

!VersionedObject methodsFor: 'converting' stamp: 'DF 3/9/2024 23:32:04'!
asJSON

	| aWriteStream |
	
	self assert: ((oid < 0 and: [rid isNil]) or:[oid > 0 and:[rid notNil] ]).
	
	aWriteStream := WriteStream on: ''.
	
	out associations do:[:assoc | | id | 
		id := assoc value ifNil:[0] ifNotNil:[assoc value oid]. 
		aWriteStream nextPutAll: ('\{"target":{1}, "name":"{2}" \}' format: { id . assoc key} ) ] separatedBy: [ aWriteStream nextPutAll: ','].

^ '\{"oid": {1} , "rid":{2}, "slots" : {3} , "description" : {4}, "links":[{5}] \}' format: { oid . rid ifNil:[0] . (Json render: slots)  . description jsonPrint . aWriteStream contents }! !

!VersionedObject methodsFor: 'initialization' stamp: 'DF 3/9/2024 23:32:04'!
initialize
	in := Dictionary new.
	out := Dictionary new.
	slots := JsonObject new.
	description := ''! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 2/24/2024 19:04:50'!
addChangesTo: anOrderedCollection

	anOrderedCollection add: self asJSON.
	! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 3/2/2024 21:17:14'!
clean

	dirty := false.
	! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 3/3/2024 20:34:44'!
incrementRid
	rid := rid + 1! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/9/2024 23:32:04'!
at: aSymbol
	^ slots at: aSymbol! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/9/2024 23:32:04'!
at: aSymbol put: anObject

	| result |
	
	result := slots at: aSymbol put: anObject.
	
	dirty := true.
	
	^result! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/1/2024 12:20:15'!
description
	^description! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/2/2024 15:12:35'!
description: aString

	description := aString.
	
	dirty := true.! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:59:49'!
incoming
	^in  ! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/29/2024 12:39:21'!
linkAt: aString
	^ out at: aString! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/29/2024 13:04:33'!
linkAt: aString ifAbsent: aBlock
	^ out at: aString ifAbsent: aBlock! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/8/2024 16:30:03'!
linkAt: aString put: aVersionedEntity 

	out at: aString ifPresent:[:old | old ifNotNil:[ old removeIncoming: self] ].
	
	out at: aString put: aVersionedEntity. 
	
	aVersionedEntity ifNotNil:[ aVersionedEntity addIncoming: self ].
	
	dirty := true.
	! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:59:45'!
outgoing
	^out ! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/10/2024 23:00:01'!
outgoing: aDictionary
	out := aDictionary 
	! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/9/2024 23:32:04'!
removeSlotAt: aString
	slots removeKey: aString! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/9/2024 23:32:04'!
slots
	^slots! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/9/2024 23:32:04'!
slots: aJsonObj

	slots := aJsonObj.
	
	dirty := true.! !

!VersionedObject methodsFor: 'copying' stamp: 'DF 3/9/2024 23:31:13'!
clone: newoid

	| vobj c p |
	
	vobj := self class new.
	
	vobj oid: newoid.
	
	c := JsonObject new.
	p := self.
	
	[p notNil] whileTrue:[ 
		
		c := JsonObject new , p slots , c.

		p outgoing keys do:[:each | vobj linkAt: each put: nil ].
		
		p := p linkAt: 'parent' ifAbsent:[nil] ]. 
	
	vobj slots: c.
	
	vobj linkAt: 'prototype' put: self.
	
	^vobj! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 11:55:15'!
addIncoming: aVersionedObject

	self assert: aVersionedObject notNil.
	
	in at: aVersionedObject oid put: aVersionedObject! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 12:17:21'!
disconnect
	
	" first make them dirty, this will force any stubs to be replaced by their actual objects. "
	
	out do:[:each | each dirty: true.  ].
	
	out do:[:each | each removeIncoming: self].
	
	in do:[:each | each dirty: true. ].
	
	in do:[:each | each nullifyOutgoing: self.  ].
	
! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 2/25/2024 22:05:17'!
fix: base

	self assert: oid < 0.
	
	oid := oid * -1 + base
	! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:48:13'!
linkName: anInteger

	"answer the name by which the receiver links to oid"
	
	^out associations detect:[:each | each value notNil and:[each value oid = anInteger ] ] ifFound:[:each | each key ] ifNone:[''].
	! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 23:32:20'!
merge: pred latest: succ

	|  predkeys keys succkeys |

	self halt.
	
	slots := slots merge: succ slots old: pred slots.
	
	description := ArchiDiff between: description and: succ description.
	
	keys := out collect:[:each | each ifNil:[nil] ifNotNil:[each oid ] ].
	
	predkeys := pred outgoing collect:[:each | each ifNil:[nil] ifNotNil:[each oid ] ].
	
	succkeys := succ outgoing collect:[:each | each ifNil:[nil] ifNotNil:[each oid ] ].

	keys := keys merge: succkeys old: predkeys.
	
	out do:[:each | each ifNotNil:[each removeIncoming: self] ].
	
	keys associations do:[:each | each value isKindOf: NonDeterministicChoice :: ifFalse:[ self linkAt: each key put: each value ]  ].
	
	keys associations do:[:each | each value isKindOf: NonDeterministicChoice :: ifTrue:[ out at: each key put: each value ]  ].
		
	
	! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 17:00:03'!
nullifyOutgoing: aVersionedEntity

	out := out collect:[:each | each notNil and:[each oid = aVersionedEntity oid] :: ifTrue:[nil] ifFalse:[each] ]
! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 21:07:58'!
removeAllOutgoingLinks

	out do:[:each | each ifNotNil:[ each removeIncoming: self ] ].
	
	out := Dictionary new.! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 11:54:29'!
removeIncoming: aVersionedObject

	in removeKey: aVersionedObject oid! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 12:05:23'!
removeOutgoing: aVersionedEntity

	out := out reject:[:each | each ifNil:[false] ifNotNil:[ each oid = aVersionedEntity oid] ]! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 21:20:21'!
replace: aStubObject with: aVersionedObject

	| names origdirty |
	
	self assert: aStubObject oid = aVersionedObject oid.
	
	origdirty := dirty.
	
	names := Set new.
	
	out keysAndValuesDo: [:key :value | 
		value oid = aStubObject oid ifTrue:[ names add: key ] ].
	
	names do:[:each | self linkAt: each put: aVersionedObject ].
	
	dirty := origdirty. 
	! !

!VersionedObject class methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 23:31:13'!
from: aDictionary 

	| aVersionedObject |
	
	aVersionedObject := self new.
	
	aVersionedObject oid: (aDictionary at: #oid) ; rid:(aDictionary at:#rid); slots: (aDictionary at:#slots) ; description: (aDictionary at:#description) ; dirty: false .
	
	^aVersionedObject ! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/28/2024 20:43:59'!
addChangesTo: anOrderedCollection

	" a stub has no outgoing links "
	! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/25/2024 20:21:03'!
addIncoming: aLink
	in add: aLink! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/25/2024 16:38:44'!
cache: anArchivistCache
	cache := anArchivistCache ! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/28/2024 20:42:53'!
clean
	"a stub is always clean"! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 23:33:50'!
description

	^String streamContents:[:s | s nextPutAll: self class name ; nextPutAll: ' oid: ' , oid asString ] ! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 21:24:44'!
details

	^String streamContents:[:s | s nextPutAll: self class name ; nextPutAll: ' oid: ' , oid asString ] ! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/25/2024 20:08:25'!
dirty
	^false! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 21:19:01'!
doesNotUnderstand: aMessage

	| vobj |

	cache evict: oid.
		
	vobj := cache resolve: oid.
	
	in do:[:each | each replace: self with: vobj].
		
	^aMessage sendTo: vobj.! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:49:42'!
incoming
	^in! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/25/2024 20:20:43'!
initialize
	in := Set new! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:58:57'!
isObject
	^true! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 20:59:02'!
isRealized
	^false! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 20:30:34'!
linkAt: aString put: aVersionedEntity

	aVersionedEntity ifNotNil:[ aVersionedEntity addIncoming: self ].
! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 16:11:58'!
linkName: anInteger

	^'...'! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 22:06:53'!
oid
	^oid! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 12:57:45'!
oid: anInteger

	self assert: anInteger notNil.
	
	oid := anInteger ! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/28/2024 22:20:10'!
removeIncoming: aLink
	in remove: aLink! !

!AsciiStringField methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 20:34:40'!
disinfect: aString
	"Convert aString into the type of object that this field ultimately represents"
	^aString asByteStringIfAscii! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:55:46'!
disinfect: aString 

	('-1234567890' includesAllOf: aString) ifFalse: [^nil].
	^ [aString asNumber] on: Error do: [:ex | nil ]! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:57:41'!
infect: anArchiLinkOrInteger

	| v |
	
	v := anArchiLinkOrInteger .
	
	^ v ifNil: [''] ifNotNil: [ v isNumber ifTrue:[v] ifFalse:[v dst] ]! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 22:30:56'!
inputMorphInstance
"
	Subclass according to the nature of the input 
	For most input we need a text entry morph, so make it the default one 
"
	
	^ ArchiLinkMorph newRow ! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 11:24:46'!
navigator: anArchivistCacheModel
	navigator := anArchivistCacheModel ! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:59:55'!
on: aSymbol of: anObject

	model := anObject.
	
	^super on: #value of: (anObject at: aSymbol)! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:55:41'!
validateConditions
	super validateConditions.
	self isValid ifFalse: [ ^ self ].
	input ifNil: [ ^ self ].
	(self disinfect: input) isInteger ifFalse: [ errors add: 'Only integers are allowed here.' ]! !

!Boolean methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:26:43'!
addFieldOn: anObject at: aKey to: aMold
	^aMold checkboxField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Float methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:26:54'!
addFieldOn: anObject at: aKey to: aMold
	^aMold floatField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Integer methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:00'!
addFieldOn: anObject at: aKey to: aMold
	^aMold integerField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Time methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:34'!
addFieldOn: anObject at: aKey to: aMold
	^aMold timeField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Date methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:28'!
addFieldOn: anObject at: aKey to: aMold
	^aMold dateField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!CharacterSequence methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:11'!
addFieldOn: anObject at: aKey to: aMold
	^aMold stringField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!CharacterSequence methodsFor: '*Archivist' stamp: 'DF 3/2/2024 22:13:08'!
jsonPrint
	
	| aWriteStream |
		
	aWriteStream := WriteStream on:''.

	 self jsonWriteOn: aWriteStream.
	
	^aWriteStream contents ! !

!Text methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:43'!
addFieldOn: anObject at: aKey to: aMold
	^aMold textField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Text methodsFor: '*Archivist' stamp: 'DF 3/2/2024 22:12:50'!
jsonPrint

	^self string jsonPrint
	! !

!Dictionary methodsFor: '*Archivist' stamp: 'DF 3/10/2024 23:12:41'!
merge: newDictionary old: oldDictionary

	| keys result |
	
	result := self class new.
	
	keys := Set new , oldDictionary keys , self keys, newDictionary keys.
	
	keys do:[:each | 
		
		(self includesKey: each) and:[newDictionary includesKey:each] :: 
			ifTrue: [	result at: each put:(Set with: (self at:each)  with: (newDictionary at:each)) ].

		(self includesKey: each) and:[(newDictionary includesKey:each) not] :: 
			ifTrue: [
				(oldDictionary includesKey: each) not or:[ (oldDictionary at: each) ~= (self at:each)] ::
					ifTrue:[ result at: each put: (Set with: (self at:each)) ] ].
		(self includesKey: each) not and:[(newDictionary includesKey:each) ] :: 
			ifTrue: [ result at: each put:(Set with: (newDictionary at:each)) ] ].
		
	^result collect:[:each | 
		each size = 1 
			ifTrue:[each anyOne] ifFalse:[NonDeterministicChoice new addAll: each ; yourself] ]
			
! !

!SocketStream class methodsFor: '*Archivist' stamp: 'DF 3/9/2024 20:20:17'!
openConnectionToHostNamed: hostName port: portNumber timeout: anInteger
	| hostIP |
	hostIP := NetNameResolver addressForName: hostName timeout: anInteger.
	^self openConnectionToHost: hostIP port: portNumber timeout: anInteger! !
