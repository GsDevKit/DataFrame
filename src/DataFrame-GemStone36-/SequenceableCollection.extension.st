Extension { #name : 'SequenceableCollection' }

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection class >> ofSize: anInteger [

	^ self new: anInteger.
]

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection >> copyWithoutIndex: index [
	"Return a copy containing all elements except the index-th."

	| copy newSize |
	newSize := self size - 1.
	copy := self species new: newSize .
	copy replaceFrom: 1 to: index-1 with: self startingAt: 1.
	copy replaceFrom: index to: newSize with: self startingAt: index+1.
	^ copy
]

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection >> isSequenceable [

	^ true
]

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection >> sorted [
	"Return a new sequenceable collection which contains the same elements as self but its 
elements are sorted in ascending order using the #'<=' operator."
	"#(8 5 3 9) sorted >>> #(3 5 8 9)"
	"#(a b z d) sorted >>> #(a b d z)"
	
	^self sorted: [ :a :b| a <= b ]
]

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection >> sorted: aSortBlockOrNil [
	"Return a new sequenceable collection which contains the same elements as self but its 
elements are sorted by aSortBlockOrNil. The block should take two arguments and return true if 
the first element should preceed the second one. If aSortBlock is nil then <= is used for 
comparison."
	"(#(3 9 1) sorted: [:a :b | a <= b ]) >>> #(1 3 9)"
	"(#(3 9 1) sorted: [:a :b | a >= b ]) >>> #(9 3 1)"
	"(#(xa xc xz xb xy) sorted: #last ascending) >>> #(xa xb xc xy xz)"
	
	^self copy sort: aSortBlockOrNil
]

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection >> swap: oneIndex with: anotherIndex [ 
	"Move the element at oneIndex to anotherIndex, and vice-versa."
	"({#a. #b. #c. #d. #e} swap: 5 with: 1) >>> #(e b c d a)"

	| element |
	element := self at: oneIndex.
	self at: oneIndex put: (self at: anotherIndex).
	self at: anotherIndex put: element
]
