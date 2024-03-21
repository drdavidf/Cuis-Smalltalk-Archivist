'From Cuis6.3 [latest update: #6253] on 21 March 2024 at 5:47:00 pm'!
'Description '!
!provides: 'Archivist' 1 181!
!requires: 'PostgresAdapter' 1 62 nil!
!requires: 'UI-Mold' 1 15 nil!
!requires: 'LayoutAlgebra' 1 4 nil!
!requires: 'Annotations' 1 83 nil!
!requires: 'YAXO' 1 25 nil!
SystemOrganization addCategory: #Archivist!
SystemOrganization addCategory: #'Archivist-UI'!
SystemOrganization addCategory: #'Archivist-Core'!


!classDefinition: #ArchivistCacheModel category: #'Archivist-UI'!
TextProvider subclass: #ArchivistCacheModel
	instanceVariableNames: 'settings connection cache selection incomingSelectionIndex'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'ArchivistCacheModel class' category: #'Archivist-UI'!
ArchivistCacheModel class
	instanceVariableNames: ''!

!classDefinition: #NonDeterministicChoice category: #'Archivist-Core'!
OrderedCollection subclass: #NonDeterministicChoice
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-Core'!
!classDefinition: 'NonDeterministicChoice class' category: #'Archivist-Core'!
NonDeterministicChoice class
	instanceVariableNames: ''!

!classDefinition: #ArchiLinkMorph category: #'Archivist-UI'!
LayoutMorph subclass: #ArchiLinkMorph
	instanceVariableNames: 'button entry model navigator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'ArchiLinkMorph class' category: #'Archivist-UI'!
ArchiLinkMorph class
	instanceVariableNames: ''!

!classDefinition: #MoldScrollPane category: #'Archivist-UI'!
PluggableScrollPane subclass: #MoldScrollPane
	instanceVariableNames: 'mold objectGetter'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'MoldScrollPane class' category: #'Archivist-UI'!
MoldScrollPane class
	instanceVariableNames: ''!

!classDefinition: #ArchivistCacheWindow category: #'Archivist-UI'!
SystemWindow subclass: #ArchivistCacheWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'ArchivistCacheWindow class' category: #'Archivist-UI'!
ArchivistCacheWindow class
	instanceVariableNames: ''!

!classDefinition: #TestArchiCache category: #'Archivist-Core'!
TestCase subclass: #TestArchiCache
	instanceVariableNames: 'client cache'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-Core'!
!classDefinition: 'TestArchiCache class' category: #'Archivist-Core'!
TestArchiCache class
	instanceVariableNames: ''!

!classDefinition: #AsciiStringField category: #'Archivist-UI'!
Field subclass: #AsciiStringField
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'AsciiStringField class' category: #'Archivist-UI'!
AsciiStringField class
	instanceVariableNames: ''!

!classDefinition: #LinkField category: #'Archivist-UI'!
Field subclass: #LinkField
	instanceVariableNames: 'model navigator'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'LinkField class' category: #'Archivist-UI'!
LinkField class
	instanceVariableNames: ''!

!classDefinition: #ArchiDiff category: #'Archivist-UI'!
Object subclass: #ArchiDiff
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'ArchiDiff class' category: #'Archivist-UI'!
ArchiDiff class
	instanceVariableNames: ''!

!classDefinition: #ArchiLink category: #'Archivist-UI'!
Object subclass: #ArchiLink
	instanceVariableNames: 'model src dst label'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'ArchiLink class' category: #'Archivist-UI'!
ArchiLink class
	instanceVariableNames: ''!

!classDefinition: #KeyHolder category: #'Archivist-UI'!
Object subclass: #KeyHolder
	instanceVariableNames: 'key dict'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-UI'!
!classDefinition: 'KeyHolder class' category: #'Archivist-UI'!
KeyHolder class
	instanceVariableNames: ''!

!classDefinition: #ArchivistCache category: #'Archivist-Core'!
Object subclass: #ArchivistCache
	instanceVariableNames: 'connection vobjects fresh next expires'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-Core'!
!classDefinition: 'ArchivistCache class' category: #'Archivist-Core'!
ArchivistCache class
	instanceVariableNames: ''!

!classDefinition: #VersionedEntity category: #'Archivist-Core'!
Object subclass: #VersionedEntity
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-Core'!
!classDefinition: 'VersionedEntity class' category: #'Archivist-Core'!
VersionedEntity class
	instanceVariableNames: ''!

!classDefinition: #VersionedObject category: #'Archivist-Core'!
VersionedEntity subclass: #VersionedObject
	instanceVariableNames: 'oid rid dirty slots description in out'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-Core'!
!classDefinition: 'VersionedObject class' category: #'Archivist-Core'!
VersionedObject class
	instanceVariableNames: ''!

!classDefinition: #VersionedObjectStub category: #'Archivist-Core'!
VersionedEntity subclass: #VersionedObjectStub
	instanceVariableNames: 'oid cache in'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist-Core'!
!classDefinition: 'VersionedObjectStub class' category: #'Archivist-Core'!
VersionedObjectStub class
	instanceVariableNames: ''!


!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/21/2024 15:42:57'!
addSlotToSelectedObject: aString default: anObject
	
	anObject 
		ifNil:[ self assert: (selection outgoing includesKey: aString) not. 
			selection link: aString to: nil ] 
	
		ifNotNil:[ 	selection slots at: aString asSymbol put: anObject ].
	
	selection dirty: true.
	
	self selectionIndex: self selectionIndex.
	
	! !

!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/21/2024 00:04:21'!
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
	
	mold openDialog: 'Add a slot' at: Sensor mousePoint.
	
	! !

!ArchivistCacheModel methodsFor: 'editing slots' stamp: 'DF 3/21/2024 00:07:28'!
openRemoveSlotDialog
	
 | mold  |

	selection slots ifEmpty:[^self].
	
	mold := Mold new.
	
	(mold selectField)
		label: 'Type';
		on: #listIndex of: (ListModel with: selection slots keys :: listIndex: 1) ;
		beRequired.

	mold when: #edited evaluate:[ self removeSlotFromSelectedObject: (mold fields at:1) value ].
	
	mold openDialog: 'Remove a slot' at: Sensor mousePoint.
	
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

!ArchivistCacheModel methodsFor: 'accessing' stamp: 'DF 3/21/2024 15:16:25'!
selection
	^selection! !

!ArchivistCacheModel methodsFor: 'accessing' stamp: 'DF 3/8/2024 12:20:09'!
settings: aDictionary

	settings := aDictionary ! !

!ArchivistCacheModel methodsFor: 'initialization' stamp: 'DF 3/8/2024 12:37:17'!
initialize

	incomingSelectionIndex := 0.! !

!ArchivistCacheModel methodsFor: 'updating' stamp: 'DF 3/9/2024 22:03:25'!
changed

	self changed: #cacheState; changed: #oidDisplayList; changed: #description ; changed: #incoming ; changed: #outgoing ; changed: #selectionDetails ; changed: #slots! !

!ArchivistCacheModel methodsFor: 'error reporting' stamp: 'DF 3/12/2024 18:52:33'!
alert: aTitleString details: aBodyString

	| p w h |
	
	p := Panel new.

	p beColumn.

	p addMorph: (LabelMorph contents: aBodyString).

	p addMorph: (PluggableButtonMorph model:[ p delete ] action: #value label:'Ok').

	p layoutMorph separation: 32@32.

	p setLabel: aTitleString.

	w := 0. h := 0.
	
	p submorphs do:[:m | w := w max: m morphWidth. h := h + m morphHeight ].

	p morphExtent: w@h.

	p openInWorld ! !

!ArchivistCacheModel methodsFor: 'server calls' stamp: 'DF 3/12/2024 19:22:20'!
commit: aText

	[
		cache checkin: aText asString.
	
		self changed: #oidDisplayList ; changed: #selectionDetails
	
	] on: PgError do:[:ex | self alert: (ex info at:#M) details: (ex info at:#H) ] on: NetworkError do:[:ex | self alert: 'Network Error' details: ex messageText].
! !

!ArchivistCacheModel methodsFor: 'server calls' stamp: 'DF 3/12/2024 20:34:15'!
merge

	cache merge.
	
	self changed.
	! !

!ArchivistCacheModel methodsFor: 'server calls' stamp: 'DF 3/9/2024 23:20:21'!
navigateTo: oid

	self assert: oid notNil.
	
	selection :=  cache resolve: oid.
	
	self changed.! !

!ArchivistCacheModel methodsFor: 'server calls' stamp: 'DF 3/9/2024 22:09:13'!
reconnect
	
	connection ifNotNil:[connection close].
	
	connection := PgClient newFrom: settings.
	
	cache connection: connection.
	
	connection connect.

	self changed: #connectionStatus.! !

!ArchivistCacheModel methodsFor: 'server calls' stamp: 'DF 3/12/2024 19:21:50'!
resolve: aValueHolder

	| vobj |
	
	[
	
		vobj := cache resolve: aValueHolder propertyValue.
	
		selection := vobj.
	
		self changed.
	
	] on: PgError do:[:ex | self alert: (ex info at:#M) details: (ex info at:#H) ] on: NetworkError do:[:ex | self alert: 'Network Error' details: ex messageText].
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/21/2024 17:46:49'!
cacheState

	| dt |
	
	dt := cache expires date = Date today ifTrue:['today'] ifFalse:['on ', cache expires date asString].
	
	^'cache has {1} resident objects, {2} new objects, {3} modified objects. updated {4} at {5}' format:{ cache old size . cache fresh size . cache dirtySize . dt . cache expires time print24} ! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 22:05:50'!
connectionStatus
	
	connection ifNil:[^'Uninitialized'].
	
	connection isConnected ifFalse:[^'Not connected'].

	^'Session {1} connected as {2} to database {3} on host {4} at port {5}.' format:{ connection session. settings at:#user . settings at: #database .  settings at: #host . settings at: #port }.
	
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/20/2024 20:34:58'!
description

	selection ifNil:[^ AnnotatedText fromString:''].
	
	selection isRealized :: ifFalse: [^AnnotatedText fromString:''].

	^selection description! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/10/2024 18:16:34'!
description: aString

	selection ifNil:[^false].
	
	selection isRealized :: ifFalse: [^false].

	selection description: aString.
	
	self changed: #oidDisplayList ; changed: #cacheState.
	
	^true
! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/14/2024 21:51:17'!
incoming

	| pairs |
	
	selection ifNil:[^{}].
	
	pairs := selection incoming collect:[:each | each oid -> (each linkNameOf: selection oid)  ] :: asOrderedCollection sort:[:x : y | x key <= y key ].
	
	^ pairs collect:[:each | '{1} ({2})' format: { each value . each key } ].! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 16:34:04'!
incomingSelectionIndex

	^0! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/9/2024 23:19:56'!
incomingSelectionIndex: anInteger

	| oids |
	
	oids := selection incoming collect:[:each | each oid ] :: asOrderedCollection sort:[:x : y | x <= y ].

	self navigateTo: (oids at: anInteger).! !

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

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/20/2024 21:19:42'!
user
	^settings at:#user! !

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

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/21/2024 00:04:36'!
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
	
	mold openDialog: 'Connect to server' at: Sensor mousePoint.
	! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/21/2024 00:00:49'!
openResolveDialog

	|mold holder |
	
	mold := Mold new .
	
	holder := ValueHolder new.
	
	(mold integerField) label:'Object identifier' ; on: #propertyValue of: holder ; customize:[:w :i :e | i borderColor: Color veryLightGray ] ; beRequired.

	mold when: #edited send: #resolve: to: self with: holder.
		
	mold openDialog: 'Resolve object identifier' at: Sensor mousePoint.
	
	self runningWorld activeHand newKeyboardFocus: mold fields first inputMorph.

! !

!ArchivistCacheModel methodsFor: 'menus' stamp: 'DF 3/10/2024 19:49:30'!
revertSelectedObject

	selection ifNil:[^self].
	
	selection isRealized ifFalse:[^self].
	
	cache refresh: selection oid.
	
	self changed.! !

!ArchivistCacheModel methodsFor: 'testing' stamp: 'DF 3/21/2024 14:26:13'!
isConnected
	^connection notNil and:[connection isConnected ].! !

!NonDeterministicChoice methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 09:25:27'!
addFieldOn: anObject at: aKey to: aMold

	^aMold stringField on: #valueAtKey of:(KeyHolder on: anObject at: aKey) ; 
		addCondition: [:input | input isKindOf: NonDeterministicChoice :: not ] ! !

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

!MoldScrollPane methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 19:07:39'!
save

	mold validate.
	
	mold isValid ifTrue: [ 
		mold save .  
		mold fields allSatisfy:# isValid :: "could be false if something goes wrong during the save (e.g. with access to database) "
			ifTrue: [		model updateSlots ] ].! !

!MoldScrollPane methodsFor: 'as yet unclassified' stamp: 'DF 3/21/2024 14:00:36'!
update: aSymbol

	| obj form |
	
	mold := Mold new.
	
	obj := 	model perform: objectGetter.
	
	obj keysAndValuesDo: [:key :value | ( value addFieldOn:obj at:key to: mold ) label: key ; customize:[:w :i :e | i borderColor: Color veryLightGray ] ].
	
	form := obj isEmpty ifTrue:[LabelGroup new color: Color transparent ; yourself] ifFalse:[mold renderForms].
	
	form morphExtent: self viewableWidth @ form morphHeight.
	
	self scroller: form.! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/20/2024 21:30:27'!
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
(AnnotatedTextMorph textProvider: model textGetter: #description textSetter:#description: author: model user :: pw:1.0 ; ph:0.7)
</>
((TextModelMorph textProvider: model textGetter: #connectionStatus  :: pw:1.0 ; fh:32) + (PluggableButtonMorph model: model stateGetter: nil action: #openConnectionDialog :: label:'connect ...' ) fh:48) .

self setLabel:'Archivist Browser'.

! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/20/2024 23:44:34'!
openCommitDialog

	| panel dh dw t cp cw |
	
	t := TextModelMorph withText: ''.
	
	panel := PluggableDialogPanel 
		open:  t 
		label: 'Commit changes'
		view: #yourself
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

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/21/2024 15:25:20'!
residentObjectsMenu

	| aMenu |
	
	aMenu := MenuMorph new defaultTarget: self.
	
	aMenu addTitle: 'Resident objects'.
	
	model isConnected 
		ifFalse:[ aMenu addItemsFromDictionaries: { 
			{ #label -> 'connect ...' .
			#selector -> #openConnectionDialog.
			#balloonText -> 'You must connect to a database before you can perform operations on objects.' .
			#object -> model } asDictionary }.
			^aMenu 	].

	aMenu addItemsFromDictionaries: {
		{
			#label 			-> 			'commit changes ...'.
			#selector 		-> 			#openCommitDialog .
			#balloonText 	-> 			'Commit all the changes to objects that were modified since the last commit.'
		} asDictionary.
		{
			#label 			-> 			'catch up'.
			#object -> model.
			#selector 		-> 			#merge .
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
	}.
		
	aMenu addItemFromDictionary: 
		{
			#label 			-> 			'clone'.
			#object -> model.
			#selector 		-> 			#cloneSelectedObject.
			#balloonText 	-> 			'Clone the selected object. The selected object becomes the clone''s prototype.'
		} asDictionary :: isEnabled: (model selectionIndex isNil not and: [model selectionIndex > 0]).

	aMenu addItemFromDictionary: 
		{
			#label 			-> 			'fetch'.
			#object -> model.
			#selector 		-> 			#fetchSelectedObject.
			#balloonText 	-> 			'Replace the selected stub with the actual object.'
		} asDictionary :: isEnabled:(model selectionIndex isNil not and: [model selectionIndex > 0] and:[model selection isRealized not]).

	aMenu addItemFromDictionary: 		
		{
			#label 			-> 			'revert'.
			#object -> model.
			#selector 		-> 			#revertSelectedObject.
			#balloonText 	-> 			'Cancel any changes done to the object.'
		} asDictionary :: isEnabled:(model selectionIndex isNil not and: [model selectionIndex > 0] and:[model selection dirty]).
		
	aMenu addItemFromDictionary: 
		{
			#label 			-> 			'delete'.
			#object -> model.
			#selector 		-> 			#deleteSelectedObject.
			#balloonText 	-> 			'Remove any links adjacent on the selected object and evict it from the cache.'
		} asDictionary :: isEnabled:(model selectionIndex isNil not and: [model selectionIndex > 0]).

	^aMenu! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 21:54:40'!
setUp

	| settings statement |
	
	settings :=  IdentityDictionary new.
	settings at: #host put: 'localhost' "#[127 0 0 1 ].".
	settings at: #port put: 5432.
	settings at: #database put: 'architest'.
	settings at: #user put: 'postgres'.
	settings at: #timeout put: 30.
	settings at: #password put: '2358'.

	client := PgClient newFrom: settings.
	client connect.
	
	client executeQuery: 'CALL initialize();'. "clear all content from the database"

	[		
		statement := client prepare: 'CALL new_changeset($1, $2, $3)'.

		statement executeQuery: { 'init test' .  '[{"oid":-1,"slots":{}, "description":"", "links":[]}]' . 0 }.
	
	]  ensure:[ 	statement close ].

	cache := ArchivistCache new.
	
	cache connection: client.
	
	
 ! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 21:45:54'!
tearDown

	client close! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 22:32:22'!
testClone

	| root |
	
	root := cache resolve:1.
	
	self assert: root oid = 1.
	
	root 
		at: #n put: 123; 
		at: #f put: -28.5792;
		at: #b put: false ;
		at: #s put: 'Hello, world' ;
		at: #c put: DateAndTime now ;
		at: #d put: Date today ;
		at: #t put: Time now.
	
	9 timesRepeat: [ cache clone: root ].
	
	-9 to: -1 do:[:i | | obj | 
		obj := cache resolve: i .
		
		self assert: obj oid = i ].
	
	cache checkin: 'testClone'.
	
	1 to: 10 do:[:i | | obj |
		obj := cache resolve:i.
		
		self assert: obj oid = i. 
		
		self assert: obj slots equals: root slots ].
	
	! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/12/2024 19:26:10'!
testCommitConflicts

	" Add a new commit record (bypassing the cache) and then try to commit through the cache "
	
	| statement root |
		
	root := cache resolve:1.
	
	self assert: root oid = 1.

	root at: #x put: 8.
	
	[		
		statement := client prepare: 'CALL new_changeset($1, $2, $3)'.

		statement executeQuery: { 'bypass the cache' .  '[{"oid":1,"slots":{"x":0}, "description":"", "links":[]}]' . 0 }.
	
	]  ensure:[ 	statement close ].

	[ cache checkin: 'try to commit with out of date cache'. 	self assert: false ]
	on: PgError do:[:ex | self assert: true. ] 
	
	
! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/14/2024 13:43:24'!
testDelete

	| root x y z |

	root := cache resolve:1.
	
	self assert: root oid = 1.
		
	root 
		at: #n put: 123; 
		at: #f put: -28.5792;
		at: #b put: false ;
		at: #s put: 'Hello, world' ;
		at: #c put: DateAndTime now ;
		at: #d put: Date today ;
		at: #t put: Time now.

	x := cache clone: root.
	
	y := cache clone: x.
	
	root link: #x to: x.
	
	z := cache clone: root.		

	self assert: (z linkAt:#x) equals: nil.
	
	z link:#x to: x.
		
	cache checkin: 'testDelete before'.	

	cache := ArchivistCache new.
	
	cache connection: client.
	
	root := cache resolve: 1.
	
	x := cache resolve: 2.

	y := ​cache resolve: 3.		

	z := cache resolve:4.	
	
	self assert: z isRealized not.

	x realize.
	
	x := cache resolve: x oid.
	
	self assert: x isRealized.
	
	cache delete: x.

	self assert: z isRealized not.
	
	self assert: (y at:#prototype) equals: nil.

	self assert: (root at:#x) equals: nil.

	self assert: z isRealized not.
	
	cache checkin: 'testDelete after'.	

	cache merge.
	
	self assert: (cache old includesKey: x oid :: not).
		
	
! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/14/2024 13:43:24'!
testLinks

	| root obj1 obj2 objx objy |
	
	root := cache resolve:1.
	
	obj1 := cache clone: root.
	
	obj2 := cache clone: root.
	
	obj1 link: #p to: obj2.
	
	cache checkin: 'testLinks'.
	
	cache := ArchivistCache new.
	
	cache connection: client.
	
	root := cache resolve:1.
	
	objx := cache resolve:2.
	
	objy := cache resolve:3.
	
	self assert: (objx linkAt: #p) equals: objy.
	! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/12/2024 20:39:08'!
testMergeConflicts

	" Add a new commit record (bypassing the cache) then merge the changes "
	
	| statement root |
		
	root := cache resolve:1.
	
	self assert: root oid = 1.

	root at: #x put: 8.
	root at: #y put: 13.
	
	[		
		statement := client prepare: 'CALL new_changeset($1, $2, $3)'.

		statement executeQuery: { 'bypass the cache' .  '[{"oid":1,"slots":{"x":0}, "description":"", "links":[]}]' . 0 }.
	
	]  ensure:[ 	statement close ].

	[ cache checkin: 'try to commit with out of date cache'. 	self assert: false ]
	on: PgError do:[:ex | self assert: true. ] .
	
	cache merge.
	
	self assert: (root at:#x) asSet equals: (NonDeterministicChoice with: 8 with: 0) asSet.
	
	self assert: (root at:#y) equals: 13.
! !

!TestArchiCache methodsFor: 'as yet unclassified' stamp: 'DF 3/12/2024 19:33:12'!
testTypes

	| root x |
	
	root := cache resolve:1.
	
	self assert: root oid = 1.
	
	root 
		at: #n put: 123; 
		at: #f put: -28.5792;
		at: #b put: false ;
		at: #s put: 'Hello, world' ;
		at: #c put: DateAndTime now ;
		at: #d put: Date today ;
		at: #t put: Time now.
		
	cache checkin: 'testTypes'.
	
	cache := ArchivistCache new.
	
	cache connection: client.
	
	x := cache resolve: 1.
	
	self assert: (x at:#n) equals: (root at:#n).
	self assert: (x at:#f) equals: (root at:#f).
	self assert: (x at:#b) equals: (root at:#b).
	self assert: (x at:#s) equals: (root at:#s).
	self assert: (x at:#c) equals: (root at:#c).
	self assert: (x at:#d) equals: (root at:#d).
	self assert: (x at:#t) equals: (root at:#t).
! !

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

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 19:04:51'!
on: aSymbol of: anObject

	| v | 
	
	model := anObject.
	
	v := (anObject at: aSymbol).
	
	self value: v.
	self inputMorphContents: input.
	
	self callback: [:val | [ v perform: #value: with: val ] 
		on: Error do:[:ex | 
			errors := OrderedCollection with: ex messageText.
			self errorsColumn removeAllMorphs.
			self errorsColumn 
				addMorph: (LabelMorph contents: '• ', ex messageText :: color: Color red)		
				layoutSpec: (LayoutSpec keepMorphExtent offAxisEdgeWeight: 0)			.
			self  highlightInputMorph 			] ].
	! !

!LinkField methodsFor: 'as yet unclassified' stamp: 'DF 3/8/2024 15:55:41'!
validateConditions
	super validateConditions.
	self isValid ifFalse: [ ^ self ].
	input ifNil: [ ^ self ].
	(self disinfect: input) isInteger ifFalse: [ errors add: 'Only integers are allowed here.' ]! !

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

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/11/2024 09:27:27'!
addFieldOn: anObject at: aKey to: aMold

	| aLinkField |
	
	aLinkField := LinkField new on: aKey of: anObject ; yourself.
	
	aLinkField inputMorph model: anObject ; navigator: model.
	
	aLinkField addCondition: [:input | input isKindOf: NonDeterministicChoice :: not ] .
	
	aLinkField validateInput.
	
	^aMold fields add: aLinkField! !

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

!ArchiLink methodsFor: 'as yet unclassified' stamp: 'DF 3/21/2024 15:42:49'!
value: anInteger

	| vobj |
	
	anInteger = 0 ifTrue:[src link: label to: nil. ^self ].
	
	vobj := model cache resolve: anInteger.
	
	src link: label to: vobj. ! !

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

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 18:54:31'!
lookup: aString

	| statement result aDictionary |
	
	[
		statement := connection prepare: 'SELECT oid FROM global WHERE root.name = $1'.

		result := statement executeQuery: (Array with: aString).
	
	] on:Error do:[:ex | ex signal ] ensure: [		statement ifNotNil:[ statement close ]  ].
	
	aDictionary := result recordsAsDictionaries first.

	^aDictionary at:#oid.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 18:54:14'!
spCheckoutLinks: oid

	| statement result |
	
	[
		statement := connection prepare: 'SELECT * FROM checkout_links($1)'.

		result := statement executeQuery: (Array with: oid).
	] on: Error do:[:ex | ex pass] ensure:[ 	statement ifNotNil:[ statement close ] ].

	^result recordsAsDictionaries
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 18:54:20'!
spCheckoutLinks: oid version: rid

	| statement result |
	
	[
		statement := connection prepare: 'SELECT * FROM checkout_links_version($1,$2)'.

		result := statement executeQuery: (Array with: oid with:rid).
	
	] on: Error do:[:ex | ex pass ] ensure:[	statement ifNotNil:[ statement close ]  ].
	
	^ result recordsAsDictionaries.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 18:52:11'!
spCheckoutVobject: oid

	| statement result |
	
	[ 
		statement := connection prepare: 'SELECT * FROM checkout_vobject($1)'.

		result := statement executeQuery: (Array with: oid).
	
	] on: Error do:[:ex | ex pass ] ensure:[	statement ifNotNil:[ statement close ] ].
	
	^ result recordsAsDictionaries first.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 18:53:59'!
spCheckoutVobject: oid version: rid

	| statement result |
	
	[
		statement := connection prepare: 'SELECT * FROM checkout_vobject_version($1,$2)'.

		result := statement executeQuery: (Array with: oid with:rid).
	
	] on: Error do:[:ex | ex pass ] ensure:[	statement ifNotNil:[ statement close ] ].
	
	^ result recordsAsDictionaries first.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 20:30:32'!
spNewChangeSetComment: comment encoding: content

	| statement result |
	
	connection executeQuery: 'START TRANSACTION'.

	[	
	statement := connection prepare: 'CALL new_changeset($1, $2, $3)'.

	result := statement executeQuery: { comment .  content . 0 }.

	connection executeQuery: 'COMMIT'.
	
	] on: Error do:[ :ex | connection executeQuery:'ABORT'. ex pass ] ensure:[ 	statement ifNotNil:[ statement close ]  ].

	^ result recordsAsDictionaries first at:#_max_oid.
! !

!ArchivistCache methodsFor: 'postgres calls' stamp: 'DF 3/12/2024 18:54:08'!
spObjectsModifiedSince: aDateTime

	| statement result |
	
	[
	statement := connection prepare: 'SELECT * FROM objects_modified_since($1)'.

	result := statement executeQuery: (Array with: aDateTime).
	]
	ensure:[ statement ifNotNil:[ statement close ]  ].
	
	^ result records.
! !

!ArchivistCache methodsFor: 'initialization' stamp: 'DF 3/14/2024 19:37:19'!
initialize

	vobjects := Dictionary new. "maps existing objects by their oid"
	
	next := -1. "the first object identifier for new objects."
	
	fresh := Dictionary new. "maps newly created vobjects by their oid"
	
	expires := DateAndTime now. "initialy the cache is up to date until the moment it was created" 
	
! !

!ArchivistCache methodsFor: 'accessing' stamp: 'DF 2/19/2024 19:56:58'!
connection: aPgConnection
	connection := aPgConnection! !

!ArchivistCache methodsFor: 'accessing' stamp: 'DF 3/9/2024 19:03:29'!
expires
	^expires! !

!ArchivistCache methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:58:59'!
fresh
	^fresh  ! !

!ArchivistCache methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:58:53'!
old
	^vobjects ! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/13/2024 11:11:55'!
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
	
	expires := DateAndTime now.
	
	fresh do:[:each | each rid:0 ; fix:base ].
	
	fresh do:[:each | vobjects at: each oid put: each ].

	vobjects do:[:each | each dirty ifTrue:[ each incrementRid ; clean ] ]. 
	
	fresh := Dictionary new.
	
	next := -1.
	! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/6/2024 20:43:34'!
deferredFetch: oid

	oid ifNil:[^nil]. 

	self assert: oid > 0.
	
	^ vobjects at: oid ifAbsent:[ | vobj |
		vobj := VersionedObjectStub new oid: oid ; cache: self ; yourself. 
		vobjects at: oid put: vobj. vobj		]. ! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/9/2024 22:50:07'!
fetch: oid

	| attrs |
	
	self assert: oid notNil.
	
	self assert: oid > 0.
	
	attrs := self spCheckoutVobject: oid.

	^ VersionedObject from: attrs.
! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/9/2024 22:52:10'!
fetch: oid revision: rid

	| attrs |
	
	self assert: oid notNil.
	
	self assert: oid > 0.

	self assert: rid notNil.

	self assert: rid >0.
	
	attrs := self spCheckoutVobject: oid version: rid.

	^ VersionedObject from: attrs.
! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/14/2024 13:43:24'!
fetchLinks: oid

	self assert: oid notNil.
			
	self spCheckoutLinks: oid :: do:[:each | | source target |
		
		source := self deferredFetch: (each at:#oid).
		target := self deferredFetch: (each at:#oidtarget).
		
		self assert: source notNil.
		
		source link: (each at:#name) to: target.
		source clean. "normally changing links makes the object dirty but not the first time we fetch it from the db." ].  
		
	! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/10/2024 23:06:29'!
fetchOutgoingLinks: oid version: rid

	self assert: oid notNil.
			
	^self spCheckoutLinks: oid version: rid :: collect:[:each | 
		 (each at:#name) -> (self deferredFetch: (each at:#oidtarget)) ] ::asDictionary
	! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/12/2024 22:33:38'!
merge
	
	| oids now |
		
	oids := Set new.
	
	now := DateAndTime now.
	
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

	expires := now.
		! !

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 3/8/2024 21:04:09'!
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

!ArchivistCache methodsFor: 'server operations' stamp: 'DF 2/29/2024 23:28:47'!
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

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/13/2024 12:44:58'!
clone: aVersionedObject

	" clone aVersionedObject and answer the clone. The clone has the same slots and links but its links (except prototype) are set to nil "
	
	| vobj |
	
	vobj := aVersionedObject 	clone: next.
	
	next := next - 1.
	
	fresh at: vobj oid put: vobj.
	
	" We do not add the fresh vobjects to the vobjects dictionary because they cannot be referenced by 
	objects that we fetch from the database. "
	
	^ vobj ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/13/2024 12:48:18'!
delete: vobj
	
	"remove vobj from all the current objects. vobj must be a realized (non stub) object. "
	
	self assert: vobj isRealized.
	
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

!VersionedEntity methodsFor: 'testing' stamp: 'DF 2/26/2024 20:58:06'!
isRealized
	^self subclassResponsibility ! !

!VersionedEntity methodsFor: 'accessing' stamp: 'DF 2/26/2024 20:55:27'!
dirty

	self subclassResponsibility! !

!VersionedEntity methodsFor: 'accessing' stamp: 'DF 2/26/2024 20:55:35'!
oid

	self subclassResponsibility! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 2/24/2024 19:00:07'!
addChangesTo: anOrderedCollection

	self subclassResponsibility ! !

!VersionedEntity methodsFor: 'as yet unclassified' stamp: 'DF 3/7/2024 10:16:09'!
disconnect
	self subclassResponsibility ! !

!VersionedObject methodsFor: 'testing' stamp: 'DF 3/12/2024 20:51:40'!
isRealized
	^true! !

!VersionedObject methodsFor: 'converting' stamp: 'DF 3/20/2024 19:58:25'!
asJSON

	| aWriteStream |
	
	self assert: ((oid < 0 and: [rid isNil]) or:[oid > 0 and:[rid notNil] ]).
	
	aWriteStream := WriteStream on: ''.
	
	out associations do:[:assoc | | id | 
		id := assoc value ifNil:[0] ifNotNil:[assoc value oid]. 
		aWriteStream nextPutAll: ('\{"target":{1}, "name":"{2}" \}' format: { id . assoc key} ) ] separatedBy: [ aWriteStream nextPutAll: ','].

^ '\{"oid": {1} , "rid":{2}, "slots" : {3} , "description" : {4}, "links":[{5}] \}' format: { oid . rid ifNil:[0] . (Json render: (slots collect:[:each | each encodeJsonCtor ]) )  . description asXML jsonPrint . aWriteStream contents }! !

!VersionedObject methodsFor: 'initialization' stamp: 'DF 3/19/2024 23:31:05'!
initialize
	in := Dictionary new.
	out := Dictionary new.
	slots := JsonObject new.
	description := AnnotatedText fromString:''! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 2/24/2024 19:04:50'!
addChangesTo: anOrderedCollection

	anOrderedCollection add: self asJSON.
	! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 3/2/2024 21:17:14'!
clean

	dirty := false.
	! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 3/13/2024 10:55:46'!
fix: base

	self assert: oid < 0.

	"every vobject that uses an index to reference self should update its index from the negative to the positive oid
	as the only place where this happens is incoming dictionary of vobjects we can iterave over all the vobjects that
	emanate (out) from self and relink them to self. 
	"

	oid := oid * -1 + base.
	
	out do:[:each | each relink: (oid - base) * -1 to: self].
	
	
	! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 3/3/2024 20:34:44'!
incrementRid
	rid := rid + 1! !

!VersionedObject methodsFor: 'changes' stamp: 'DF 3/14/2024 13:43:24'!
merge: pred latest: succ

	|  predkeys keys succkeys objs |
	
	slots := slots merge: succ slots old: pred slots.
	
	description := ArchiDiff between: description and: succ description.
	
	keys := out collect:[:each | each ifNil:[nil] ifNotNil:[each oid ] ].
	
	predkeys := pred outgoing collect:[:each | each ifNil:[nil] ifNotNil:[each oid ] ].
	
	succkeys := succ outgoing collect:[:each | each ifNil:[nil] ifNotNil:[each oid ] ].

	keys := keys merge: succkeys old: predkeys.
	
	"keys now holds the map that associates the link names to their oids. We need a map that associates the link
	names to their vobjects. We can build it by noticing that each name in keys is mapped either to
	an object in current or to an object in pred or to an object in succ".
	
	objs := Dictionary new.
	
	keys associations do:[:each | each value isKindOf: NonDeterministicChoice :: 
		ifFalse:[ 
			{ pred . self . succ } do: [:p | p outgoing at: each key ifPresent:[:v | v oid = each value ifTrue:[objs at: each key put: v ] ] ] ] ].
	
	" disconnect self from the vobjs it is currently pointing to "
	
	out do:[:each | each ifNotNil:[each removeIncoming: self] ].
	
	out := Dictionary new. "clear out, we will rebuild it from keys and objs in the next two statements"
	
	objs associations do:[ :each |self link: each key to: each value   ].

	keys associations do:[:each | each value isKindOf: NonDeterministicChoice :: ifTrue:[ out at: each key put: each value ]   ]. "keep non deterministic choice as it is"
	
		
	
	! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/1/2024 12:20:15'!
description
	^description! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/2/2024 15:12:35'!
description: aString

	description := aString.
	
	dirty := true.! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/12/2024 20:51:26'!
dirty
	^dirty! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/12/2024 20:51:33'!
dirty: aBoolean
	dirty := aBoolean! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:59:49'!
incoming
	^in  ! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/29/2024 12:39:21'!
linkAt: aString
	^ out at: aString! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/29/2024 13:04:33'!
linkAt: aString ifAbsent: aBlock
	^ out at: aString ifAbsent: aBlock! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/12/2024 20:51:45'!
oid
	^oid! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/12/2024 20:51:49'!
oid: anInteger
	oid := anInteger ! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:59:45'!
outgoing
	^out ! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/10/2024 23:00:01'!
outgoing: aDictionary
	out := aDictionary 
	! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/12/2024 20:51:53'!
rid
	^rid! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/12/2024 20:52:02'!
rid: anInteger
	rid := anInteger ! !

!VersionedObject methodsFor: 'copying' stamp: 'DF 3/14/2024 13:43:24'!
clone: newoid

	| vobj c p |
	
	vobj := self class new.
	
	vobj oid: newoid.
	
	c := JsonObject new.
	p := self.
	
	[p notNil] whileTrue:[ 
		
		c := JsonObject new , p slots , c.

		p outgoing keys do:[:each | vobj link: each to: nil ].
		
		p := p linkAt: 'parent' ifAbsent:[nil] ]. 
	
	vobj slots: c.
	
	vobj link: 'prototype' to: self.
	
	^vobj! !

!VersionedObject methodsFor: 'links' stamp: 'DF 3/21/2024 15:45:51'!
disconnect
			
	out do:[:each | each ifNotNil:[each removeIncoming: self ] ].
	
	" first make them dirty, this will force any stubs to be replaced by their actual objects. "
	
	in do:[:each | each dirty: true. ].
	
	in do:[:each | each nullifyOutgoingTo: self.  ].
	
! !

!VersionedObject methodsFor: 'links' stamp: 'DF 3/21/2024 15:46:04'!
link: aString to: aVersionedEntity 
	
	out at: aString ifPresent:[:old | old ifNotNil:[ | n | 
		
			" self may reference old more than once. Check how many 	times it 
			references old 	and remove self from old 	only if the count is 1. "
	
			n := out count:[:each | each notNil and:[each oid = old oid] ].
	
			n = 1 ifTrue: [			old removeIncoming: self ] ] ].
	
	out at: aString put: aVersionedEntity. 
	
	aVersionedEntity ifNotNil:[ aVersionedEntity addIncoming: self ].
	
	dirty := true.
	! !

!VersionedObject methodsFor: 'links' stamp: 'DF 3/14/2024 20:11:12'!
linkNameOf: anInteger

	"answer the name by which the receiver links to oid"
	
	^out associations detect:[:each | each value notNil and:[each value oid = anInteger ] ] ifFound:[:each | each key ] ifNone:[''].
	! !

!VersionedObject methodsFor: 'links' stamp: 'DF 3/8/2024 21:07:58'!
removeAllOutgoingLinks

	out do:[:each | each ifNotNil:[ each removeIncoming: self ] ].
	
	out := Dictionary new.! !

!VersionedObject methodsFor: 'links' stamp: 'DF 3/14/2024 13:43:24'!
replace: aStubObject with: aVersionedObject

	| names origdirty |
	
	self assert: aStubObject oid = aVersionedObject oid.
	
	origdirty := dirty.
	
	names := Set new.
	
	out keysAndValuesDo: [:key :value | 
		value oid = aStubObject oid ifTrue:[ names add: key ] ].
	
	names do:[:each | self link: each to: aVersionedObject ].
	
	dirty := origdirty. 
	! !

!VersionedObject methodsFor: 'slots' stamp: 'DF 3/9/2024 23:32:04'!
at: aSymbol
	^ slots at: aSymbol! !

!VersionedObject methodsFor: 'slots' stamp: 'DF 3/9/2024 23:32:04'!
at: aSymbol put: anObject

	| result |
	
	result := slots at: aSymbol put: anObject.
	
	dirty := true.
	
	^result! !

!VersionedObject methodsFor: 'slots' stamp: 'DF 3/9/2024 23:32:04'!
removeSlotAt: aString
	slots removeKey: aString! !

!VersionedObject methodsFor: 'slots' stamp: 'DF 3/9/2024 23:32:04'!
slots
	^slots! !

!VersionedObject methodsFor: 'slots' stamp: 'DF 3/9/2024 23:32:04'!
slots: aJsonObj

	slots := aJsonObj.
	
	dirty := true.! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/12/2024 20:50:49'!
details

	^String streamContents:[:s | s nextPutAll: self class name ; nextPutAll: ' oid: ' , oid asString ; nextPutAll: ' rid: ' , rid asString ; nextPutAll: (dirty ifTrue:[' dirty'] ifFalse:[' clean']) ] ! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 3/13/2024 12:50:58'!
realize

	"do nothing. this method does not exist in the stub so calling it will force the stub to load the real object"! !

!VersionedObject methodsFor: 'private' stamp: 'DF 3/7/2024 11:55:15'!
addIncoming: aVersionedObject

	self assert: aVersionedObject notNil.
	
	in at: aVersionedObject oid put: aVersionedObject! !

!VersionedObject methodsFor: 'private' stamp: 'DF 3/14/2024 19:13:13'!
nullifyOutgoingTo: aVersionedEntity

	out := out collect:[:each | each notNil and:[each oid = aVersionedEntity oid] :: ifTrue:[nil] ifFalse:[each] ]
! !

!VersionedObject methodsFor: 'private' stamp: 'DF 3/13/2024 10:55:05'!
relink: anInteger to: aVersionedObject

	self assert: anInteger < 0.
	
	self assert: ((in at: anInteger) = aVersionedObject).
	
	in removeKey: anInteger.
	
	in at: aVersionedObject oid put: aVersionedObject.! !

!VersionedObject methodsFor: 'private' stamp: 'DF 3/7/2024 11:54:29'!
removeIncoming: aVersionedObject

	in removeKey: aVersionedObject oid! !

!VersionedObject class methodsFor: 'as yet unclassified' stamp: 'DF 3/20/2024 19:59:14'!
from: aDictionary 

	| aVersionedObject |
	
	aVersionedObject := self new.
	
	aVersionedObject oid: (aDictionary at: #oid) ; rid:(aDictionary at:#rid); slots: ((aDictionary at:#slots) collect:[:each | each decodeJsonCtor ]) ; description: (AnnotatedText fromXML:(aDictionary at:#description)) ; dirty: false .
	
	^aVersionedObject ! !

!VersionedObjectStub methodsFor: 'testing' stamp: 'DF 2/26/2024 20:59:02'!
isRealized
	^false! !

!VersionedObjectStub methodsFor: 'accessing' stamp: 'DF 2/25/2024 16:38:44'!
cache: anArchivistCache
	cache := anArchivistCache ! !

!VersionedObjectStub methodsFor: 'accessing' stamp: 'DF 3/20/2024 20:31:27'!
description

	self halt.
	^String streamContents:[:s | s nextPutAll: self class name ; nextPutAll: ' oid: ' , oid asString ] ! !

!VersionedObjectStub methodsFor: 'accessing' stamp: 'DF 2/25/2024 20:08:25'!
dirty
	^false! !

!VersionedObjectStub methodsFor: 'accessing' stamp: 'DF 2/26/2024 20:49:42'!
incoming
	^in! !

!VersionedObjectStub methodsFor: 'accessing' stamp: 'DF 2/26/2024 22:06:53'!
oid
	^oid! !

!VersionedObjectStub methodsFor: 'accessing' stamp: 'DF 2/29/2024 12:57:45'!
oid: anInteger

	self assert: anInteger notNil.
	
	oid := anInteger ! !

!VersionedObjectStub methodsFor: 'initialization' stamp: 'DF 2/25/2024 20:20:43'!
initialize
	in := Set new! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 2/28/2024 20:42:53'!
clean
	"a stub is always clean"! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 21:24:44'!
details

	^String streamContents:[:s | s nextPutAll: self class name ; nextPutAll: ' oid: ' , oid asString ] ! !

!VersionedObjectStub methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 21:19:01'!
doesNotUnderstand: aMessage

	| vobj |

	cache evict: oid.
		
	vobj := cache resolve: oid.
	
	in do:[:each | each replace: self with: vobj].
		
	^aMessage sendTo: vobj.! !

!VersionedObjectStub methodsFor: 'changes' stamp: 'DF 2/28/2024 20:43:59'!
addChangesTo: anOrderedCollection

	" a stub has no outgoing links "
	! !

!VersionedObjectStub methodsFor: 'links' stamp: 'DF 3/14/2024 13:43:23'!
link: aString to: aVersionedEntity

	aVersionedEntity ifNotNil:[ aVersionedEntity addIncoming: self ].
! !

!VersionedObjectStub methodsFor: 'links' stamp: 'DF 3/14/2024 20:11:12'!
linkNameOf: anInteger

	^'...'! !

!VersionedObjectStub methodsFor: 'links' stamp: 'DF 3/13/2024 11:22:02'!
relink: anInteger to: aVersionedObject

	"do nothing as the stub does not keep the incoming objects indexed by their oid"! !

!VersionedObjectStub methodsFor: 'private' stamp: 'DF 2/25/2024 20:21:03'!
addIncoming: aLink
	in add: aLink! !

!VersionedObjectStub methodsFor: 'private' stamp: 'DF 2/28/2024 22:20:10'!
removeIncoming: aLink
	in remove: aLink! !

!Object methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:08:28'!
decodeJsonCtor
	^self! !

!Object methodsFor: '*Archivist' stamp: 'DF 3/12/2024 19:54:44'!
encodeJsonCtor

	^JsonObject fromAssociations: { #v -> self . #c -> self class name }
	! !

!Boolean methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:26:43'!
addFieldOn: anObject at: aKey to: aMold
	^aMold checkboxField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Boolean methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:03:43'!
encodeJsonCtor
	^self! !

!Float methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:26:54'!
addFieldOn: anObject at: aKey to: aMold
	^aMold floatField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Float methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:03:31'!
encodeJsonCtor
	^self! !

!Integer methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:00'!
addFieldOn: anObject at: aKey to: aMold
	^aMold integerField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Integer methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:03:56'!
encodeJsonCtor
	^self! !

!DateAndTime methodsFor: '*Archivist' stamp: 'DF 3/11/2024 22:31:17'!
jsonWriteOn: aStream

	aStream nextPut:$".

	self printOn: aStream .
	
	aStream nextPut:$".
! !

!Time methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:34'!
addFieldOn: anObject at: aKey to: aMold
	^aMold timeField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Time methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:19:36'!
jsonWriteOn: aStream

	aStream nextPut:$".

	self print24: true showSeconds: true showSecondsFraction:true on: aStream .
	
	aStream nextPut:$".
! !

!Date methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:28'!
addFieldOn: anObject at: aKey to: aMold
	^aMold dateField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Date methodsFor: '*Archivist' stamp: 'DF 3/11/2024 22:30:54'!
jsonWriteOn: aStream

	aStream nextPut:$".
	
	self printOn: aStream format: #(3 2 1 $- 1 1 2).
	
	aStream nextPut:$".
! !

!BlockClosure methodsFor: '*Archivist' stamp: 'DF 3/13/2024 11:03:53'!
on: anException do: aBlock ensure: anEnsureBlock

	^[ self on: anException do: aBlock ] ensure: anEnsureBlock ! !

!CharacterSequence methodsFor: '*Archivist' stamp: 'DF 3/8/2024 11:27:11'!
addFieldOn: anObject at: aKey to: aMold
	^aMold stringField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!CharacterSequence methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:04:09'!
encodeJsonCtor
	^self! !

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

!JsonObject methodsFor: '*Archivist' stamp: 'DF 3/12/2024 20:07:49'!
decodeJsonCtor

	^Smalltalk classNamed: (self at:#c) :: fromString: (self at:#v).
	! !

!SocketStream class methodsFor: '*Archivist' stamp: 'DF 3/9/2024 20:20:17'!
openConnectionToHostNamed: hostName port: portNumber timeout: anInteger
	| hostIP |
	hostIP := NetNameResolver addressForName: hostName timeout: anInteger.
	^self openConnectionToHost: hostIP port: portNumber timeout: anInteger! !

!Mold methodsFor: '*Archivist' stamp: 'DF 3/20/2024 23:42:32'!
openDialog: title at: aPoint

	| panel |
	
	panel := nil.
	
	panel := PluggableDialogPanel 
		open: self
		label: title 
		view: #renderForms 
		action: [self validate.
			panel morphExtent: panel minimumExtent. "I don't like to do it manually"
			self isValid 	ifTrue: [
				self save.
				self triggerEvent: #edited.
				panel delete] ].
		
	panel morphPosition: aPoint.! !
