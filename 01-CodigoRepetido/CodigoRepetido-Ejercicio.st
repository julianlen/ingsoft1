!classDefinition: #NotFound category: #'CodigoRepetido-Ejercicio'!
Error subclass: #NotFound
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!


!classDefinition: #IdiomTest category: #'CodigoRepetido-Ejercicio'!
TestCase subclass: #IdiomTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 21:32:08'!
evaluateTheClosure: aClosure andThrowTheErrorClass: anError do: anAssert

	[ aClosure value. self fail ] on: anError do: anAssert! !

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 20:42:28'!
executionTimeOf: aClosure doesntTakeMoreMillisecondsThan: aTime

	|executionTime|
	
		executionTime := self measureExecutionTimeOf: aClosure.
		^ executionTime < aTime! !

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 20:29:24'!
measureExecutionTimeOf: aClosure

	| millisecondsBeforeRunning millisecondsAfterRunning |
	
	millisecondsBeforeRunning := Time millisecondClockValue.
	aClosure value.
	millisecondsAfterRunning := Time millisecondClockValue.
	
	^ millisecondsAfterRunning - millisecondsBeforeRunning! !

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 20:43:12'!
test01AddingCustomerShouldNotTakeMoreThan50Milliseconds

	| customerBook |
	
	customerBook := CustomerBook  new.
		
	self assert: (self executionTimeOf: [ customerBook addCustomerNamed: 'John Lennon' ] doesntTakeMoreMillisecondsThan: 50)
! !

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 20:47:47'!
test02RemovingCustomerShouldNotTakeMoreThan100Milliseconds

	| customerBook paulMcCartney|
	
	customerBook := CustomerBook  new.
	paulMcCartney := 'Paul McCartney'.
	customerBook addCustomerNamed: paulMcCartney.
		
	self assert: (self executionTimeOf: [ customerBook removeCustomerNamed: paulMcCartney ] doesntTakeMoreMillisecondsThan: 100)

	

	

! !

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 21:31:57'!
test03CanNotAddACustomerWithEmptyName 

	| customerBook |
			
	customerBook := CustomerBook new.

	self evaluateTheClosure:  [ customerBook addCustomerNamed: '' ]
		  andThrowTheErrorClass: Error  
		  do:  [ :anError | 
					self assert: anError messageText = CustomerBook customerCanNotBeEmptyErrorMessage.
					self assert: customerBook isEmpty ].
! !

!IdiomTest methodsFor: 'testing' stamp: 'JL 4/12/2018 21:31:42'!
test04CanNotRemoveAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	
	self evaluateTheClosure: [ customerBook removeCustomerNamed: 'Paul McCartney' ] 
		  andThrowTheErrorClass: NotFound 
		  do: [ self assert: customerBook numberOfCustomers = 1.
				self assert: (customerBook includesCustomerNamed: johnLennon) ]! !


!classDefinition: #CustomerBook category: #'CodigoRepetido-Ejercicio'!
Object subclass: #CustomerBook
	instanceVariableNames: 'customers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'CodigoRepetido-Ejercicio'!

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:56'!
includesCustomerNamed: aName

	^customers includes: aName ! !

!CustomerBook methodsFor: 'testing' stamp: 'HernanWilkinson 7/6/2011 17:48'!
isEmpty
	
	^customers isEmpty  ! !


!CustomerBook methodsFor: 'initialization' stamp: 'HernanWilkinson 7/6/2011 17:42'!
initialize

	super initialize.
	customers := OrderedCollection new! !


!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:42'!
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	(customers includes: aName) ifTrue: [ self signalCustomerAlreadyExists ].
	
	customers add: aName ! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:56'!
numberOfCustomers
	
	^customers size! !

!CustomerBook methodsFor: 'customer management' stamp: 'HAW 4/14/2017 16:55:43'!
removeCustomerNamed: aName
 
	customers remove: aName ifAbsent: [ NotFound signal ]! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:52'!
signalCustomerAlreadyExists 

	self error: self class customerAlreadyExistsErrorMessage! !

!CustomerBook methodsFor: 'customer management' stamp: 'HernanWilkinson 7/6/2011 17:51'!
signalCustomerNameCannotBeEmpty 

	self error: self class customerCanNotBeEmptyErrorMessage ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'CustomerBook class' category: #'CodigoRepetido-Ejercicio'!
CustomerBook class
	instanceVariableNames: ''!

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:57'!
customerAlreadyExistsErrorMessage

	^'Customer already exists'! !

!CustomerBook class methodsFor: 'error messages' stamp: 'HernanWilkinson 7/6/2011 17:53'!
customerCanNotBeEmptyErrorMessage

	^'Customer name cannot be empty'! !
