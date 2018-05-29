!classDefinition: #TicTacToeTest category: #TicTacToStep21!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:06:27'!
test01ACreateATicTacToeAndStateStartInXTurn
	| game |
	game _ TicTacToe new.
	self assert: game state class equals: XTurn! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 19:18:52'!
test01CreateATicTacToeAndStartedEmpty
	| game |
	game _ TicTacToe new.
	self assert: game Xs isEmpty.
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:22'!
test02APutAnXAndTurnBecomeOTurnIfNoOneWinOrIsTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: game state class
		equals: OTurn.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:22'!
test02PutAnXAndTheGameShouldIncludeIt
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self assert: game Os isEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:49:14'!
test03APutAnOAndTurnBecomeXTurnIfNoOneWinOrIsTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self assert: game state class equals: XTurn! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test03PutAnXAndAnOAndTheGameShouldIncludeIt
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: 1
		equals: game Xs size.
	self assert: (game Xs includes: 1 @ 1).
	self
		assert: 1
		equals: game Os size.
	self assert: (game Os includes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:22'!
test04AXPlayerCannotPlayTwiceInARow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test05AnOPlayerCannotPlayTwiceInARow
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe notXTurnErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test06XPlayerCannotPutAXInTheSamePlaceTwice
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test07XPlayerCannotPutXInTheSamePlaceWhereAnOHasBeenPutted
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test08OPlayerCannotPutAnOWhereAXHasBeenPutted
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 1
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: game Os isEmpty ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test09OPlayerCannotPutAnOInTheSamePlaceTwice
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 3 @ 3.
	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe positionTakenErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Xs size.
			self assert: (game Xs includes: 1 @ 1).
			self assert: (game Xs includes: 3 @ 3).
			self
				assert: 1
				equals: game Os size.
			self assert: (game Os includes: 2 @ 2) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test10ifNoOneHasWonNoOneWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test11XPlayerWinByPuttedThreeXsInTheFirstRowAndOPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test12XPlayerWinByPuttedThreeXsInTheSecondRowAndOPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test13XPlayerWinByPuttedThreeXsInTheThirdRowAndOPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test14XPlayerWinByPuttedThreeXsInTheFirstColumnAndOPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 3 @ 3.
	game markWithXAt: 3 @ 1.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test15XPlayerWinByPuttedThreeXsInTheLeftRightDiagonalAndOPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test16XPlayerWinByPuttedThreeXsInTheRightLeftDiagonalAndOPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 3.
	self assert: game XHasWon.
	self deny: game OHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test17OPlayerWinByPuttedThreeOsInTheFirstRowAndXPlayerLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 1 @ 3.
	self assert: game OHasWon.
	self deny: game XHasWon.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test18OPlayerCannotPlayIfXWin
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 1 @ 3.
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 2
				equals: game Os size.
			self assert: (game Os includes: 2 @ 1).
			self assert: (game Os includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test19XPlayerCannotPlayIfOWin
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 3.
	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage
				equals: anError messageText.
			self
				assert: 3
				equals: game Xs size.
			self assert: (game Xs includes: 2 @ 2).
			self assert: (game Xs includes: 2 @ 1).
			self assert: (game Xs includes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test20IfNoOneWinAndTheGameIsFullThenTheGameIsTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 1 @ 2.
	game markWithOAt: 3 @ 2.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self deny: game XHasWon.
	self deny: game OHasWon.
	self assert: game isTied.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/28/2018 21:34:50'!
test21IfTheGameIsFullButXPlayerPutThreeXInLeftRightDiagonalThenXWinAndOLost
	| game |
	game _ TicTacToe new.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 3 @ 3.
	self assert: game isOver.
	self assert: game XHasWon.
	self deny: game OHasWon.
	self deny: game isTied.! !


!classDefinition: #GameState category: #TicTacToStep21!
Object subclass: #GameState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!


!GameState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:11:36'!
putOAt: aPosition forGame: aTicTacToeGame

	self subclassResponsibility! !

!GameState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:11:37'!
putXAt: aPosition forGame: aTicTacToeGame

	self subclassResponsibility! !


!classDefinition: #Turn category: #TicTacToStep21!
GameState subclass: #Turn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!


!Turn methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 10:52:22'!
putOAt: aPosition forGame: aTicTacToeGame

	self subclassResponsibility
! !

!Turn methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 10:52:37'!
putXAt: aPosition forGame: aTicTacToeGame

	self subclassResponsibility! !


!classDefinition: #OTurn category: #TicTacToStep21!
Turn subclass: #OTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!OTurn methodsFor: 'nil' stamp: 'NL 6/1/2018 07:15:35'!
putXAt: aPosition forGame: aTicTacToeGame

	^ self error: aTicTacToeGame class notXTurnErrorMessage! !


!OTurn methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 10:55:43'!
putOAt: aPosition forGame: aTicTacToeGame

	aTicTacToeGame putOAtPosition: aPosition.! !


!classDefinition: #XTurn category: #TicTacToStep21!
Turn subclass: #XTurn
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!XTurn methodsFor: 'evaluating' stamp: 'NL 6/1/2018 07:15:23'!
putOAt: aPosition forGame: aTicTacToeGame

	^ self error: aTicTacToeGame class notXTurnErrorMessage! !

!XTurn methodsFor: 'evaluating' stamp: 'NL 5/29/2018 10:56:05'!
putXAt: aPosition forGame: aTicTacToeGame
	aTicTacToeGame putXAtPosition: aPosition.! !


!classDefinition: #Win category: #TicTacToStep21!
GameState subclass: #Win
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!Win methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 11:48:13'!
putOAt: aPosition forGame: aTicTacToeGame

	self error: aTicTacToeGame class canNotPlayWhenGameIsOverErrorMessage ! !

!Win methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 11:48:18'!
putXAt: aPosition forGame: aTicTacToeGame

	self error: aTicTacToeGame class canNotPlayWhenGameIsOverErrorMessage ! !


!classDefinition: #TicTacToe category: #TicTacToStep21!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToStep21'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:02:58'!
OHasWon
	
	^ self hasWin: os! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:03:09'!
XHasWon
	
	^ self hasWin: xs! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 11:54:15'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]
! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:07:59'!
isPositionTaken: aPosition

	^ (xs includes: aPosition) or: [ os includes: aPosition ].
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:06:57'!
isTied
	
	^ xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]]  and: [ self OHasWon not ]! !


!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/28/2018 21:03:49'!
state
	^state! !


!TicTacToe methodsFor: 'plays' stamp: 'NL 5/29/2018 12:05:31'!
markWithOAt: aPosition
	
	state putOAt: aPosition forGame: self.
	(self OHasWon) ifTrue: [ ^ state:= Win new ].
	state := XTurn new.! !

!TicTacToe methodsFor: 'plays' stamp: 'NL 5/29/2018 12:05:52'!
markWithXAt: aPosition

	state putXAt: aPosition forGame: self.
	(self XHasWon) ifTrue: [ ^ state:= Win new ].
	state := OTurn new.
	
	

	! !

!TicTacToe methodsFor: 'plays' stamp: 'NL 6/1/2018 07:33:28'!
putOAtPosition: aPosition
	(self isPositionTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	os add: aPosition.! !

!TicTacToe methodsFor: 'plays' stamp: 'NL 6/1/2018 07:33:54'!
putXAtPosition: aPosition
	(self isPositionTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	xs add: aPosition.! !


!TicTacToe methodsFor: 'initialization' stamp: 'NL 5/29/2018 11:59:04'!
initialize
	
	xs:= Set new.
	os:= Set new.
	state := XTurn new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToStep21!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !
