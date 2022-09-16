Extension { #name : 'DataFrame' }

{ #category : '*DataFrame-GemStone36-' }
DataFrame >> reject: aBlock [ 
	"Evaluate aBlock with each of the receiver's elements as the argument. Collect into a new collection like the receiver only those elements for which aBlock evaluates to false. Answer the new collection."
	"DataFrame relied on the fact that Pharo's #reject: uses #select:. That's not the case in GemStone."
	"#(1 2 3 4 5) reject: #even >>>  #(1 3 5)"

	^ self select: [ :element | (aBlock value: element) == false ]
]
