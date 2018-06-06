!classDefinition: #TusLibrosTest category: #'TDD - TusLibros'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: 'aCart anItem aCatalogue anInvalidItem'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:41:59'!
setUp

	anItem := 'ItemA'.
	aCatalogue := OrderedCollection new.
	aCatalogue add: anItem. 
	aCart := Cart newWith: aCatalogue.
	anInvalidItem := 'ItemB'.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:37:59'!
test01CreateACartAndItIsEmpty
	
	self assert: aCart isEmpty

	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:39:40'!
test02ACartCanAddAnItem
	
	aCart addItem: anItem.
	self deny: aCart isEmpty

	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:40:04'!
test03AddSomeItemAndCartKnowsQuantityOfTotalItems

	aCart addItem: anItem quantity: 2.
	self assert: aCart itemsQuantity = 2
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:40:28'!
test04AddAnItemAndTheCartKnowsQuantityOfThatItem

	aCart addItem: anItem quantity: 2.
	self assert: (aCart quantityOfTheItem: anItem) = 2
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:40:44'!
test05AddANegativeQuantityOfItemIsIncorrect

	self 
		should: [ aCart addItem: anItem quantity: -1.] 
		raise: Error 
		withExceptionDo: [ :invalidQuantity |
			self assert: Cart invalidQuantityMessageDescription = invalidQuantity messageText .
			self assert: aCart isEmpty.	
			]
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:41:02'!
test05BAddZeroQuantityOfItemIsIncorrect

	self 
		should: [ aCart addItem: anItem quantity: 0.] 
		raise: Error 
		withExceptionDo: [ :invalidQuantity |
			self assert: Cart invalidQuantityMessageDescription = invalidQuantity messageText .
			self assert: aCart isEmpty.	
			]
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:42:11'!
test06CannotAddAnItemAbsentInCatalogue

	self 
		should: [ aCart addItem: anInvalidItem quantity: 1.] 
		raise: Error 
		withExceptionDo: [ :invalidItem |
			self assert: Cart invalidItemMessageDescription = invalidItem messageText .
			self assert: aCart isEmpty.	
			]
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:42:23'!
test07RemoveTheOnlyOneItemEmptiesTheCart

	aCart addItem: anItem.
	aCart removeTheItem: anItem.
	
	self assert: aCart isEmpty.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:42:39'!
test08AddTwoItemsAndRemoveOneLetOneItem

	
	aCart addItem: anItem quantity: 2.
	aCart removeTheItem: anItem.
	
	self assert: (aCart quantityOfTheItem: anItem) equals: 1.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:42:49'!
test09CanRemoveMoreThanOneItem

	
	aCart addItem: anItem quantity: 3.
	aCart removeTheItem: anItem quantity: 2.
	
	self assert: (aCart quantityOfTheItem: anItem) equals: 1.! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:43:00'!
test10CannotRemoveMoreItemsThatItHas


	aCart addItem: anItem quantity: 1.
		
	self 
		should: [ aCart removeTheItem: anItem quantity: 2.] 
		raise: Error 
		withExceptionDo: [ :invalidItem |
			self assert: Cart invalidQuantityMessageDescription = invalidItem messageText .
			self assert: (aCart quantityOfTheItem: anItem) equals: 1.
			]
	

! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:43:16'!
test11CannotRemoveNegativeQuantityOfItems

	
	aCart addItem: anItem quantity: 1.
		
	self 
		should: [ aCart removeTheItem: anItem quantity: -1.] 
		raise: Error 
		withExceptionDo: [ :invalidItem |
			self assert: Cart invalidQuantityMessageDescription = invalidItem messageText .
			self assert: (aCart quantityOfTheItem: anItem) equals: 1.
			]
	

! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:43:27'!
test12CannotRemoveItemsThatItDoesntHave

	aCart addItem: anItem quantity: 1.
		
	self 
		should: [ aCart removeTheItem: anInvalidItem quantity: 1.] 
		raise: Error 
		withExceptionDo: [ :invalidItem |
			self assert: Cart invalidItemMessageDescription = invalidItem messageText .
			self assert: (aCart quantityOfTheItem: anItem) equals: 1.
			self assert: (aCart quantityOfTheItem: anInvalidItem) equals: 0.
			]
	

! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/6/2018 13:36:50'!
test13CartCanListTheItemItHas

	|aCart anItem aCatalogue |
	
	anItem := 'ItemA'.
	aCatalogue := OrderedCollection new.
	aCatalogue add: anItem.
	aCart := Cart newWith: aCatalogue.
	aCart addItem: anItem quantity: 1.
	
	
	

! !


!classDefinition: #Cart category: #'TDD - TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'items catalogue'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TusLibros'!

!Cart methodsFor: 'inspecting' stamp: 'JL 6/6/2018 13:55:12'!
assertAQuantityIsValid: aQuantity

	aQuantity <= 0 ifTrue: [self error: self class invalidQuantityMessageDescription ].! !

!Cart methodsFor: 'inspecting' stamp: 'JL 6/6/2018 13:52:59'!
assertItHasTheQuantity: aQuantity withRealQuantity: aQuantityOfItem.
	
	aQuantity > aQuantityOfItem ifTrue: [self error: self class invalidQuantityMessageDescription ]! !

!Cart methodsFor: 'inspecting' stamp: 'JL 6/6/2018 13:46:29'!
assertItemIsIncludedInCart: anItem

		(self itemsIncludes: anItem) ifFalse: [self error: self class invalidItemMessageDescription ].! !

!Cart methodsFor: 'inspecting' stamp: 'JL 6/5/2018 21:29:02'!
isEmpty
	^items isEmpty! !

!Cart methodsFor: 'inspecting' stamp: 'JL 6/5/2018 21:26:10'!
removeTheItem: anItem

	self removeTheItem: anItem quantity: 1.
	! !

!Cart methodsFor: 'inspecting' stamp: 'JL 6/6/2018 13:50:45'!
removeTheItem: anItem quantity: aQuantity 
	
	| aQuantityOfItem |
	
	self assertItemIsIncludedInCart: anItem.
	aQuantityOfItem := (items at: anItem).
	self assertAQuantityIsValid: aQuantity.
	self assertItHasTheQuantity: aQuantity withRealQuantity: aQuantityOfItem.
	aQuantityOfItem := aQuantityOfItem  - aQuantity.
	items at: anItem put: aQuantityOfItem.
	(aQuantityOfItem = 0) ifTrue: [items removeKey: anItem]
	! !


!Cart methodsFor: 'accesing' stamp: 'JL 6/5/2018 21:07:29'!
addItem: anItem

	self addItem: anItem quantity: 1.! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/6/2018 13:54:05'!
addItem: anItem quantity: aQuantity

	self assertAQuantityIsValid: aQuantity.
	self assertItemIsIncludedInCatalogue: anItem. 
	
	items at: anItem ifPresent: [:aQuantityOfItem | items at: anItem put: (aQuantity + aQuantityOfItem)]
						ifAbsent: [items at: anItem put: aQuantity] ! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/6/2018 13:53:57'!
assertItemIsIncludedInCatalogue: anItem


	(catalogue includes: anItem) ifFalse: [self error: self class invalidItemMessageDescription ].! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/6/2018 13:30:43'!
itemsIncludes: anItem

	^(items keys) includes: anItem! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/5/2018 20:45:56'!
itemsQuantity
	^items values sum! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/5/2018 20:47:39'!
quantityOfTheItem: anItem 
	
	items at: anItem ifPresent: [:aQuantity | ^aQuantity] .
	^0! !


!Cart methodsFor: 'initialization' stamp: 'JL 6/5/2018 20:54:40'!
initializeWith: aCatalogue 
	catalogue := aCatalogue.
	items := Dictionary new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TDD - TusLibros'!
Cart class
	instanceVariableNames: 'items'!

!Cart class methodsFor: 'errorMessages' stamp: 'JL 6/6/2018 13:28:22'!
invalidItemMessageDescription
	^'Invalid item'! !

!Cart class methodsFor: 'errorMessages' stamp: 'JL 6/5/2018 20:31:37'!
invalidQuantityMessageDescription

	^'Invalid quantity'! !


!Cart class methodsFor: 'initialization' stamp: 'JL 6/5/2018 20:53:54'!
newWith: aCatalogue 
	^self new initializeWith: aCatalogue! !
