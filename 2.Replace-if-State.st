!classDefinition: #Automobil category: #'2.Replace-if-State'!
Object subclass: #Automobil
	instanceVariableNames: 'state speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Automobil methodsFor: 'initialization' stamp: 'ARM 4/29/2024 10:57:09'!
initialize

	state := #Off.
	speed := 0 * kilometer / hour! !


!Automobil methodsFor: 'move' stamp: 'ARM 4/29/2024 10:54:56'!
accelerate

	state = #Off ifTrue:[self error: 'Can not accelerate when turned off'].
	state = #On ifTrue:[speed := speed + (10 * kilometer / hour)].! !

!Automobil methodsFor: 'move' stamp: 'Pepe 9/10/2024 22:46:41'!
turnOn

	state := On new.! !


!Automobil methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:54:14'!
increaseSpeedTurnedOff
	
	self error: 'Can not accelerate when turned off'.! !

!Automobil methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:53:44'!
increaseSpeedTurnedOn

	speed := speed + (10 * kilometer / hour).! !


!classDefinition: #Estado category: #'2.Replace-if-State'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Estado methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:50:37'!
accelerate: aCar
	
	self subclassResponsibility.! !

!Estado methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:50:07'!
increaseCarSpeed: aCar
	
	self subclassResponsibility.! !


!classDefinition: #Off category: #'2.Replace-if-State'!
Estado subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!Off methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:50:52'!
accelerate: aCar! !

!Off methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:54:54'!
increaseCarSpeed: aCar
	
	aCar increaseSpeedTurnedOff.
! !


!classDefinition: #On category: #'2.Replace-if-State'!
Estado subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '2.Replace-if-State'!

!On methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 22:54:44'!
increaseCarSpeed: aCar
	
	aCar increaseSpeedTurnedOn.
! !
