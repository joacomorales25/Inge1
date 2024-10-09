!classDefinition: #MarsRoverTests category: #'Mars Rover'!
TestCase subclass: #MarsRoverTests
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 20:51:55'!
test01MarsRoverNoSeMueveSinInstrucciones

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Sur.
	
	marsRover procesarInstrucciones: ''.
	
	self assert: (marsRover estaEnPosicion: 0@0 mirandoA: #Sur ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:28:05'!
test02MarsRoverSeMueveUnaVezHaciaAdelanteMirandoAlSur

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Sur.
	
	marsRover procesarInstrucciones: 'f'.
	
	self assert: (marsRover estaEnPosicion: -1@0 mirandoA: #Sur ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:28:47'!
test03MarsRoverSeMueveUnaVezHaciaAdelanteMirandoAlNorte

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Norte.
	
	marsRover procesarInstrucciones: 'f'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Norte ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:29:25'!
test04MarsRoverSeMueveUnaVezHaciaAdelanteMirandoAlEste

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Este.
	
	marsRover procesarInstrucciones: 'f'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Este ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:29:17'!
test05MarsRoverSeMueveUnaVezHaciaAdelanteMirandoAlOeste

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Oeste.
	
	marsRover procesarInstrucciones: 'f'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Oeste ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:29:48'!
test06MarsRoverSeMueveUnaVezHaciaAtrasMirandoAlOeste

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Oeste.
	
	marsRover procesarInstrucciones: 'b'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Oeste ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:30:12'!
test07MarsRoverSeMueveUnaVezHaciaAtrasMirandoAlEste

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Este.
	
	marsRover procesarInstrucciones: 'b'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Este ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:30:24'!
test08MarsRoverSeMueveUnaVezHaciaAtrasMirandoAlSur

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Sur.
	
	marsRover procesarInstrucciones: 'b'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Sur ).! !

!MarsRoverTests methodsFor: 'testing' stamp: 'Joaquin 10/8/2024 21:30:51'!
test09MarsRoverSeMueveUnaVezHaciaAtrasMirandoAlNorte

	| marsRover |
	marsRover := MarsRover posicionarEn: 0@0 mirandoA: #Norte.
	
	marsRover procesarInstrucciones: 'b'.
	
	self assert: (marsRover estaEnPosicion: 1@0 mirandoA: #Norte ).! !


!classDefinition: #MarsRover category: #'Mars Rover'!
Object subclass: #MarsRover
	instanceVariableNames: 'coordenada orientacion'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Mars Rover'!

!MarsRover methodsFor: 'initialization' stamp: 'Joaquin 10/8/2024 20:53:23'!
initializeEn: aCoordenada mirandoA: aOrientacion 
	coordenada := aCoordenada.
	orientacion := aOrientacion.! !


!MarsRover methodsFor: 'as yet unclassified' stamp: 'Joaquin 10/8/2024 20:58:51'!
estaEnPosicion: aCoordenada mirandoA: aOrientacion 
	
	^ (coordenada isEqualTo: aCoordenada) & (orientacion isEqualTo: aOrientacion).! !

!MarsRover methodsFor: 'as yet unclassified' stamp: 'Joaquin 10/8/2024 21:16:26'!
procesarInstrucciones: aInstructionList

	aInstructionList do: [:char | 
		(char isEqualTo: $f) ifTrue:[
			(orientacion = #Sur) ifTrue:[
				coordenada := ((coordenada x) - 1)@coordenada y.
				].
			].
		(char isEqualTo: $l) ifTrue: [
			(orientacion = #Sur) ifTrue: [
				orientacion := #Este.
				].
			]
		].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'MarsRover class' category: #'Mars Rover'!
MarsRover class
	instanceVariableNames: ''!

!MarsRover class methodsFor: 'instance creation' stamp: 'Joaquin 10/8/2024 20:52:54'!
posicionarEn: aCoordenada mirandoA: aOrientacion 
	^self new initializeEn: aCoordenada mirandoA: aOrientacion. ! !
