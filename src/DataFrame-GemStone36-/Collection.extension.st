Extension { #name : 'Collection' }

{ #category : '*DataFrame-GemStone36-' }
Collection >> detect: aBlock ifFound: foundBlock ifNone: exceptionBlock [
	"Evaluate aBlock with each of the receiver's elements as the argument.  
	If some element evaluates aBlock to true, then cull this element into 
	foundBlock and answer the result of this evaluation. 
	If none evaluate to true, then evaluate exceptionBlock."

	self
		do: [ :each | 
			(aBlock value: each)
				ifTrue: [ ^ foundBlock cull: each ] ].
	^ exceptionBlock value
]

{ #category : '*DataFrame-GemStone36-' }
Collection >> ifNotEmpty: notEmptyBlock ifEmpty: emptyBlock [
	"Evaluate emptyBlock if I'm empty, notEmptyBlock otherwise
	 If the notEmptyBlock has an argument, eval with the receiver as its argument"

	^ self isEmpty
		ifTrue: [ emptyBlock value ]
		ifFalse: [ notEmptyBlock cull: self ]
]

{ #category : '*DataFrame-GemStone36-' }
Collection >> intersection: aCollection [
	"Answer the set theoretic intersection of two collections."

	"(#(1 2 3 4) intersection: #(3 4 5)) >>> #(3 4)"

	"(#(1 2 3 4) intersection: #()) >>> #()"

	"(#() intersection: #(1 2 3 4)) >>> #()"

	^ self species withAll: (self asSet intersection: aCollection) asArray
]

{ #category : '*DataFrame-GemStone36-' }
Collection >> isSequenceable [

	^ false
]

{ #category : '*DataFrame-GemStone36-' }
Collection >> median [
	"Return the middle element, or as close as we can get.
	
	Example of use:
	{1 . 2 . 3 . 4 . 5} median >>> 3
	{1 . 2 . 4 . 5} median >>> 3
	{1 . 2 . 5 . 5} median >>> (7/2)
	"
	
	^ self asSortedCollection median
]

{ #category : '*DataFrame-GemStone36-' }
Collection >> sorted [
	"Return a new sequenceable collection which contains the same elements as self but its 
elements are sorted"
	
	^self asArray sorted
]

{ #category : '*DataFrame-GemStone36-' }
Collection >> sorted: aSortBlockOrNil [
	"Return a new sequenceable collection which contains the same elements as self but its 
elements are sorted by aSortBlockOrNil. The block should take two arguments and return true if 
the first element should preceed the second one. If aSortBlock is nil then <= is used for 
comparison."
	
	^self asArray sort: aSortBlockOrNil
]
