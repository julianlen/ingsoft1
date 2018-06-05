!classDefinition: #TusLibrosTest category: #'TDD - TusLibros'!
TestCase subclass: #TusLibrosTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TusLibros'!

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/4/2018 21:15:33'!
test01CreateACartAndItIsEmpty
	
	|aCart|

	aCart := Cart new.
	self assert: aCart isEmpty

	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/4/2018 21:17:35'!
test02ACartCanAddAnItem
	
	|aCart|

	aCart := Cart new.
	aCart addItem: 'anItem'.
	self deny: aCart isEmpty

	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/4/2018 21:42:01'!
test03AddSomeItemAndCartKnowsQuantityOfTotalItems

	|aCart|
	
	aCart := Cart new.
	aCart addItem: 'ItemA' quantity: 2.
	self assert: aCart itemsQuantity = 2
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/4/2018 21:48:25'!
test04AddAnItemAndTheCartKnowsQuantityOfThatItem

	|aCart anItem|
	
	aCart := Cart new.
	anItem := 'ItemA'.
	aCart addItem: anItem quantity: 2.
	self assert: (aCart quantityOfTheItem: anItem) = 2
	


	! !

!TusLibrosTest methodsFor: 'as yet unclassified' stamp: 'JL 6/4/2018 21:53:27'!
test05AddANegativeQuantityOfItemIsIncorrect

	|aCart anItem|
	
	aCart := Cart new.
	anItem := 'ItemA'.
	aCart addItem: anItem quantity: -1.
	"QUE TIRA UN ERROR"
	self assert: aCart isEmpty.
	self assert: (aCart quantityOfTheItem: anItem) = 0
	


	! !


!classDefinition: #Cart category: #'TDD - TusLibros'!
Object subclass: #Cart
	instanceVariableNames: 'items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TusLibros'!

!Cart methodsFor: 'inspecting' stamp: 'JL 6/4/2018 21:20:56'!
isEmpty
	^items isEmpty! !


!Cart methodsFor: 'accesing' stamp: 'JL 6/4/2018 21:18:56'!
addItem: anItem

	items add: anItem! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/4/2018 21:28:58'!
addItem: anItem quantity: aQuantity

	|aQuantityIndex|
	
	aQuantityIndex := aQuantity .
	
	[aQuantityIndex > 0] whileTrue: [self addItem: anItem. aQuantityIndex := aQuantityIndex - 1]! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/4/2018 21:19:44'!
initialize

	items := OrderedCollection new.! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/4/2018 21:29:10'!
items
	
	^items! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/4/2018 21:40:30'!
itemsQuantity
	^items size! !

!Cart methodsFor: 'accesing' stamp: 'JL 6/4/2018 21:47:17'!
quantityOfTheItem: anItem 
	
	^ ((self items) select: [:item | item = anItem]) size! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #'TDD - TusLibros'!
Cart class
	instanceVariableNames: 'items'!
