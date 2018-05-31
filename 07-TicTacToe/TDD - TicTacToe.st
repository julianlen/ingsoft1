!classDefinition: #TicTacToeTest category: #'TDD - TicTacToe'!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TicTacToe'!

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:12:18'!
test01ACreateATicTacToeAndStateStartInXTurn
	| game |
	game _ TicTacToe new.
	self assert: game isXTurn! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:32:14'!
test01CreateATicTacToeAndStartedEmpty
	| game |
	game _ TicTacToe new.
	self assert: game XsPositionsAreEmpty.
	self assert: game OsPositionsAreEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:14:36'!
test02APutAnXAndTurnBecomeOTurnIfNoOneWinOrIsTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: game isOTurn.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:41:59'!
test02PutAnXAndTheGameShouldIncludeIt
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	self
		assert: 1
		equals: game XsPositionsSize.
	self assert: (game XsPositionsIncludes: 1 @ 1).
	self assert: game OsPositionsAreEmpty.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:35:33'!
test03APutAnOAndTurnBecomeXTurnIfNoOneWinOrIsTied
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self assert: game isXTurn! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:43:37'!
test03PutAnXAndAnOAndTheGameShouldIncludeIt
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 2.
	self
		assert: 1
		equals: game XsPositionsSize.
	self assert: (game XsPositionsIncludes: 1 @ 1).
	self
		assert: 1
		equals: game OsPositionsSize.
	self assert: (game OsPositionsIncludes: 2 @ 2).! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:42:35'!
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
				equals: game XsPositionsSize.
			self assert: (game XsPositionsIncludes: 1 @ 1).
			self assert: game OsPositionsAreEmpty .
			self assert: game isOTurn
			]
		.! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:43:51'!
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
				equals: game XsPositionsSize.
			self assert: (game XsPositionsIncludes: 1 @ 1).
			self
				assert: 1
				equals: game OsPositionsSize.
			self assert: (game OsPositionsIncludes: 2 @ 2). 
			self assert: game isXTurn
			].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:43:59'!
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
				equals: game XsPositionsSize.
			self assert: (game XsPositionsIncludes: 1 @ 1).
			self
				assert: 1
				equals: game OsPositionsSize.
			self assert: (game OsPositionsIncludes: 2 @ 2). 
			self assert: game isXTurn
			].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:44:06'!
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
				equals: game XsPositionsSize.
			self assert: (game XsPositionsIncludes: 1 @ 1).
			self
				assert: 1
				equals: game OsPositionsSize.
			self assert: (game OsPositionsIncludes: 2 @ 2).
			self assert: game isXTurn.
			 ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:43:11'!
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
				equals: game XsPositionsSize.
			self assert: (game XsPositionsIncludes: 1 @ 1).
			self assert: game OsPositionsAreEmpty.
			self assert: game isOTurn
			 ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:44:18'!
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
				equals: game XsPositionsSize.
			self assert: (game XsPositionsIncludes: 1 @ 1).
			self assert: (game XsPositionsIncludes: 3 @ 3).
			self
				assert: 1
				equals: game OsPositionsSize.
			self assert: (game OsPositionsIncludes: 2 @ 2).
			self assert: game isOTurn
			 ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:05:33'!
test10ifNoOneHasWonNoOneWon
	| game |
	game _ TicTacToe new.
	game markWithXAt: 1 @ 1.
	game markWithOAt: 2 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 3.
	self deny: game OHasWon.
	self deny: game XHasWon.
! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:08:44'!
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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:08:40'!
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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:40:26'!
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
			self assert: (game OsPositionsIncludes: 2 @ 1).
			self assert: (game OsPositionsIncludes: 3 @ 1) ].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:40:52'!
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
			self assert: (game XsPositionsIncludes: 2 @ 2).
			self assert: (game XsPositionsIncludes: 2 @ 1).
			self assert: (game XsPositionsIncludes: 3 @ 1) ].! !

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

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 22:31:27'!
test22XPlayerCannotPutAnXOnIncorrectPositionGreaterThan3
	| game |
	game _ TicTacToe new.
	self
		should: [ game markWithXAt: 4 @ 4.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe incorrectPositionErrorMessage
				equals: anError messageText.
			self assert: game XsPositionsAreEmpty.
			self assert: game isXTurn
			].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 22:31:36'!
test23OPlayerCannotPutAnOonIncorrectPositionGreaterThan3
	| game |
	game _ TicTacToe new.
	game markWithXAt: 3 @ 3.

	self
		should: [ game markWithOAt: 4 @ 4.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe incorrectPositionErrorMessage
				equals: anError messageText.
			self assert: game OsPositionsAreEmpty.
			self assert: game isOTurn
			].! !

!TicTacToeTest methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 22:31:58'!
test24XPlayerCannotPutAnXOnIncorrectPositionLesserThan1
	| game |
	game _ TicTacToe new.
	self
		should: [ game markWithXAt: 0 @ 0.]
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self
				assert: TicTacToe incorrectPositionErrorMessage
				equals: anError messageText.
			self assert: game XsPositionsAreEmpty.
			self assert: game isXTurn
			].! !


!classDefinition: #GameState category: #'TDD - TicTacToe'!
Object subclass: #GameState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TicTacToe'!

!GameState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:11:36'!
putOAt: aPosition forGame: aTicTacToeGame

	self subclassResponsibility! !

!GameState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:11:37'!
putXAt: aPosition forGame: aTicTacToeGame

	self subclassResponsibility! !


!classDefinition: #OTurnState category: #'TDD - TicTacToe'!
GameState subclass: #OTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TicTacToe'!

!OTurnState methodsFor: 'nil' stamp: 'NL 6/1/2018 07:15:35'!
putXAt: aPosition forGame: aTicTacToeGame

	^ self error: aTicTacToeGame class notXTurnErrorMessage! !


!OTurnState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 10:55:43'!
putOAt: aPosition forGame: aTicTacToeGame

	aTicTacToeGame putOAtPosition: aPosition.! !


!classDefinition: #WinnerState category: #'TDD - TicTacToe'!
GameState subclass: #WinnerState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TicTacToe'!

!WinnerState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 11:48:13'!
putOAt: aPosition forGame: aTicTacToeGame

	self error: aTicTacToeGame class canNotPlayWhenGameIsOverErrorMessage ! !

!WinnerState methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 11:48:18'!
putXAt: aPosition forGame: aTicTacToeGame

	self error: aTicTacToeGame class canNotPlayWhenGameIsOverErrorMessage ! !


!classDefinition: #XTurnState category: #'TDD - TicTacToe'!
GameState subclass: #XTurnState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TicTacToe'!

!XTurnState methodsFor: 'evaluating' stamp: 'NL 6/1/2018 07:15:23'!
putOAt: aPosition forGame: aTicTacToeGame

	^ self error: aTicTacToeGame class notXTurnErrorMessage! !

!XTurnState methodsFor: 'evaluating' stamp: 'NL 5/29/2018 10:56:05'!
putXAt: aPosition forGame: aTicTacToeGame
	aTicTacToeGame putXAtPosition: aPosition.! !


!classDefinition: #TicTacToe category: #'TDD - TicTacToe'!
Object subclass: #TicTacToe
	instanceVariableNames: 'os xs turn winner state'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TDD - TicTacToe'!

!TicTacToe methodsFor: 'inspecting' stamp: 'NL 5/29/2018 12:02:58'!
OHasWon
	
	^ self hasWin: os! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 20:14:14'!
OsPositionsAreEmpty

	^self Os isEmpty! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 20:35:15'!
OsPositionsIncludes: aPosition

	^self Os includes: aPosition! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 20:44:30'!
OsPositionsSize

	^self Os size! !

!TicTacToe methodsFor: 'inspecting' stamp: 'NL 5/29/2018 12:03:09'!
XHasWon
	
	^ self hasWin: xs! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 20:14:02'!
XsPositionsAreEmpty

	^self Xs isEmpty! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 20:34:52'!
XsPositionsIncludes: aPosition

	^self Xs includes: aPosition! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 20:44:33'!
XsPositionsSize

	^self Xs size! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 12:51:23'!
hasCompletedColumn: positions
	
	^ (1 to: 3) anySatisfy: [ :y | (positions count: [ :position | position y = y ]) = 3 ]! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 12:56:21'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]
! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 13:02:13'!
hasUpDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 13:01:53'!
hasWin: positions

	^(self hasCompletedRow: positions)
		or: [(self hasCompletedColumn: positions) 
				or: [(self hasDownDiagonal: positions)
					or: [(self hasUpDiagonal: positions)]]]


! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 22:34:50'!
isIncorrectPosition: aPosition
	|greaterThan3 lesserThan1|
	
	greaterThan3 := aPosition x > 3 or: [aPosition y > 3].
	lesserThan1 := aPosition x < 1 or: [aPosition y < 1].
	
	^ greaterThan3 or: [lesserThan1]
	! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 23:12:06'!
isOTurn
	^ self state class = OTurnState.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'NL 5/29/2018 11:54:15'!
isOver
	
	^self XHasWon or: [ self OHasWon or: [ self isTied ]]
! !

!TicTacToe methodsFor: 'inspecting' stamp: 'NL 5/29/2018 12:07:59'!
isPositionTaken: aPosition

	^ (xs includes: aPosition) or: [ os includes: aPosition ].
	! !

!TicTacToe methodsFor: 'inspecting' stamp: 'NL 5/29/2018 12:06:57'!
isTied
	
	^ xs size = 5 and: [ os size = 4 and: [ self XHasWon not ]]  and: [ self OHasWon not ]! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/30/2018 23:11:57'!
isXTurn
	^ self state class = XTurnState.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/28/2018 21:03:49'!
state
	^state! !


!TicTacToe methodsFor: 'plays' stamp: 'JL 5/30/2018 23:11:57'!
markWithOAt: aPosition
	state
		putOAt: aPosition
		forGame: self.
	self OHasWon ifTrue: [ ^ state _ WinnerState new ].
	state _ XTurnState new.! !

!TicTacToe methodsFor: 'plays' stamp: 'JL 5/30/2018 23:12:06'!
markWithXAt: aPosition
	state
		putXAt: aPosition
		forGame: self.
	self XHasWon ifTrue: [ ^ state _ WinnerState new ].
	state _ OTurnState new.! !

!TicTacToe methodsFor: 'plays' stamp: 'JL 5/30/2018 20:56:39'!
putOAtPosition: aPosition
	(self isPositionTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(self isIncorrectPosition: aPosition) ifTrue: [ self error: self class incorrectPositionErrorMessage ].
	os add: aPosition.! !

!TicTacToe methodsFor: 'plays' stamp: 'JL 5/30/2018 22:29:34'!
putXAtPosition: aPosition
	(self isPositionTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	(self isIncorrectPosition: aPosition) ifTrue: [ self error: self class incorrectPositionErrorMessage ].
	xs add: aPosition.! !


!TicTacToe methodsFor: 'initialization' stamp: 'JL 5/30/2018 23:11:57'!
initialize
	xs _ Set new.
	os _ Set new.
	state _ XTurnState new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #'TDD - TicTacToe'!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 13:15:31'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'JL 5/30/2018 20:55:31'!
incorrectPositionErrorMessage
	
	^'Incorrect position'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 10:26:38'!
notXTurnErrorMessage

	^'Not X turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 11:20:12'!
positionTakenErrorMessage
	
	^'Position taken'! !
