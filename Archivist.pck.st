'From Cuis6.0 [latest update: #6153] on 6 March 2024 at 1:46:16 pm'!
'Description '!
!provides: 'Archivist' 1 54!
!requires: 'PostgresAdapter' 1 62 nil!
!requires: 'LayoutAlgebra' 1 4 nil!
SystemOrganization addCategory: #Archivist!


!classDefinition: #ArchivistCacheModel category: #Archivist!
TextProvider subclass: #ArchivistCacheModel
	instanceVariableNames: 'cache selection'
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

!classDefinition: #ArchivistCacheWindow category: #Archivist!
SystemWindow subclass: #ArchivistCacheWindow
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchivistCacheWindow class' category: #Archivist!
ArchivistCacheWindow class
	instanceVariableNames: ''!

!classDefinition: #PluggableJsonMorph category: #Archivist!
PluggableMorph subclass: #PluggableJsonMorph
	instanceVariableNames: 'mold objectGetter scrollPane button'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'PluggableJsonMorph class' category: #Archivist!
PluggableJsonMorph class
	instanceVariableNames: ''!

!classDefinition: #JsonListItemWrapper category: #Archivist!
ListItemWrapper subclass: #JsonListItemWrapper
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'JsonListItemWrapper class' category: #Archivist!
JsonListItemWrapper class
	instanceVariableNames: ''!

!classDefinition: #ArchivistCache category: #Archivist!
Object subclass: #ArchivistCache
	instanceVariableNames: 'connection vobjects fresh next'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ArchivistCache class' category: #Archivist!
ArchivistCache class
	instanceVariableNames: ''!

!classDefinition: #JsonObjectModel category: #Archivist!
Object subclass: #JsonObjectModel
	instanceVariableNames: 'jobj'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'JsonObjectModel class' category: #Archivist!
JsonObjectModel class
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
	instanceVariableNames: 'content description in out'
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

!classDefinition: #ChoiceField category: #Archivist!
SelectField subclass: #ChoiceField
	instanceVariableNames: 'key obj'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Archivist'!
!classDefinition: 'ChoiceField class' category: #Archivist!
ChoiceField class
	instanceVariableNames: ''!


!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 22:27:11'!
cache: anArchivistCache

	cache := anArchivistCache.
	
! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 19:36:40'!
cloneSelectedObject

	selection ifNil:[^self].
	
	selection := cache clone: selection.
	
	self selectionIndex: self selectionIndex. "not terribly efficient but this way we have just one place that sends  change messages"
	
	
	
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/3/2024 20:37:06'!
commit: aText

	cache checkin: aText asString.
	
	self changed: #oidDisplayList ; changed: #selectionDetails! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 15:29:53'!
description

	selection ifNil:[^''].
	
	selection isRealized :: ifFalse: [^''].

	^selection description! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 15:35:35'!
description: aString

	selection ifNil:[^false].
	
	selection isRealized :: ifFalse: [^false].

	selection description: aString.
	
	self changed: #oidDisplayList.
	
	^true
! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 20:11:31'!
fetchObject

	selection ifNil:[^self].
	
	selection isRealized ifTrue:[^self].
	
	selection content. "force the stub to fetch itself from the db"
	
	self selectionIndex: self selectionIndex.! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 2/27/2024 19:00:45'!
incoming
	selection ifNil:[^{}].
	
	selection isObject ifFalse:[^''].

	^selection incoming collect:[:each | each oid ] :: asOrderedCollection sort! !

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

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 16:23:44'!
outgoing
	selection ifNil:[^{}].
	
	selection isKindOf: VersionedObject :: ifFalse:[^''].

	^selection outgoing associations collect:[:each | each key -> (each value ifNil:[each value] ifNotNil:[each value oid]) ].! !

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

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 15:32:22'!
selectionIndex: anInteger

	| oids |
	
	anInteger = 0 ifFalse:[
	
		oids := self oids.
	
		selection :=  cache resolve: (oids at: anInteger).
	].
	
	self changed: #oidDisplayList; changed: #description ; changed: #incoming ; changed: #outgoing ; changed: #selectionDetails ; changed: #slots
	! !

!ArchivistCacheModel methodsFor: 'as yet unclassified' stamp: 'DF 3/4/2024 20:39:53'!
slots

	selection ifNil:[^JsonObject new].
	
	selection isRealized ifFalse:[^JsonObject new].
	
	^selection content "associations collect:[: each | JsonListItemWrapper with: each ]"
! !

!NonDeterministicChoice class methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2024 13:29:25'!
addFieldOn: anObject at: aKey to: aMold
	^aMold fields add: (ChoiceField new on: aKey of: anObject )! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 10:54:08'!
buildMorphicWindow

self layoutMorph addMorph:

(TextModelMorph textProvider: model textGetter: #selectionDetails  :: pw:1.0 ; fh:18)
</>
(
	(PluggableListMorph model: model listGetter: #oidDisplayList indexGetter: #selectionIndex indexSetter: #selectionIndex: mainView: self menuGetter: #residentObjectsMenu keystrokeAction: nil :: ph:1 ; pw:0.25)
	<+>
	(PluggableListMorph model: model listGetter: #incoming indexGetter: nil indexSetter: nil :: ph:1 ; pw:0.25)
	<+>
	(PluggableJsonMorph new model: model ; objectGetter: #slots ; yourself :: ph:1 ;pw:0.25)
	<+>
	(PluggableListMorph model: model listGetter: #outgoing indexGetter: nil indexSetter: nil :: ph: 1 ; pw:0.25) ph:0.3
)
</>
(TextModelMorph textProvider: model textGetter: #description textSetter:#description: :: pw:1.0 ; ph:0.7).

self setLabel:'Archivist Browser'.

! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 19:30:16'!
cloneSelectedObject

	model cloneSelectedObject.
	
	! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 20:10:10'!
fetchObject

	model fetchObject.
	! !

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 19:48:48'!
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

!ArchivistCacheWindow methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 10:54:08'!
residentObjectsMenu

	| aMenu |
	
	aMenu := MenuMorph new defaultTarget: self.
	
	aMenu addTitle: 'Resident objects'.
	aMenu addItemsFromDictionaries: `{
		{
			#label 			-> 			'commit changes ...'.
			#selector 		-> 			#openCommitDialog .
			#balloonText 	-> 			'Commit all the changes to objects that were modified since the last commit.'
		} asDictionary.
		nil.
		{
			#label 			-> 			'clone'.
			#selector 		-> 			#cloneSelectedObject.
			#balloonText 	-> 			'Clone the selected object. The selected object becomes the clone''s prototype.'
		} asDictionary.

		{
			#label 			-> 			'fetch'.
			#selector 		-> 			#fetchObject.
			#balloonText 	-> 			'Replace the selected stub with the actual object.'
		} asDictionary.

	}`.
	^aMenu! !

!PluggableJsonMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 10:48:07'!
initialize

	| widget |
	
	super initialize.
	
	scrollPane := PluggableScrollPane new. 
 
	button := PluggableButtonMorph new label: 'Save'.
		
	widget := (scrollPane pw:1 ; ph:1) </> (button align: #rightOrBottom).
	
	self addMorph: widget.! !

!PluggableJsonMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/4/2024 21:53:29'!
layoutBounds
	"Return the bounds for laying out children of the receiver"
	"Exclude the label area"

	^ 0@0 extent: self morphExtentInOwner! !

!PluggableJsonMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 10:30:48'!
layoutSubmorphs

	| myBounds |
	
	myBounds := self layoutBounds.
	
	submorphs do:[:each | each
		morphPosition: myBounds origin;
		morphExtent: myBounds extent ]
! !

!PluggableJsonMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/4/2024 20:03:53'!
objectGetter: aSymbol
	objectGetter := aSymbol! !

!PluggableJsonMorph methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2024 13:45:45'!
update: aSymbol

	| obj form |
	
	mold := Mold new.
	
	obj := 	model perform: objectGetter.
	
	obj keysAndValuesDo: [:key :value | ( value class addFieldOn:obj at:key to: mold ) label: key ; customize:[:w :i :e | i borderColor: Color veryLightGray ] ].
	
	form := obj isEmpty ifTrue:[LabelGroup new] ifFalse:[mold renderForms].
	
	form morphExtent: scrollPane viewableWidth @ form morphHeight.
	
	scrollPane scroller: form.! !

!JsonListItemWrapper methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 22:59:47'!
asString

	item value isKindOf: JsonObject :: ifTrue:[^item key].

	item value isKindOf: Array :: ifTrue:[^item key ].

	^item key asString , ': ', item value asString! !

!JsonListItemWrapper methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:02:55'!
contents

	| p |
	
	p := item value.
	
	p isKindOf: JsonObject :: ifTrue:[^p associations collect:[:each | JsonListItemWrapper with: each] ].

	p isKindOf: Array :: ifTrue:[^p withIndexCollect:[:each :i | JsonListItemWrapper with: i -> each] ].
		
	^Array new! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/3/2024 20:34:56'!
checkin: comment 

	| changes aWriteStream statement result base |

	changes := OrderedCollection new.
	
	fresh do:[:each | each addChangesTo: changes].
	
	vobjects do:[:each | 			each dirty ifTrue:[each addChangesTo: changes ] ]. 
	
	aWriteStream := WriteStream on:''.
	
	aWriteStream nextPut:$[.
	
	changes do:[:each | aWriteStream nextPutAll: each ] separatedBy:[aWriteStream nextPut:$, ].
	
	aWriteStream nextPut:$].

	connection executeQuery: 'START TRANSACTION'.
	
	statement := connection prepare: 'CALL new_changeset($1, $2, $3)'.

	result := statement executeQuery: { comment . aWriteStream contents . 0 }.

	connection executeQuery: 'COMMIT'.

	statement close.

	base := result recordsAsDictionaries first at:#_max_oid.
	
	"Replace the fresh objects in vobjects by removing their association to the fresh (negative) keys
	and adding them back with their persistent keys"
	
	fresh do:[:each | vobjects removeKey: each oid]. 
	
	fresh do:[:each | each rid:1 ; fix:base ].

	vobjects addAll: fresh.

	vobjects do:[:each | each dirty ifTrue:[ each incrementRid ; clean ] ]. 
	
	fresh := Dictionary new.
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

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 12:44:58'!
deferredFetch: oid

	oid ifNil:[^nil]. 

	^ vobjects at: oid ifAbsent:[ | vobj |
		vobj := VersionedObjectStub new oid: oid ; cache: self ; yourself. 
		vobjects at: oid put: vobj. vobj		]. ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 20:23:14'!
evict: oid

	self assert: (fresh includesKey: oid) not. "we cannot evict a modified object"
	
	self assert: (vobjects includesKey:oid). "oid in vobjects"
	
	vobjects removeKey: oid.
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:22:42'!
fetch: oid

	| statement attrs result |
	
	self assert: oid notNil.
	
	self assert: oid > 0.
	
	statement := connection prepare: 'SELECT * FROM checkout_vobject($1)'.

	result := statement executeQuery: (Array with: oid).

	statement close.
	
	attrs := result recordsAsDictionaries first.

	^ VersionedObject from: attrs.
! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 20:31:22'!
fetchLinks: oid

	| statement result |

	self assert: oid notNil.
			
	statement := connection prepare: 'SELECT * FROM checkout_links($1)'.

	result := statement executeQuery: (Array with: oid).

	statement close.
	
	result recordsAsDictionaries do:[:each | | source target |
		
		source := self deferredFetch: (each at:#oid).
		target := self deferredFetch: (each at:#oidtarget).
		
		self assert: source notNil.
		
		source linkAt: (each at:#name) put: target.
		source clean. "normally changing links makes the object dirty but not the first time we fetch it from the db." ].  
		
	! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 18:58:59'!
fresh
	^fresh  ! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 23:24:37'!
initialize

	vobjects := Dictionary new.
	
	next := -1. "the first object identifier for new objects."
	
	fresh := Dictionary new. "collection of newly create vobjects"! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 08:25:31'!
lookup: aString

	| statement result aDictionary |
	
	statement := connection prepare: 'SELECT oid FROM global WHERE root.name = $1'.

	result := statement executeQuery: (Array with: aString).

	statement close.
	
	aDictionary := result recordsAsDictionaries first.

	^aDictionary at:#oid.
! !

!ArchivistCache methodsFor: 'as yet unclassified' stamp: 'DF 2/26/2024 18:58:53'!
old
	^vobjects ! !

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

!JsonObjectModel methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 22:45:23'!
getList
	^jobj associations collect:[: each | JsonListItemWrapper with: each ]
	! !

!JsonObjectModel methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 22:28:34'!
jobj: aJsonObject

	jobj := aJsonObject! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:56:56'!
dictionary: aDictionary
	dict := aDictionary ! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:56:43'!
key: anObject
	key := anObject! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:55:41'!
valueAtKey
	^ dict at:key! !

!KeyHolder methodsFor: 'as yet unclassified' stamp: 'DF 3/5/2024 09:56:01'!
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

!VersionedObject methodsFor: 'converting' stamp: 'DF 3/3/2024 22:46:30'!
asJSON

	| aWriteStream |
	
	aWriteStream := WriteStream on: ''.
	
	out associations do:[:assoc | | id | 
		id := assoc value ifNil:[0] ifNotNil:[assoc value oid]. 
		aWriteStream nextPutAll: ('\{"target":{1}, "name":"{2}" \}' format: { id . assoc key} ) ] separatedBy: [ aWriteStream nextPutAll: ','].

^ '\{"oid": {1} , "rid":{2}, "slots" : {3} , "description" : {4}, "links":[{5}] \}' format: { oid . rid . (Json render: content)  . description jsonPrint . aWriteStream contents }! !

!VersionedObject methodsFor: 'initialization' stamp: 'DF 3/2/2024 21:17:22'!
initialize
	in := Set new.
	out := Dictionary new.
	content := JsonObject new.
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

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/29/2024 13:16:56'!
at: aSymbol
	^ content at: aSymbol! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/2/2024 15:12:15'!
at: aSymbol put: anObject

	| result |
	
	result := content at: aSymbol put: anObject.
	
	dirty := true.
	
	^result! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:23:35'!
content
	^content! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/29/2024 12:55:45'!
content: aJsonObj

	content := aJsonObj.
	
	dirty := true.! !

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

!VersionedObject methodsFor: 'accessing' stamp: 'DF 3/2/2024 15:12:47'!
linkAt: aString put: aVersionedEntity 

	out at: aString ifPresent:[:old | old removeIncoming: self].
	
	out at: aString put: aVersionedEntity. 
	
	aVersionedEntity ifNotNil:[ aVersionedEntity addIncoming: self ].
	
	dirty := true.
	! !

!VersionedObject methodsFor: 'accessing' stamp: 'DF 2/26/2024 18:59:45'!
outgoing
	^out ! !

!VersionedObject methodsFor: 'copying' stamp: 'DF 3/1/2024 14:01:45'!
clone: newoid

	| vobj c p |
	
	vobj := self class new.
	
	vobj oid: newoid.
	
	c := JsonObject new.
	p := self.
	
	[p notNil] whileTrue:[ | t |
		
		t := JsonObject new.
		t := t , p content.
		c := t, c.

		p := p linkAt: 'parent' ifAbsent:[nil] ]. 
	
	vobj content: c.
	
	vobj linkAt: 'prototype' put: self.
	
	^vobj! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 12:54:39'!
addIncoming: aVersionedObject

	self assert: aVersionedObject notNil.
	
	in add: aVersionedObject! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 2/25/2024 22:05:17'!
fix: base

	self assert: oid < 0.
	
	oid := oid * -1 + base
	! !

!VersionedObject methodsFor: 'as yet unclassified' stamp: 'DF 2/29/2024 12:56:10'!
removeIncoming: aVersionedObject
	in remove: aVersionedObject! !

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

!VersionedObject class methodsFor: 'as yet unclassified' stamp: 'DF 3/2/2024 15:07:36'!
from: aDictionary 

	| aVersionedObject |
	
	aVersionedObject := self new.
	
	aVersionedObject oid: (aDictionary at: #oid) ; rid:(aDictionary at:#rid); content: (aDictionary at:#slots) ; description: (aDictionary at:#description) ; dirty: false .
	
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

!ChoiceField methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2024 13:24:51'!
on: aSymbol of: model

	key := aSymbol.
	
	obj := model.
	
	^super on: #listIndex of: (ListModel with: (model at: key))! !

!ChoiceField methodsFor: 'as yet unclassified' stamp: 'DF 3/6/2024 13:22:08'!
save
	
	obj at: key put: listModel selectedItem.! !

!Boolean class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 12:46:42'!
addFieldOn: anObject at: aKey to: aMold
	^aMold checkboxField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Float class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 12:49:00'!
addFieldOn: anObject at: aKey to: aMold
	^aMold floatField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Integer class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 12:49:21'!
addFieldOn: anObject at: aKey to: aMold
	^aMold integerField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Time class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 12:50:17'!
addFieldOn: anObject at: aKey to: aMold
	^aMold timeField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Date class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 12:50:05'!
addFieldOn: anObject at: aKey to: aMold
	^aMold dateField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!CharacterSequence methodsFor: '*Archivist' stamp: 'DF 3/2/2024 22:13:08'!
jsonPrint
	
	| aWriteStream |
		
	aWriteStream := WriteStream on:''.

	 self jsonWriteOn: aWriteStream.
	
	^aWriteStream contents ! !

!CharacterSequence class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 13:44:56'!
addFieldOn: anObject at: aKey to: aMold
	^aMold stringField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!Text methodsFor: '*Archivist' stamp: 'DF 3/2/2024 22:12:50'!
jsonPrint

	^self string jsonPrint
	! !

!Text class methodsFor: '*Archivist' stamp: 'DF 3/6/2024 12:50:39'!
addFieldOn: anObject at: aKey to: aMold
	^aMold textField on: #valueAtKey of:(KeyHolder on: anObject at: aKey)! !

!JsonObject methodsFor: '*Archivist' stamp: 'DF 3/6/2024 13:32:29'!
merge: newJsonObject old: oldJsonObject

	| keys result |
	
	result := OrderedCollection new.
	
	keys := Set new , oldJsonObject keys , self keys, newJsonObject keys.
	
	keys do:[:each | 
		
		(self includesKey: each) and:[newJsonObject includesKey:each] :: 
			ifTrue: [	result add: each -> (Set with: (self at:each)  with: (newJsonObject at:each)) ].

		(self includesKey: each) and:[(newJsonObject includesKey:each) not] :: 
			ifTrue: [
				(oldJsonObject includesKey: each) not or:[ (oldJsonObject at: each) ~= (self at:each)] ::
					ifTrue:[ result add: each -> (Set with: (self at:each)) ] ].
		(self includesKey: each) not and:[(newJsonObject includesKey:each) ] :: 
			ifTrue: [ result add: each -> (Set with: (newJsonObject at:each)) ] ].
		
	^ JsonObject fromAssociations: (result collect:[:each | | v | 
		v := each value size = 1 ifTrue:[each value anyOne] ifFalse:[NonDeterministicChoice new addAll: each value ; yourself]. 		each key -> v ])
			
! !
