!classDefinition: #CartTest category: #TusLibros!
TestCase subclass: #CartTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:08'!
test01NewCartsAreCreatedEmpty

	self assert: self createCart isEmpty! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test02CanNotAddItemsThatDoNotBelongToStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [ cart add: self itemNotSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test03AfterAddingAnItemTheCartIsNotEmptyAnymore

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self deny: cart isEmpty ! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test04CanNotAddNonPositiveNumberOfItems

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 0 of: self itemSellByTheStore ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidQuantityErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test05CanNotAddMoreThanOneItemNotSellByTheStore

	| cart |
	
	cart := self createCart.
	
	self 
		should: [cart add: 2 of: self itemNotSellByTheStore  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = cart invalidItemErrorMessage.
			self assert: cart isEmpty ]! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test06CartRemembersAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: self itemSellByTheStore.
	self assert: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:43'!
test07CartDoesNotHoldNotAddedItems

	| cart |
	
	cart := self createCart.
	
	self deny: (cart includes: self itemSellByTheStore)! !

!CartTest methodsFor: 'tests' stamp: 'HernanWilkinson 6/17/2013 17:45'!
test08CartRemembersTheNumberOfAddedItems

	| cart |
	
	cart := self createCart.
	
	cart add: 2 of: self itemSellByTheStore.
	self assert: (cart occurrencesOf: self itemSellByTheStore) = 2! !

!CartTest methodsFor: 'tests' stamp: 'JL 6/11/2018 00:48:19'!
test09CashierCannotCheckoutAnEmptyCart

	| aCashier anEmptyCart aCreditCard |
	anEmptyCart := self createCart .
	aCashier := self createCashier.
	aCreditCard := self validCreditCard .
	
	
	
	self 
		should: [aCashier checkout: anEmptyCart  withCreditCard: aCreditCard.  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = aCashier invalidCartCheckoutErrorMessage.
			]! !

!CartTest methodsFor: 'tests' stamp: 'JL 6/11/2018 00:48:29'!
test10CheckoutReturnValidSum

	| aCashier aCart aCreditCard |
	aCart := self createCart .
	aCart add: 2 of: self itemSellByTheStore .
	aCashier := self createCashier.
	aCreditCard := self validCreditCard.
	
	
	self assert: (aCashier checkout: aCart  withCreditCard: aCreditCard) equals: 2*peso.! !

!CartTest methodsFor: 'tests' stamp: 'JL 6/11/2018 00:48:35'!
test11CashierCannotCheckoutWithExpiredCreditCard

	| aCashier aCart aCreditCard |
	aCart := self createCart .
	aCart add: 1 of: self itemSellByTheStore .
	aCashier := self createCashier.
	aCreditCard := self invalidCreditCard.
	
	self 
		should: [aCashier checkout: aCart withCreditCard: aCreditCard.  ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: anError messageText = aCashier creditCardExpiredErrorMessage.
			]! !

!CartTest methodsFor: 'tests' stamp: 'JL 6/11/2018 00:49:00'!
test12CashierCanCheckoutAndPaidToMerchantProcessor
	| aCashier aCart aCreditCard |
	aCart := self createCart .
	aCart add: 1 of: self itemSellByTheStore .
 	aCashier := self createCashier.
	aCreditCard := self validCreditCard.
	self assert: (aCashier checkout: aCart  withCreditCard: aCreditCard) equals: 1*peso.! !


!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:48'!
createCart
	
	^Cart acceptingItemsOf: self defaultCatalog! !

!CartTest methodsFor: 'support' stamp: 'JL 6/11/2018 00:48:03'!
createCashier
	
	^Cashier initializeAcceptingItemsOf: self defaultCatalog.! !

!CartTest methodsFor: 'support' stamp: 'JL 6/9/2018 19:15:07'!
defaultCatalog
	
	|aCatalog|
	aCatalog := Dictionary new.
	aCatalog at: self itemSellByTheStore put: 1*peso.
	^ aCatalog .! !

!CartTest methodsFor: 'support' stamp: 'JL 6/11/2018 00:37:52'!
invalidCreditCard


	^CreditCard createCartWithExpiredDate: FixedGregorianDate theBeginningOfTime.

! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:44'!
itemNotSellByTheStore
	
	^'invalidBook'! !

!CartTest methodsFor: 'support' stamp: 'HernanWilkinson 6/17/2013 17:43'!
itemSellByTheStore
	
	^ 'validBook'! !

!CartTest methodsFor: 'support' stamp: 'JL 6/11/2018 00:32:29'!
validCreditCard


	^CreditCard createCartWithExpiredDate: FixedGregorianDate theEndOfTime.

! !


!classDefinition: #Cart category: #TusLibros!
Object subclass: #Cart
	instanceVariableNames: 'catalog items'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidItemErrorMessage
	
	^'Item is not in catalog'! !

!Cart methodsFor: 'error messages' stamp: 'HernanWilkinson 6/17/2013 17:45'!
invalidQuantityErrorMessage
	
	^'Invalid number of items'! !


!Cart methodsFor: 'assertions' stamp: 'JL 6/9/2018 19:15:32'!
assertIsValidItem: anItem

	(catalog keys includes: anItem) ifFalse: [ self error: self invalidItemErrorMessage ]! !

!Cart methodsFor: 'assertions' stamp: 'HernanWilkinson 6/17/2013 17:51'!
assertIsValidQuantity: aQuantity

	aQuantity strictlyPositive ifFalse: [ self error: self invalidQuantityErrorMessage ]! !


!Cart methodsFor: 'initialization' stamp: 'HernanWilkinson 6/17/2013 17:48'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog.
	items := OrderedCollection new.! !


!Cart methodsFor: 'queries' stamp: 'HernanWilkinson 6/17/2013 17:45'!
occurrencesOf: anItem

	^items occurrencesOf: anItem  ! !


!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
includes: anItem

	^items includes: anItem ! !

!Cart methodsFor: 'testing' stamp: 'HernanWilkinson 6/17/2013 17:44'!
isEmpty
	
	^items isEmpty ! !


!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:44'!
add: anItem

	^ self add: 1 of: anItem ! !

!Cart methodsFor: 'adding' stamp: 'HernanWilkinson 6/17/2013 17:51'!
add: aQuantity of: anItem

	self assertIsValidQuantity: aQuantity.
	self assertIsValidItem: anItem.

	1 to: aQuantity do: [ :aNumber | items add: anItem ]! !


!Cart methodsFor: 'evaluating' stamp: 'JL 6/9/2018 19:15:55'!
pricesOfItems
	
	
	^items inject: 0 into: [:partialSum :anItem | partialSum + (catalog at: anItem)] ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cart class' category: #TusLibros!
Cart class
	instanceVariableNames: ''!

!Cart class methodsFor: 'instance creation' stamp: 'HernanWilkinson 6/17/2013 17:48'!
acceptingItemsOf: aCatalog

	^self new initializeAcceptingItemsOf: aCatalog ! !


!classDefinition: #Cashier category: #TusLibros!
Object subclass: #Cashier
	instanceVariableNames: 'catalog'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!Cashier methodsFor: 'evaluating' stamp: 'JL 6/10/2018 22:16:16'!
checkout: aCart withCreditCard: aCreditCard
	aCart isEmpty ifTrue: [self error: self invalidCartCheckoutErrorMessage].
	aCreditCard isExpired ifTrue: [self error: self creditCardExpiredErrorMessage].
	self debitTotalAmount: aCart pricesOfItems from: aCreditCard.
	^aCart pricesOfItems! !

!Cashier methodsFor: 'evaluating' stamp: 'JL 6/10/2018 22:16:35'!
debitTotalAmount: aSimpleMeasure from: aCreditCard 
	! !


!Cashier methodsFor: 'error message' stamp: 'JL 6/10/2018 13:03:26'!
creditCardExpiredErrorMessage
	^'Credit card is expired'! !

!Cashier methodsFor: 'error message' stamp: 'JL 6/9/2018 19:17:11'!
initializeAcceptingItemsOf: aCatalog

	catalog := aCatalog .! !

!Cashier methodsFor: 'error message' stamp: 'JL 6/9/2018 19:02:38'!
invalidCartCheckoutErrorMessage
	^'Cart is empty'! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Cashier class' category: #TusLibros!
Cashier class
	instanceVariableNames: ''!

!Cashier class methodsFor: 'as yet unclassified' stamp: 'JL 6/9/2018 19:18:25'!
initializeAcceptingItemsOf: aCatalog


	^self new initializeAcceptingItemsOf: aCatalog.! !


!classDefinition: #CreditCard category: #TusLibros!
Object subclass: #CreditCard
	instanceVariableNames: 'expiredDate'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TusLibros'!

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JL 6/10/2018 21:35:17'!
createCartWithExpiredDate: aMonthOfYearDate

	expiredDate := aMonthOfYearDate.! !

!CreditCard methodsFor: 'as yet unclassified' stamp: 'JL 6/10/2018 22:06:29'!
isExpired

	^expiredDate < (FixedGregorianDate today)! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CreditCard class' category: #TusLibros!
CreditCard class
	instanceVariableNames: ''!

!CreditCard class methodsFor: 'as yet unclassified' stamp: 'JL 6/10/2018 21:34:49'!
createCartWithExpiredDate: aMonthOfYearDate


	^self new createCartWithExpiredDate: aMonthOfYearDate! !
