﻿Object subclass: #Address
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	self subclassResponsibility! !
	^customers detect: [ :customer | customer isIdentifiedAs: anIdentifycationType numbered: anIdentificationNumber] ifNone: aBlock.! !