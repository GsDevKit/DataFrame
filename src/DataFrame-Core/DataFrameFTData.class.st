Class {
	#name : #DataFrameFTData,
	#superclass : #FTSimpleDataSource,
	#category : #'DataFrame-Core'
}

{ #category : #accessing }
DataFrameFTData >> cellColumn: column row: rowNumber [
	
	| columnNumber |
	
	column id = '#'
		ifTrue: [ ^ FTCellMorph new addMorph: (elements rowNames at: rowNumber) asMorph ].
		
	columnNumber := elements columnNames indexOf: column id.
	
	^ FTCellMorph new
		addMorph: (elements at: rowNumber at: columnNumber) asMorph.
]

{ #category : #accessing }
DataFrameFTData >> numberOfRows [

	^ elements numberOfRows
]
