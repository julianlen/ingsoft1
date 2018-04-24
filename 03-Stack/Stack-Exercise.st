!classDefinition: #OOStackTest category: #'Stack-Exercise'!
TestCase subclass: #OOStackTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test01StackShouldBeEmptyWhenCreated

	| stack |
	
	stack := OOStack new.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:30'!
test02PushAddElementsToTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	
	self deny: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:31'!
test03PopRemovesElementsFromTheStack

	| stack |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self assert: stack isEmpty! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/8/2012 08:20'!
test04PopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	stack push: pushedObject.
	
	self assert: stack pop = pushedObject! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:33'!
test05StackBehavesLIFO

	| stack firstPushedObject secondPushedObject |
	
	stack := OOStack new.
	firstPushedObject := 'First'.
	secondPushedObject := 'Second'.
	
	stack push: firstPushedObject.
	stack push: secondPushedObject.
	
	self assert: stack pop = secondPushedObject.
	self assert: stack pop = firstPushedObject.
	self assert: stack isEmpty 
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:35'!
test06TopReturnsLastPushedObject

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack top = pushedObject.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HernanWilkinson 5/7/2012 11:36'!
test07TopDoesNotRemoveObjectFromStack

	| stack pushedObject |
	
	stack := OOStack new.
	pushedObject := 'Something'.
	
	stack push: pushedObject.
	
	self assert: stack size = 1.
	stack top.
	self assert: stack size = 1.
	! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:26'!
test08CanNotPopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:36'!
test09CanNotPopWhenThereAreNoObjectsInTheStackAndTheStackHadObjects

	| stack  |
	
	stack := OOStack new.
	stack push: 'Something'.
	stack pop.
	
	self
		should: [ stack pop ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !

!OOStackTest methodsFor: 'test' stamp: 'HAW 4/14/2017 22:48:44'!
test10CanNotTopWhenThereAreNoObjectsInTheStack

	| stack  |
	
	stack := OOStack new.
	self
		should: [ stack top ]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anError |
			self assert: anError messageText = OOStack stackEmptyErrorDescription ]
		
! !


!classDefinition: #OOStack category: #'Stack-Exercise'!
Object subclass: #OOStack
	instanceVariableNames: 'firstElement size'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStack methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 21:47:08'!
initialize

	firstElement := OOStackBase new.
	size := 0! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 21:46:06'!
isEmpty

	^(size = 0)! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:16:40'!
pop
	| anElementValue |
	
	size := size - 1.
	anElementValue := firstElement value.
	firstElement := firstElement previous.
	^ anElementValue! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:14:34'!
push: anElement

	size := size + 1.
	firstElement := (OOStackNotNullElement new) withElement: anElement withPrevious: firstElement.
	
	! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 21:44:59'!
size
	
	 ^size! !

!OOStack methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 21:45:10'!
top

	^ firstElement value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStack class' category: #'Stack-Exercise'!
OOStack class
	instanceVariableNames: ''!

!OOStack class methodsFor: 'error descriptions' stamp: 'HernanWilkinson 5/7/2012 11:51'!
stackEmptyErrorDescription
	
	^ 'Stack is empty'! !


!classDefinition: #OOStackElement category: #'Stack-Exercise'!
Object subclass: #OOStackElement
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackElement methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:38:33'!
value

	self subclassResponsibility! !


!classDefinition: #OOStackBase category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackBase
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackBase methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:37:03'!
value

	^self error: OOStack stackEmptyErrorDescription.! !


!classDefinition: #OOStackNotNullElement category: #'Stack-Exercise'!
OOStackElement subclass: #OOStackNotNullElement
	instanceVariableNames: 'value previous'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Stack-Exercise'!

!OOStackNotNullElement methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:01:36'!
previous
	
	^previous! !

!OOStackNotNullElement methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:34:24'!
value
	
	^value! !

!OOStackNotNullElement methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 23:37:22'!
withElement: anElement withPrevious: anotherElement

	value := anElement.
	previous := anotherElement! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'OOStackNotNullElement class' category: #'Stack-Exercise'!
OOStackNotNullElement class
	instanceVariableNames: ''!

!OOStackNotNullElement class methodsFor: 'as yet unclassified' stamp: 'JL 4/23/2018 20:30:00'!
withValue: anElement previous: aStackElement
	
	| aNewStackNotNullElement |
	
	aNewStackNotNullElement := OOStackNotNullElement new.
	
	aNewStackNotNullElement value: anElement.
	aNewStackNotNullElement previous: aStackElement.
	
	^ aNewStackNotNullElement! !
