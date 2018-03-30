!classDefinition: #I category: #'Workspace-Objects'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Workspace-Objects'!
I class
	instanceVariableNames: 'next'!

!I class methodsFor: 'axiomas' stamp: 'NL 3/26/2018 16:48:13'!
* unNumeroDePeano
	
	^ unNumeroDePeano! !

!I class methodsFor: 'axiomas' stamp: 'NL 3/26/2018 20:43:59'!
+ unNumero

	^ unNumero next.! !

!I class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 16:38:21'!
- unNumero
	
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados.! !

!I class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:00:22'!
next
	^II! !

!I class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:07:23'!
previous
	self error:  'No existe el anterior a I'.! !


!I class methodsFor: 'Error' stamp: 'NL 3/30/2018 19:02:11'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor

	^ 'No se puede dividir por un numero mayor'! !

!I class methodsFor: 'Error' stamp: 'NL 3/30/2018 16:37:50'!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^ 'Numeros negativos no soportados'! !


!I class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:34'!
/ unNumeroDePeano

	(self < unNumeroDePeano) ifTrue: [ self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor ]
									ifFalse: [ ^ self ].! !

!I class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 18:23:38'!
< unNumeroDePeano
	
	^ (unNumeroDePeano = I) not! !

!I class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 18:56:08'!
<= unNumeroDePeano
	^ unNumeroDePeano = self! !

!I class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 17:56:37'!
restateCon: unNumero
	
	^ unNumero previous.! !

I instVarNamed: 'next' put: II!

!classDefinition: #II category: #'Workspace-Objects'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Workspace-Objects'!
II class
	instanceVariableNames: 'next previous'!

!II class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 17:01:12'!
* unNumeroDePeano
								
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:11:08'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!II class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 18:07:20'!
- unNumero

	^ unNumero restateCon: self.! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:18:18'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:22:36'!
previous
	^previous! !

!II class methodsFor: 'axiomas' stamp: 'Nacho 3/22/2018 21:25:56'!
previous: aNumber

	previous:= aNumber! !

!II class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 17:59:23'!
restateCon: unNumero
	^ self restateConUnNumeroMayorAUno: unNumero
! !

!II class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 18:02:11'!
restateConUnNumeroMayorAUno: unNumero
	
	^ unNumero previous - self previous ! !


!II class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:00:51'!
/ unNumeroDePeano

	| contador |
	
	(self < unNumeroDePeano) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	contador := I.
	
	[(unNumeroDePeano * (contador + I)) <= self] whileTrue: [	contador := contador + I ].
	
	^ contador! !

!II class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 18:45:02'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous < unNumeroDePeano previous ].! !

!II class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 18:56:44'!
<= unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous <= unNumeroDePeano previous ].! !

!II class methodsFor: 'as yet unclassified' stamp: 'NL 3/26/2018 16:58:58'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil
	]! !


!II class methodsFor: 'Error' stamp: 'NL 3/30/2018 16:36:44'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

II instVarNamed: 'next' put: III!
II instVarNamed: 'previous' put: I!

!classDefinition: #III category: #'Workspace-Objects'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Workspace-Objects'!
III class
	instanceVariableNames: 'next previous'!

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
* unNumeroDePeano
								
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
- unNumero

	^ unNumero restateCon: self.! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
previous
	^previous! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
previous: aNumber

	previous:= aNumber! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
restateCon: unNumero
	^ self restateConUnNumeroMayorAUno: unNumero
! !

!III class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
restateConUnNumeroMayorAUno: unNumero
	
	^ unNumero previous - self previous ! !


!III class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
/ unNumeroDePeano

	| contador |
	
	(self < unNumeroDePeano) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	contador := I.
	
	[(unNumeroDePeano * (contador + I)) <= self] whileTrue: [	contador := contador + I ].
	
	^ contador! !

!III class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous < unNumeroDePeano previous ].! !

!III class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
<= unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous <= unNumeroDePeano previous ].! !

!III class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil
	]! !


!III class methodsFor: 'Error' stamp: 'NL 3/30/2018 19:03:45'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

III instVarNamed: 'next' put: IIII!
III instVarNamed: 'previous' put: II!

!classDefinition: #IIII category: #'Workspace-Objects'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Workspace-Objects'!
IIII class
	instanceVariableNames: 'next previous'!

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
* unNumeroDePeano
								
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
- unNumero

	^ unNumero restateCon: self.! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
previous
	^previous! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
previous: aNumber

	previous:= aNumber! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
restateCon: unNumero
	^ self restateConUnNumeroMayorAUno: unNumero
! !

!IIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:45'!
restateConUnNumeroMayorAUno: unNumero
	
	^ unNumero previous - self previous ! !


!IIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
/ unNumeroDePeano

	| contador |
	
	(self < unNumeroDePeano) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	contador := I.
	
	[(unNumeroDePeano * (contador + I)) <= self] whileTrue: [	contador := contador + I ].
	
	^ contador! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous < unNumeroDePeano previous ].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
<= unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous <= unNumeroDePeano previous ].! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:45'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil
	]! !


!IIII class methodsFor: 'Error' stamp: 'NL 3/30/2018 19:03:45'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

IIII instVarNamed: 'next' put: IIIII!
IIII instVarNamed: 'previous' put: III!

!classDefinition: #IIIII category: #'Workspace-Objects'!
DenotativeObject subclass: #IIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIII class' category: #'Workspace-Objects'!
IIIII class
	instanceVariableNames: 'next previous'!

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
* unNumeroDePeano
								
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
- unNumero

	^ unNumero restateCon: self.! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
previous
	^previous! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
previous: aNumber

	previous:= aNumber! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
restateCon: unNumero
	^ self restateConUnNumeroMayorAUno: unNumero
! !

!IIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
restateConUnNumeroMayorAUno: unNumero
	
	^ unNumero previous - self previous ! !


!IIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
/ unNumeroDePeano

	| contador |
	
	(self < unNumeroDePeano) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	contador := I.
	
	[(unNumeroDePeano * (contador + I)) <= self] whileTrue: [	contador := contador + I ].
	
	^ contador! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous < unNumeroDePeano previous ].! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
<= unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous <= unNumeroDePeano previous ].! !

!IIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil
	]! !


!IIIII class methodsFor: 'Error' stamp: 'NL 3/30/2018 19:03:58'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

IIIII instVarNamed: 'next' put: IIIIII!
IIIII instVarNamed: 'previous' put: IIII!

!classDefinition: #IIIIII category: #'Workspace-Objects'!
DenotativeObject subclass: #IIIIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Workspace-Objects'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIIIII class' category: #'Workspace-Objects'!
IIIIII class
	instanceVariableNames: 'next previous'!

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
* unNumeroDePeano
								
	^ unNumeroDePeano + (self previous * unNumeroDePeano)! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
+ unNumeroDePeano

	^self previous + unNumeroDePeano next! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
- unNumero

	^ unNumero restateCon: self.! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
next
	next ifNil:
	[
		next := self cloneNamed:(self name, 'I').	
		next previous: self.
	].
	^next
	! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
previous
	^previous! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
previous: aNumber

	previous:= aNumber! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
restateCon: unNumero
	^ self restateConUnNumeroMayorAUno: unNumero
! !

!IIIIII class methodsFor: 'axiomas' stamp: 'NL 3/30/2018 19:03:58'!
restateConUnNumeroMayorAUno: unNumero
	
	^ unNumero previous - self previous ! !


!IIIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
/ unNumeroDePeano

	| contador |
	
	(self < unNumeroDePeano) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	contador := I.
	
	[(unNumeroDePeano * (contador + I)) <= self] whileTrue: [	contador := contador + I ].
	
	^ contador! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
< unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous < unNumeroDePeano previous ].! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
<= unNumeroDePeano
	(unNumeroDePeano = I) ifTrue: [ ^ false ] 
								ifFalse: [ ^ self previous <= unNumeroDePeano previous ].! !

!IIIIII class methodsFor: 'as yet unclassified' stamp: 'NL 3/30/2018 19:03:58'!
removeAllNext

	next ifNotNil:
	[
		next removeAllNext.
		next removeFromSystem.
		next := nil
	]! !


!IIIIII class methodsFor: 'Error' stamp: 'NL 3/30/2018 19:03:58'!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^ 'No se puede dividir por un numero mayor'! !

IIIIII instVarNamed: 'next' put: nil!
IIIIII instVarNamed: 'previous' put: IIIII!