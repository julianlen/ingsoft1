!classDefinition: #TicTacToeConsoleTest category: #TicTacToe!
TestCase subclass: #TicTacToeConsoleTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:13:10'!
test00ConsoleInitializesEmpty
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	self assert: console log isEmpty.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:10:31'!
test01ConsoleLogsPlayerXMove
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	game markWithXAt: 2 @ 2.
	self
		assert: 'X marcó en 2@2'
		equals: console log first.
	self
		assert: 'Estado: Jugando O'
		equals: console log second.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:10:52'!
test02ConsoleLogsPlayerOMove
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	self
		assert: 'O marcó en 1@1'
		equals: (console log at: console log size - 1).
	self
		assert: 'Estado: Jugando X'
		equals: console log last.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:11:46'!
test03ConsoleLogsLastPlay
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	self
		assert: 'X marcó en 1@3'
		equals: (console log at: console log size - 1).
	self
		assert: 'Estado: Jugando O'
		equals: console log last.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:12:16'!
test04ConsoleLogsPlayerXWinner
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	self
		assert: 'X marcó en 3@1'
		equals: (console log at: console log size - 1).
	self
		assert: 'Estado: Juego terminado - Ganó X!!'
		equals: console log last.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:12:37'!
test05ConsoleLogsPlayerOWinner
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 3.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 3 @ 1.
	game markWithOAt: 1 @ 3.
	self
		assert: 'O marcó en 1@3'
		equals: (console log at: console log size - 1).
	self
		assert: 'Estado: Juego terminado - Ganó O!!'
		equals: console log last.! !

!TicTacToeConsoleTest methodsFor: 'as yet unclassified' stamp: 'Nacho 5/31/2018 21:12:57'!
test06ConsoleLogsATieGame
	| game console |
	game _ TicTacToe new.
	console _ TicTacToeConsole new initializeWith: game.
	game markWithXAt: 1 @ 3.
	game markWithOAt: 1 @ 2.
	game markWithXAt: 2 @ 1.
	game markWithOAt: 1 @ 1.
	game markWithXAt: 2 @ 2.
	game markWithOAt: 3 @ 1.
	game markWithXAt: 3 @ 3.
	game markWithOAt: 2 @ 3.
	game markWithXAt: 3 @ 2.
	self
		assert: 'X marcó en 3@2'
		equals: (console log at: console log size - 1).
	self
		assert: 'Estado: Juego empatado!!'
		equals: console log last.! !


!classDefinition: #TicTacToeTest category: #TicTacToe!
TestCase subclass: #TicTacToeTest
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

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


!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/27/2017 17:25:54'!
functionalException

	^Error - MessageNotUnderstood! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 10/26/2017 15:10:54'!
test01GameStartsWithAnEmptyBoarAndPlayingX

	"I initialize it on each test and not in the setUp to facilitate the restar of the test - Hernan"
	
	game _ TicTacToe new.

	self assertXIsMarkedOn: {} andOOn: {}.
	self assertIsPlayingX.
	
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:35'!
test02AfterMarkingWithXGameKeepsMarkAndNextPlayerIsO

	game _ TicTacToe new.
	
	game markAll: {1@1}.

	self assertXIsMarkedOn: {1@1} andOOn: {}.
	self assertIsPlayingO

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:31'!
test03AfterMarkingWithOGameKeepsMarkAndNextPlayerIsY

	game _ TicTacToe new.

	game markAll: { 1 @ 1. 2 @ 2 }.

	self assertXIsMarkedOn: {1@1} andOOn: {2@2}.
	self assertIsPlayingX.

! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:28'!
test04CanNotMarkWithXWhenLastMarkWasX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException
		withExceptionDo: [ :anError |
			self assert: TicTacToe notXTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:23'!
test05CanNotMarkWithOWhenLastMarkWasO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithOAt: 3 @ 3 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe notOTurnErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:19'!
test06CanNotMarkWithXAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:16'!
test07CanNotMarkWithXAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2 }.

	self
		should: [ game markWithXAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:12'!
test08CanNotMarkWithOAnAlreadyMarkedPositionWithX

	game _ TicTacToe new.
	
	game markAll: { 1@1 }.
	
	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:08'!
test09CanNotMarkWithOAnAlreadyMarkedPositionWithO

	game _ TicTacToe new.

	game markAll: {1@1. 2@2. 3@3 }.

	self
		should: [ game markWithOAt: 2 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionTakenErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {1@1. 3@3} andOOn: {2@2} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:43:04'!
test10XWinsWhenCompletesRowNumber1

	game _ TicTacToe new.

	game markAll: {1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self assertXWon.
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:59'!
test11XWinsWhenCompletesRowNumber2

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 3@1. 2@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:54'!
test12XWinsWhenCompletesRowNumber3

	game _ TicTacToe new.

	game markAll: {3@1. 1@1. 3@2. 2@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:50'!
test13XWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 1@1. 2@2. 1@2. 3@3. 1@3}.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:45'!
test14XWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 1@1. 1@2. 2@2. 1@3. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:41'!
test15XWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: { 1@3. 1@2. 2@2. 2@1. 3@ 1 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:35'!
test16OWinsWhenCompletesARow

	game _ TicTacToe new.

	game markAll: {2@1. 1@1. 2@2. 1@2. 3@1. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:31'!
test17OWinsWhenCompletesAColumn

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 3@3. 1@2. 2@3. 1@3 }.

	self assertOWon! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:25'!
test18OWinsWhenCompletesDiagonalGoingDown

	game _ TicTacToe new.

	game markAll: { 3@2. 1@3. 1@2. 2@2. 1@1. 3@1 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:20'!
test19OWinsWhenCompletesDiagonalGoingUp

	game _ TicTacToe new.

	game markAll: {1@2. 1@1. 1@3. 2@2. 2@1. 3@3 }.

	self assertOWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:15'!
test20OCanNotPlayWhenXWon

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markWithOAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:12'!
test21XCanNotPlayWhenOWon

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 2@1. 1@2. 3@1. 1@3 }.

	self
		should: [ game markWithXAt: 3 @ 2 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: { 2@2. 2@1. 3@1 } ]
		! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:08'!
test22GameCanEndUpTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self assertGameIsTied! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:42:01'!
test23XCanWinOnLastEmptyPosition

	game _ TicTacToe new.

	game markAll: { 2@2. 1@2. 1@1. 2@1. 1@3. 2@3. 3@2. 3@1. 3@3 }.

	self assertXWon ! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:41:58'!
test24CanNotPlayWhenGameIsTied

	game _ TicTacToe new.

	game markAll: { 2@2. 1@1. 1@3. 3@1. 2@1. 2@3. 1@2. 3@2. 3@3 }.

	self
		should: [ game markWithOAt: 1 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText ].! !

!TicTacToeTest methodsFor: 'testing' stamp: 'JG 5/12/2018 13:23:11'!
test25CanNotMarkOutsideBoard

	game _ TicTacToe new.

	#(0 4) do: [ :aPositionComponent |
		self assertCanNotMarkAt: aPositionComponent @ 1.
		self assertCanNotMarkAt: 1 @ aPositionComponent ].
	! !

!TicTacToeTest methodsFor: 'testing' stamp: 'HAW 5/31/2018 18:49:43'!
test26OCanNotMarkWhenGameIsOver

	game _ TicTacToe new.

	game markAll: { 1@1. 2@1. 1@2. 3@1. 1@3 }.
	
	self
		should: [ game markAt: 3 @ 1 ]
		raise: self functionalException 
		withExceptionDo: [ :anError |
			self assert: TicTacToe canNotPlayWhenGameIsOverErrorMessage equals: anError messageText.
			self assertOIsMarkedOn: {2@1. 3@1} ].! !


!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:06'!
assertCanNotMarkAt: aPosition

	self assertCanNotMarkUsing: [ game markWithXAt: aPosition ].
	self assertCanNotMarkUsing: [ game markWithOAt: aPosition ].
	
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/27/2017 10:29:29'!
assertCanNotMarkUsing: aMarkingClosure

	self
		should: aMarkingClosure 
		raise: Error - MessageNotUnderstood
		withExceptionDo: [ :anError |
			self assert: TicTacToe positionOutsideBoardErrorMessage equals: anError messageText.
			self assertXIsMarkedOn: {} andOOn: {} ].! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:14'!
assertGameIsNotOver

	self deny: game isOver.
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:48'!
assertGameIsOver
	
	self assert: game isOver.

	self deny: game isPlayingX.
	self deny: game isPlayingO.
		
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:40:41'!
assertGameIsTied

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self assert: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:13:05'!
assertIsPlayingO
	
	self deny: game isPlayingX.
	self assert: game isPlayingO.
	self assertGameIsNotOver ! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:11:05'!
assertIsPlayingX
		
	self assert: game isPlayingX.
	self deny: game isPlayingO.
	self assertGameIsNotOver.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:38:07'!
assertOIsMarkedOn: oPositions
		
	self assert: oPositions size equals: game playerOPositions size.
	self assert: (game playerOPositions difference: oPositions) isEmpty.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:32:18'!
assertOWon

	self assertGameIsOver.
	
	self deny: game hasPlayerXWon.
	self assert: game hasPlayerOWon.
	self deny: game isTied.
! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:56'!
assertXIsMarkedOn: xPositions

	self assert: xPositions size equals: game playerXPositions size.
	self assert: (game playerXPositions difference: xPositions) isEmpty.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:37:44'!
assertXIsMarkedOn: xPositions andOOn: oPositions
 
	self assertXIsMarkedOn: xPositions.
	self assertOIsMarkedOn: oPositions.
	! !

!TicTacToeTest methodsFor: 'assertions' stamp: 'HAW 10/26/2017 15:23:30'!
assertXWon
	
	self assertGameIsOver.
	
	self assert: game hasPlayerXWon.
	self deny: game hasPlayerOWon.
	self deny: game isTied.
! !


!classDefinition: #Observer category: #TicTacToe!
Object subclass: #Observer
	instanceVariableNames: 'observable'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!Observer methodsFor: 'as yet unclassified' stamp: 'NL 6/3/2018 19:18:21'!
initialize: anObservable

	observable := anObservable! !

!Observer methodsFor: 'as yet unclassified' stamp: 'NL 6/3/2018 19:16:33'!
update

	self subclassResponsibility! !


!classDefinition: #TicTacToe category: #TicTacToe!
Object subclass: #TicTacToe
	instanceVariableNames: 'state playerOPositions playerXPositions observers'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:02:58'!
OHasWon
	
	^ self hasWin: os! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 5/29/2018 12:03:09'!
XHasWon
	
	^ self hasWin: xs! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 6/3/2018 20:04:29'!
addObserver: anObserver
	observers add: anObserver! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'jg 5/22/2018 12:36:01'!
hasCompletedRow: positions

	^ (1 to: 3) anySatisfy: [ :x | (positions count: [ :posicion | posicion x = x ]) = 3 ]! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 6/3/2018 20:02:59'!
isPositionTaken: aPosition

	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 6/3/2018 20:03:49'!
oPlayedAt: aPosition

	^ (playerOPositions includes: aPosition)
	! !

!TicTacToe methodsFor: 'as yet unclassified' stamp: 'NL 6/3/2018 20:03:42'!
xPlayedAt: aPosition

	^ (playerXPositions includes: aPosition)
	! !


!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 10:01:34'!
Os

	^os copy.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'jg 5/22/2018 10:01:25'!
Xs

	^xs copy.! !

!TicTacToe methodsFor: 'inspecting' stamp: 'JL 5/28/2018 21:03:49'!
state
	^state! !


!TicTacToe methodsFor: 'plays' stamp: 'NL 6/1/2018 07:33:28'!
putOAtPosition: aPosition
	(self isPositionTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	os add: aPosition.! !

!TicTacToe methodsFor: 'plays' stamp: 'NL 6/1/2018 07:33:54'!
putXAtPosition: aPosition
	(self isPositionTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
	xs add: aPosition.! !


!TicTacToe methodsFor: 'initialization' stamp: 'NL 6/3/2018 20:05:00'!
initialize
	playerXPositions _ OrderedCollection new.
	playerOPositions _ OrderedCollection new.
	state _ PlayingX for: self.
	observers _ OrderedCollection new.! !


!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:39'!
markAll: positions

	positions do: [ :aPosition | self markAt: aPosition ]! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:23'!
markAt: aPosition

	^state markAt: aPosition ! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:30:17'!
markWithOAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithOAt: aPosition.! !

!TicTacToe methodsFor: 'marking board' stamp: 'HAW 10/27/2017 10:24:49'!
markWithXAt: aPosition

	self assertIsInBoardBounds: aPosition.
	
	state markWithXAt: aPosition.! !


!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:41:25'!
add: aPosition to: positions nextPlayerState: nextPlayingState winnerState: winnerState

	positions add: aPosition.
	state := (self stateAfterAddingTo: positions with: nextPlayingState and: winnerState) for: self
	! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/25/2017 15:35:08'!
assertIsFree: aPosition

	(self isTaken: aPosition) ifTrue: [ self error: self class positionTakenErrorMessage ].
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/27/2017 10:26:10'!
assertIsInBoardBounds: aPosition

	(aPosition between: 1@1 and: 3@3) ifFalse: [ self error: self class positionOutsideBoardErrorMessage ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'NL 6/3/2018 20:12:52'!
markWithOWhenPlayingOAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerOPositions
		nextPlayerState: PlayingX
		winnerState: PlayerOWon.
		
		self notifyNewPlay: aPosition .
		self notifyNewState
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOWhenPlayingXAt: aPosition
	self error: self class notOTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXWhenPlayingOAt: aPoint
	self error: self class notXTurnErrorMessage.! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'NL 6/3/2018 20:13:43'!
markWithXWhenPlayingXAt: aPosition
	self assertIsFree: aPosition.
	self
		add: aPosition
		to: playerXPositions
		nextPlayerState: PlayingO
		winnerState: PlayerXWon.
		
		self notifyNewPlay: aPosition .
		self notifyNewState

		
! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'NL 6/3/2018 20:10:11'!
notifyNewPlay: aPosition

	observers do: [ :anObserver | anObserver updatePlayedPosition: aPosition ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'NL 6/3/2018 20:11:01'!
notifyNewState

	observers do: [ :anObserver | anObserver updateState ]! !

!TicTacToe methodsFor: 'marking board - private' stamp: 'HAW 10/26/2017 12:44:57'!
stateAfterAddingTo: positions with: nextPlayingState and: winnerState

	(self hasWin: positions) ifTrue: [ ^ winnerState ].
	self shouldBeTiedWhenNoOneWon ifTrue: [ ^ GameTied ].

	^ nextPlayingState.! !


!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ state hasPlayerOWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ state hasPlayerXWon.! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 13:32:14'!
isOver
	
	^state isOver! !

!TicTacToe methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:01'!
isTied
	
	^ state isTied! !


!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:38'!
isPlayingO
	
	^state isPlayingO! !

!TicTacToe methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:14'!
isPlayingX
	
	^state isPlayingX ! !


!TicTacToe methodsFor: 'testing board positions' stamp: 'HAW 10/25/2017 15:50:52'!
isTaken: aPosition
	^ (playerXPositions includes: aPosition) or: [ playerOPositions includes: aPosition ].! !


!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:16'!
playerOPositions
	^ playerOPositions copy.! !

!TicTacToe methodsFor: 'positions' stamp: 'HAW 10/25/2017 15:56:32'!
playerXPositions
	^ playerXPositions copy.! !


!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:22:42'!
has: positions threeOf: aPositionComponent

	^(positions collect: aPositionComponent) asBag contents values includes: 3 
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:09:34'!
hasCompletedColumn: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition x ]
	
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:25:55'!
hasCompletedDiagonal: positions 
	
	^(self hasUpDiagonal: positions) or: [self hasDownDiagonal: positions]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/25/2017 16:10:47'!
hasCompletedLine: positions
	
	^self has: positions threeOf: [ :aPosition | aPosition y ]
! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 5/31/2018 00:25:48'!
hasCompletedStraightLine: positions
	
	^(self hasCompletedColumn: positions) or: [self hasCompletedLine: positions ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasDownDiagonal: positions

	^(1 to: 3) allSatisfy: [ :n | positions includes: n@(4-n) ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/24/2017 17:12:48'!
hasUpDiagonal: positions
	
	^(1 to: 3) allSatisfy: [ :n | positions includes: n@n ]! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:26:17'!
hasWin: positions

	^positions size >= 3 and: [ (self hasCompletedStraightLine: positions) or: [ self hasCompletedDiagonal: positions ]].
		
	! !

!TicTacToe methodsFor: 'game over testing - private' stamp: 'HAW 10/26/2017 12:44:42'!
shouldBeTiedWhenNoOneWon

	^ playerXPositions size = 5 and: [ playerOPositions size = 4 ].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToe class' category: #TicTacToe!
TicTacToe class
	instanceVariableNames: ''!

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
canNotPlayWhenGameIsOverErrorMessage
	
	^'Can not play when game is over'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notOTurnErrorMessage
	
	^'Not O''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
notXTurnErrorMessage
	
	^'Not X''s turn'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/27/2017 10:26:31'!
positionOutsideBoardErrorMessage
	
	^'Position is outside board'! !

!TicTacToe class methodsFor: 'as yet unclassified' stamp: 'HAW 10/24/2017 17:12:48'!
positionTakenErrorMessage
	
	^'Position taken'! !


!classDefinition: #TicTacToeConsole category: #TicTacToe!
Object subclass: #TicTacToeConsole
	instanceVariableNames: 'log tictactoeGame'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeConsole methodsFor: 'initialization' stamp: 'NL 6/3/2018 20:14:15'!
initializeWith: aTicTacToe
	tictactoeGame := aTicTacToe.
	log := OrderedCollection new.
	aTicTacToe addObserver: self.! !


!TicTacToeConsole methodsFor: 'accesing' stamp: 'NL 6/3/2018 19:36:39'!
gameState 
	(tictactoeGame isPlayingX) ifTrue:[ ^ 'Jugando X'].
	(tictactoeGame isPlayingO) ifTrue:[ ^ 'Jugando O'].
	(tictactoeGame hasPlayerXWon ) ifTrue:[^ 'Juego terminado - Ganó X!!'].
	(tictactoeGame hasPlayerOWon ) ifTrue:[^'Juego terminado - Ganó O!!'].
	(tictactoeGame isTied ) ifTrue:[^'Juego empatado!!']
	! !

!TicTacToeConsole methodsFor: 'accesing' stamp: 'Nacho 5/31/2018 19:33:24'!
log
	^log! !

!TicTacToeConsole methodsFor: 'accesing' stamp: 'NL 6/3/2018 19:29:15'!
updatePlayedPosition: aPoint 
	
	log add: (self whoPlayedAt: aPoint), ' marcó en ' , aPoint printString .
	! !

!TicTacToeConsole methodsFor: 'accesing' stamp: 'NL 6/3/2018 19:34:05'!
updateState
	
	log add: 'Estado: ' , self gameState.! !

!TicTacToeConsole methodsFor: 'accesing' stamp: 'NL 6/3/2018 20:17:33'!
whoPlayedAt: aPoint

	(tictactoeGame xPlayedAt: aPoint) ifTrue: [ ^ 'X' ].
	(tictactoeGame oPlayedAt: aPoint) ifTrue: [ ^ 'O' ].
	
	^ ''! !



!classDefinition: #TicTacToeState category: #TicTacToe!
Object subclass: #TicTacToeState
	instanceVariableNames: 'game'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerOWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
hasPlayerXWon
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isOver
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:28:07'!
isTied
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingO
	
	self subclassResponsibility! !

!TicTacToeState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:28:07'!
isPlayingX
	
	self subclassResponsibility! !


!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:31'!
markAt: aPosition

	self subclassResponsibility ! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	self subclassResponsibility.! !

!TicTacToeState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	self subclassResponsibility.! !


!TicTacToeState methodsFor: 'initialization' stamp: 'HAW 10/25/2017 13:05:13'!
initializeFor: aGame

	game := aGame ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TicTacToeState class' category: #TicTacToe!
TicTacToeState class
	instanceVariableNames: ''!

!TicTacToeState class methodsFor: 'as yet unclassified' stamp: 'HAW 10/25/2017 13:05:29'!
for: aTicTacToe 
	
	^self new initializeFor: aTicTacToe ! !


!classDefinition: #GameOverState category: #TicTacToe!
TicTacToeState subclass: #GameOverState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameOverState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 11:53:57'!
isOver
	
	^true! !


!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:23'!
isPlayingO
	
	^false! !

!GameOverState methodsFor: 'testing playing turn' stamp: 'HAW 10/26/2017 12:05:27'!
isPlayingX
	
	^false! !


!GameOverState methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:09'!
markAt: aPosition

	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:25'!
markWithOAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !

!GameOverState methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:16'!
markWithXAt: aPosition
	game error: game class canNotPlayWhenGameIsOverErrorMessage.! !


!classDefinition: #GameTied category: #TicTacToe!
GameOverState subclass: #GameTied
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!GameTied methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:24:49'!
isTied
	
	^true! !


!classDefinition: #PlayerOWon category: #TicTacToe!
GameOverState subclass: #PlayerOWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ true.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ false.! !

!PlayerOWon methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:06:24'!
isTied
	
	^false! !


!classDefinition: #PlayerXWon category: #TicTacToe!
GameOverState subclass: #PlayerXWon
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 16:14:31'!
hasPlayerOWon
	^ false.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:51:46'!
hasPlayerXWon
	^ true.! !

!PlayerXWon methodsFor: 'testing game result' stamp: 'HAW 10/25/2017 15:25:44'!
isTied
	
	^false! !


!classDefinition: #PlayingState category: #TicTacToe!
TicTacToeState subclass: #PlayingState
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:10'!
hasPlayerOWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:17'!
hasPlayerXWon
	^ false.! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:26'!
isOver
	
	^false! !

!PlayingState methodsFor: 'testing game result' stamp: 'HAW 10/26/2017 12:07:52'!
isTied
	
	^false! !


!classDefinition: #PlayingO category: #TicTacToe!
PlayingState subclass: #PlayingO
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:36'!
isPlayingO
	
	^true! !

!PlayingO methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:18:27'!
isPlayingX
	
	^false! !


!PlayingO methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:13'!
markAt: aPosition

	^game markWithOAt: aPosition ! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:29:45'!
markWithOAt: aPosition
	game markWithOWhenPlayingOAt: aPosition.! !

!PlayingO methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:32'!
markWithXAt: aPosition
	game markWithXWhenPlayingOAt: aPosition.! !


!classDefinition: #PlayingX category: #TicTacToe!
PlayingState subclass: #PlayingX
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'TicTacToe'!

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:50'!
isPlayingO
	
	^false! !

!PlayingX methodsFor: 'testing playing turn' stamp: 'HAW 10/25/2017 16:17:23'!
isPlayingX
	
	^true! !


!PlayingX methodsFor: 'marking board' stamp: 'HAW 5/31/2018 18:49:17'!
markAt: aPosition

	^game markWithXAt: aPosition ! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:01'!
markWithOAt: aPosition
	game markWithOWhenPlayingXAt: aPosition.! !

!PlayingX methodsFor: 'marking board' stamp: 'HAW 10/26/2017 12:30:46'!
markWithXAt: aPosition
	game markWithXWhenPlayingXAt: aPosition.! !
