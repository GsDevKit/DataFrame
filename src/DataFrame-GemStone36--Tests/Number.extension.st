Extension { #name : 'Number' }

{ #category : '*DataFrame-GemStone36--Tests' }
Number >> % aNumber [ 
	"modulo. Remainder defined in terms of //. Answer a Number with the 
	same sign as aNumber."
	
	"9 % 4 >>> 1"
	"-9 % 4 >>> 3"
	"9 % -4 >>> -3"
	
	
	^ self \\ aNumber
]
