Extension { #name : 'Interval' }

{ #category : '*DataFrame-GemStone36-' }
Interval >> sorted [
	^ self increment >= 0
		ifTrue: [ self copy ]
		ifFalse: [ self last to: self first by: self increment negated ]
]

{ #category : '*DataFrame-GemStone36-' }
Interval >> sorted: aSortBlockOrNil [
	"Return a new sequenceable collection which contains the same elements as self but its elements are sorted by aSortBlockOrNil. The block should take two arguments and return true if the first element should preceed the second one. If aSortBlock is nil then <= is used for comparison. We convert the interval to an array because intervals can't be changed."
	
	^self asArray sort: aSortBlockOrNil
]
