Extension { #name : 'DataFrame' }

{ #category : '*DataFrame-Core-Pharo9-' }
DataFrame >> gtInspectorFastTableIn: composite [
	<gtInspectorPresentationOrder: 0>
	<gtInspectorTag: #basic>
	
	composite morph
		title: 'Fast Table';
		display: [ self showWithGlamourIn: composite ].

]

{ #category : '*DataFrame-Core-Pharo9-' }
DataFrame >> gtInspectorItemsIn: composite [
"Hide Items from inspector"

	composite fastTable
		when: [ false ].

]

{ #category : '*DataFrame-Core-Pharo9-' }
DataFrame >> showWithGlamourIn: composite [
	| table headerNames |
	table := FTTableMorph new.
	"extent: 650@500"
	table
		beResizable;
		intercellSpacing: 1;
		dataSource: (DataFrameFTData elements: self);
		onAnnouncement: FTSelectionChanged
			do: [ :ann | (self rowAt: ann newSelectedIndexes first) inspect ].

	"		onAnnouncement: FTSelectionChanged 
			do: [ :ann | (self rowsAt: ann newSelectedRowIndexes) gtInspectorItemsIn: composite ];"
	headerNames := #('#') , self columnNames.
	table
		columns: (headerNames collect: [ :name | (FTColumn id: name) width: 100 ]).
	^ table

]
