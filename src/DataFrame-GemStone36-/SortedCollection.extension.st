Extension { #name : 'SortedCollection' }

{ #category : '*DataFrame-GemStone36-' }
SortedCollection >> intersection: aCollection [
	^ (self class sortBlock: sortBlock)
		addAll: (self asSet intersection: aCollection);
		yourself.
]

{ #category : '*DataFrame-GemStone36-' }
SortedCollection >> median [
	"Return the middle element, or as close as we can get."
	"{1 . 2 . 3 . 4 . 5} asSortedCollection  median >>> 3"
	
	| size middle |
 	size := self size.
 	middle := (size + 1) // 2.
 	^ size even
			ifTrue: [ ((self at: middle) + (self at: middle + 1)) / 2 ]
			ifFalse: [ self at: middle ]
]
