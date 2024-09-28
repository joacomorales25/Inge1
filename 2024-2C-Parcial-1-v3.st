!classDefinition: #TestMyA category: #'2024-2C-Parcial-1'!
TestCase subclass: #TestMyA
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 03:49:05'!
test01UnMonstruoAtacaAUnAventureroUsandoSusPVs

	| guerrero |
	
	guerrero := self crearGuerrero.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (5 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:09:06'!
test02UnAventureroPuedeUsarItemsDeDefensaParaProtegerse

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearEscudoMagico.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearOgro atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv - (15 * pv - (5 * pv) - (3 * pv)))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:35'!
test03LosItemsDeDefensaNoPuedenAumentarLosPuntosDeVidaDelAventurero

	| guerrero |
	
	guerrero := self crearGuerrero.
	guerrero equiparItemDeDefensa: self crearArmadura.
	guerrero equiparItemDeDefensa: self crearArmadura.
	
	self crearGoblin atacarA: guerrero.
	
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:04:39'!
test04UnAventureroNoPuedeAtacarSinItemsEquipados

	| guerrero ogro espada |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	espada := self crearEspadaPara: ogro.
	
	self should: [ guerrero atacarA: ogro con: (espada) ] 
		raise: Error-MessageNotUnderstood 
		withExceptionDo: [ :anException |
			self assert: anException messageText equals: guerrero itemNoDisponibleMensajeDeError.
			self assert: (ogro tienePuntosDeVida: 15 * pv)
	]
	! !

!TestMyA methodsFor: 'tests' stamp: 'LL 9/27/2024 10:48:15'!
test05UnGuerreroConEspadaProvocaDañoSegunSuFuerza

	| guerrero ogro itemDeAtaque otroItemDeAtaque otroOgro |
	
	guerrero := self crearGuerrero.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	otroOgro := self crearOgro.
	otroItemDeAtaque := self crearEspadaPara: otroOgro.
	guerrero equiparItemDeAtaque: otroItemDeAtaque.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	guerrero atacarA: otroOgro con: otroItemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (otroOgro tienePuntosDeVida: 15 * pv - (4 * pv)).
	self assert: (guerrero tienePuntosDeVida: 10 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'HAW 9/27/2024 09:46:06'!
test06UnGuerreroConEspadaNoProvocaDañoAOtroMonstruoQueNoSeaElDeLaEspada

	| guerrero ogroNoObjetivoDeAtaque itemDeAtaque ogroObjetivoDeAtaque |
	
	guerrero := self crearGuerrero.
	ogroObjetivoDeAtaque := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogroObjetivoDeAtaque.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogroNoObjetivoDeAtaque := self crearOgro.
	
	guerrero atacarA: ogroNoObjetivoDeAtaque con: itemDeAtaque.
	
	self assert: (ogroNoObjetivoDeAtaque tienePuntosDeVida: 15 * pv)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:52'!
test07UnAventureroNoGuerreroPierdeTodosSusPuntosDeVidaSiUsaLaEspada

	| ogro mago itemDeAtaque |
	
	mago := self crearMago.
	ogro := self crearOgro.
	itemDeAtaque := self crearEspadaPara: ogro.
	mago equiparItemDeAtaque: itemDeAtaque.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv).
	self assert: (mago tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:49'!
test08ElMagoUsandoElBaculoMataAlGoblin

	| mago goblin itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	goblin :=  self crearGoblin.
	
	mago atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 0)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:42:13'!
test09ElMagoUsandoElBaculoDañaAOtrosMonstruosSegunSuFuerza

	| mago ogro itemDeAtaque |
	
	mago := self crearMago.
	itemDeAtaque := self crearBaculo.
	mago equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	mago atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (2 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:45'!
test10UnAventureroNoMagoEsPenalizadoAlUsarElBaculoDuplicandoPVDeGoblins

	| guerrero goblin itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	goblin := self crearGoblin.
	
	guerrero atacarA: goblin con: itemDeAtaque.
	
	self assert: (goblin tienePuntosDeVida: 5 * pv * 2)! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:08:38'!
test11UnAventureroNoMagoUsandoElBaculoDañaSegunSuFuerzaAOtrosMonstruos

	| guerrero ogro itemDeAtaque |
	
	guerrero := self crearGuerrero.
	itemDeAtaque := self crearBaculo.
	guerrero equiparItemDeAtaque: itemDeAtaque.
	ogro := self crearOgro.
	
	guerrero atacarA: ogro con: itemDeAtaque.
	
	self assert: (ogro tienePuntosDeVida: 15 * pv - (4 * pv))! !

!TestMyA methodsFor: 'tests' stamp: 'NR 9/27/2024 04:29:01'!
test12UnaEspadaNuncaPuedeSerUsadaEnMonstruosDeMenosDeUnMetro

	| goblin |
	
	goblin := self crearGoblin.
	
	self should: [ self crearEspadaPara: goblin ] 
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [ :anException |
		self assert: anException messageText equals: Espada noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	]
	! !


!TestMyA methodsFor: 'crear items' stamp: 'Joaquin 9/27/2024 18:22:31'!
crearArmadura
	^ Armadura new.! !

!TestMyA methodsFor: 'crear items' stamp: 'Joaquin 9/27/2024 19:19:05'!
crearBaculo
	
	^ Baculo new. ! !

!TestMyA methodsFor: 'crear items' stamp: 'Joaquin 9/27/2024 18:05:12'!
crearEscudoMagico

	^ EscudoMagico new.
! !

!TestMyA methodsFor: 'crear items' stamp: 'Joaquin 9/27/2024 18:40:39'!
crearEspadaPara: monstruo

	^Espada para: monstruo. 
! !


!TestMyA methodsFor: 'crear combatientes' stamp: 'Joaquin 9/27/2024 17:40:59'!
crearGoblin

	^ Goblin new.! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'Joaquin 9/27/2024 17:43:55'!
crearGuerrero
	
	^Guerrero new.! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'Joaquin 9/27/2024 19:05:00'!
crearMago

	^ Mago new.
! !

!TestMyA methodsFor: 'crear combatientes' stamp: 'Joaquin 9/27/2024 18:03:15'!
crearOgro

	^Ogro new.! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestMyA class' category: #'2024-2C-Parcial-1'!
TestMyA class
	instanceVariableNames: ''!

!TestMyA class methodsFor: 'initialization' stamp: 'LL 9/26/2024 20:21:50'!
initialize

	Smalltalk at: #pv put: (BaseUnit named: 'pv' sign: 'pv')! !


!classDefinition: #Aventurero category: #'2024-2C-Parcial-1'!
Object subclass: #Aventurero
	instanceVariableNames: 'fuerzaAventurero itemsDeAtaque itemsDeDefensa puntosDeVidaDeAventurero'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Aventurero methodsFor: 'error messages' stamp: 'Joaquin 9/27/2024 19:03:48'!
itemNoDisponibleMensajeDeError

	^ 'El personaje no posee dicho item'! !


!Aventurero methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:13:56'!
equiparItemDeAtaque: unItemDeAtaque
	
	itemsDeAtaque  add: unItemDeAtaque.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:14:57'!
equiparItemDeDefensa: unItemDeDefensa

	itemsDeDefensa add: unItemDeDefensa.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:14:34'!
puntosDeAtaque
	^fuerzaAventurero.! !

!Aventurero methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:14:14'!
tienePuntosDeVida: puntosDeVida
	^ puntosDeVidaDeAventurero  = puntosDeVida.! !


!classDefinition: #Guerrero category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Guerrero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Guerrero methodsFor: 'mensajes ataque' stamp: 'Joaquin 9/27/2024 21:08:47'!
atacarConBaculoA: unMonstruo
	unMonstruo recibirAtaqueDeGuerreroConBaculo: self.! !

!Guerrero methodsFor: 'mensajes ataque' stamp: 'Joaquin 9/27/2024 20:59:43'!
atacarConEspadaA: unMonstruo

	unMonstruo recibirAtaqueDeGuerreroConEspada: self. ! !


!Guerrero methodsFor: 'as yet unclassified'!
! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:29:20'!
recibirAtaqueDe: unMonstruo

	|posibleDescuentoAGuerrero maxDescuento|

	posibleDescuentoAGuerrero := OrderedCollection  with:0 with: (unMonstruo puntosDeAtaque - self totalDefensaPoseeida).
	
	maxDescuento := posibleDescuentoAGuerrero inject: 0 into: [:a :c | (a > c)	 ifTrue: [a]
   ifFalse: [c]].
	
	
	puntosDeVidaDeAventurero := puntosDeVidaDeAventurero - ( maxDescuento ).! !

!Guerrero methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 18:20:14'!
totalDefensaPoseeida
	
	| totalPuntosDeDefensa |
	totalPuntosDeDefensa := 0.
	itemsDeDefensa do: [:item | totalPuntosDeDefensa  := totalPuntosDeDefensa  + item defensa].
	
	
	^totalPuntosDeDefensa.
! !



!Guerrero methodsFor: 'initialization'!
! !


!classDefinition: #Mago category: #'2024-2C-Parcial-1'!
Aventurero subclass: #Mago
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Mago methodsFor: 'initialization' stamp: 'Joaquin 9/27/2024 19:05:56'!
initialize
	puntosDeVidaDeAventurero := 15 * pv.
	fuerzaAventurero  := 2 * pv.
	itemsDeDefensa  := OrderedCollection  new.
	itemsDeAtaque  := OrderedCollection  new.! !


!Mago methodsFor: 'mensajes ataque' stamp: 'Joaquin 9/27/2024 21:09:20'!
atacarA: unMonstruo con: itemAtaque 

	(itemsDeAtaque includes: itemAtaque) ifFalse: [ ^ self error: self itemNoDisponibleMensajeDeError ].
	
	itemAtaque  atacarA: unMonstruo deParteDe: self.! !

!Mago methodsFor: 'mensajes ataque' stamp: 'Joaquin 9/27/2024 21:06:51'!
atacarConBaculoA: unMonstruo

	unMonstruo recibirAtaqueDeMagoConBaculo: self.! !

!Mago methodsFor: 'mensajes ataque' stamp: 'Joaquin 9/27/2024 21:06:55'!
atacarConEspadaA: unMonstruo

	unMonstruo recibirAtaqueDeMagoConEspada: self.
	! !


!Mago methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:03:41'!
recibirEfectoDeEspada
	puntosDeVidaDeAventurero := 0 * pv.! !


!classDefinition: #Estado category: #'2024-2C-Parcial-1'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!


!classDefinition: #Activo category: #'2024-2C-Parcial-1'!
Estado subclass: #Activo
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Activo methodsFor: 'as yet unclassified'!
! !


!classDefinition: #Derrotado category: #'2024-2C-Parcial-1'!
Estado subclass: #Derrotado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Derrotado methodsFor: 'as yet unclassified'!
! !


!classDefinition: #ItemAtaque category: #'2024-2C-Parcial-1'!
Object subclass: #ItemAtaque
	instanceVariableNames: 'puntosDeVidaOgro'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemAtaque methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:13:31'!
puedoAtacarMonstruo: unMonstruo
	self subclassResponsibility.! !

!ItemAtaque methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 21:13:25'!
puedoAtacarMonstruoSegunAltura: unMonstruo
	self subclassResponsibility.! !


!classDefinition: #Baculo category: #'2024-2C-Parcial-1'!
ItemAtaque subclass: #Baculo
	instanceVariableNames: 'monstruosAtacables'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Baculo methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:47:12'!
atacarA: unMonstruo deParteDe: unAventurero

	(self puedoAtacarMonstruo: unMonstruo) ifTrue: [
		unAventurero atacarConBaculoA: unMonstruo.
		].! !

!Baculo methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:31:20'!
initialize
	monstruosAtacables := OrderedCollection with: Goblin new with: Ogro new.! !

!Baculo methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:54:34'!
puedoAtacarMonstruo: unMonstruo
	
	^true.
	! !

!Baculo methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:21:17'!
puedoAtacarMonstruoSegunAltura: unMonstruo

	^true.! !


!classDefinition: #Espada category: #'2024-2C-Parcial-1'!
ItemAtaque subclass: #Espada
	instanceVariableNames: 'monstruoObjetivo monstruosAtacables'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Espada methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:52:12'!
atacarA: unMonstruo deParteDe: unAventurero

	(self puedoAtacarMonstruo: unMonstruo) ifTrue: [
		unAventurero atacarConEspadaA: unMonstruo.
		].! !

!Espada methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:26:13'!
crearEspadaPara: unMonstruo

	monstruosAtacables := OrderedCollection with: unMonstruo.! !

!Espada methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:25:00'!
puedoAtacarMonstruo: unMonstruo
	
	^monstruosAtacables includes: unMonstruo.! !

!Espada methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:36:24'!
puedoAtacarMonstruoSegunAltura: unMonstruo

	^unMonstruo mideMasDe: 100* centimeter .! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Espada class' category: #'2024-2C-Parcial-1'!
Espada class
	instanceVariableNames: ''!

!Espada class methodsFor: 'error handling' stamp: 'Joaquin 9/27/2024 20:29:39'!
noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError
	^'El monstruo tiene que medir mas de un metro de altura'.! !

!Espada class methodsFor: 'error handling' stamp: 'Joaquin 9/27/2024 20:34:32'!
para: unMonstruo
	(self puedoAtacarMonstruoSegunAltura: unMonstruo) ifFalse: [ ^ self error: self  noSePuedeAtacarAMonstruoMenorAUnMetroDeAlturaMensajeDeError].
	
	^self new crearEspadaPara: unMonstruo.! !


!Espada class methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:34:24'!
puedoAtacarMonstruoSegunAltura: unMonstruo

	^unMonstruo mideMasDe: 1*meter.! !


!classDefinition: #ItemDefensivo category: #'2024-2C-Parcial-1'!
Object subclass: #ItemDefensivo
	instanceVariableNames: 'puntosDeDefensa'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!ItemDefensivo methodsFor: 'as yet unclassified'!
! !


!classDefinition: #Armadura category: #'2024-2C-Parcial-1'!
ItemDefensivo subclass: #Armadura
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Armadura methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 18:09:29'!
initialize
	puntosDeDefensa  := 5 * pv.! !


!classDefinition: #EscudoMagico category: #'2024-2C-Parcial-1'!
ItemDefensivo subclass: #EscudoMagico
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!EscudoMagico methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 18:07:06'!
initialize
	puntosDeDefensa  := 3 * pv.! !


!classDefinition: #Monstruo category: #'2024-2C-Parcial-1'!
Object subclass: #Monstruo
	instanceVariableNames: 'puntosDeVida puntosDeAtaque altura'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Monstruo methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:06:23'!
duplicarVida
	puntosDeVida  := 2*puntosDeVida.! !

!Monstruo methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:22:04'!
mideMasDe: alturaMonstruo
	
	^altura > alturaMonstruo.! !

!Monstruo methodsFor: 'as yet unclassified'!
! !


!classDefinition: #Goblin category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Goblin
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Goblin methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:22:00'!
tienePuntosDeVida: apuntosDeVida
	^puntosDeVida  = apuntosDeVida.! !


!Goblin methodsFor: 'initialization' stamp: 'Joaquin 9/27/2024 20:35:53'!
initialize
	puntosDeVida := 5 * pv.
	altura  := 90 * centimeter.! !


!Goblin methodsFor: 'envio de ataques' stamp: 'Joaquin 9/27/2024 17:52:13'!
atacarA: unGuerrero
	
	unGuerrero recibirAtaqueDe: self.
! !


!Goblin methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:09:53'!
recibirAtaqueDe: unAventurero con: unItemDeAtaque

	unItemDeAtaque atacarA: self deParteDe: unAventurero.
	
	! !

!Goblin methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:08:12'!
recibirAtaqueDeGuerreroConBaculo: unGuerrero
	puntosDeVida := 2*puntosDeVida.! !

!Goblin methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 20:58:55'!
recibirAtaqueDeGuerreroConEspada: unGuerrero
	puntosDeVida  := puntosDeVida - unGuerrero  puntosDeAtaque.! !

!Goblin methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:08:19'!
recibirAtaqueDeMagoConBaculo: unGuerrero
	
	puntosDeVida := 0 * pv.! !

!Goblin methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:05:16'!
recibirAtaqueDeMagoConEspada: unMago
	
	unMago recibirEfectoDeEspada.! !


!classDefinition: #Ogro category: #'2024-2C-Parcial-1'!
Monstruo subclass: #Ogro
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2024-2C-Parcial-1'!

!Ogro methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 19:58:54'!
recibirAtaqueDe: unAventurero con: unItemDeAtaque
	
	(unItemDeAtaque puedoAtacarMonstruo: self) ifTrue: [
	puntosDeVida := puntosDeVida - unAventurero puntosDeAtaque.
	].! !

!Ogro methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:01:43'!
recibirAtaqueDeGuerreroConBaculo: unGuerrero
	
	puntosDeVida := puntosDeVida  - unGuerrero puntosDeAtaque.! !

!Ogro methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:00:52'!
recibirAtaqueDeGuerreroConEspada: unGuerrero
	puntosDeVida  := puntosDeVida  - unGuerrero puntosDeAtaque.! !

!Ogro methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:02:38'!
recibirAtaqueDeMagoConBaculo: unMago
	
	puntosDeVida := puntosDeVida - unMago puntosDeAtaque.
	
	! !

!Ogro methodsFor: 'recepcion de ataques' stamp: 'Joaquin 9/27/2024 21:03:24'!
recibirAtaqueDeMagoConEspada: unMago
	
	unMago recibirEfectoDeEspada.
	! !


!Ogro methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 18:17:35'!
atacarA: unAventurero
	
	unAventurero recibirAtaqueDe: self.! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 20:36:09'!
initialize
	puntosDeVida := 15 * pv.
	altura := 220 * centimeter.! !

!Ogro methodsFor: 'as yet unclassified' stamp: 'Joaquin 9/27/2024 19:59:16'!
tienePuntosDeVida: aPuntosDeVida

	^ puntosDeVida  = aPuntosDeVida.

	! !

TestMyA initialize!