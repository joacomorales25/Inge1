!classDefinition: #Estado category: #'3.Replace-if-Type+State'!
Object subclass: #Estado
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!


!classDefinition: #Off category: #'3.Replace-if-Type+State'!
Estado subclass: #Off
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Off methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:10:30'!
increaseSpeed: aVehicle

	aVehicle accelerateTurnedOff.! !


!classDefinition: #On category: #'3.Replace-if-Type+State'!
Estado subclass: #On
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!On methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:09:38'!
increaseSpeed: aVehicle

	aVehicle accelerateTurnedOn.! !


!classDefinition: #Vehicle category: #'3.Replace-if-Type+State'!
Object subclass: #Vehicle
	instanceVariableNames: 'state type speed'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Vehicle methodsFor: 'initialization' stamp: 'Pepe 9/10/2024 23:21:05'!
initialize

	state := Off new.
	speed := 0 * kilometer / hour.! !


!Vehicle methodsFor: 'move' stamp: 'Pepe 9/10/2024 23:22:13'!
accelerate

	type accelerate.! !


!Vehicle methodsFor: 'on/off' stamp: 'Pepe 9/10/2024 23:06:00'!
turnOn

	state := On new.! !


!Vehicle methodsFor: 'error messages' stamp: 'Pepe 9/10/2024 23:05:50'!
canNotAccelerateErrorMessage
	self subclassResponsibility.
	type = #Helicopter ifTrue:[^'Can not fly when turned off'].
	type = #Motorcycle ifTrue:[^'Can not run when turned off'].! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Vehicle class' category: #'3.Replace-if-Type+State'!
Vehicle class
	instanceVariableNames: ''!

!Vehicle class methodsFor: 'instance creation' stamp: 'ARM 4/29/2024 11:00:51'!
helicopter

	^self new initializeWithType: #Helicopter! !

!Vehicle class methodsFor: 'instance creation' stamp: 'Pepe 9/10/2024 23:19:02'!
motorcycle

	^self new type initilize.! !


!classDefinition: #Helicopter category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Helicopter
	instanceVariableNames: 'altitude'
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Helicopter methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:08:07'!
accelerate
	
	state increaseSpeed self.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:17:37'!
accelerateTurnedOff
	self error: 'Can not fly when turned off'.! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:15:47'!
accelerateTurnedOn
	speed := speed + (10 * kilometer / hour).
	altitude := altitude + (5 * meter).
! !

!Helicopter methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:12:56'!
initialize
	state := Off new.
	speed := 0 * kilometer / hour.
	altitude := 0 * meter! !


!classDefinition: #Motorcyle category: #'3.Replace-if-Type+State'!
Vehicle subclass: #Motorcyle
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: '3.Replace-if-Type+State'!

!Motorcyle methodsFor: 'move' stamp: 'Pepe 9/10/2024 23:07:45'!
accelerate! !


!Motorcyle methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:17:46'!
accelerateTurnedOff
	self error: 'Can not run when turned off'.! !

!Motorcyle methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:16:02'!
accelerateTurnedOn
	speed := speed + (20 * kilometer / hour).! !

!Motorcyle methodsFor: 'as yet unclassified' stamp: 'Pepe 9/10/2024 23:13:17'!
initialize
	state := Off new.
	speed := 0 * kilometer / hour.! !
