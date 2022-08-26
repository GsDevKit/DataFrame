Extension { #name : 'SequenceableCollection' }

{ #category : '*DataFrame-GemStone36-' }
SequenceableCollection >> swap: oneIndex with: anotherIndex [ 
	"Move the element at oneIndex to anotherIndex, and vice-versa."
	"({#a. #b. #c. #d. #e} swap: 5 with: 1) >>> #(e b c d a)"

	| element |
	element := self at: oneIndex.
	self at: oneIndex put: (self at: anotherIndex).
	self at: anotherIndex put: element
]
