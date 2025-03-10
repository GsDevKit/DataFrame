Class {
	#name : #BaselineOfDataFrame,
	#superclass : #BaselineOf,
	#category : #BaselineOfDataFrame
}

{ #category : #baselines }
BaselineOfDataFrame >> baseline: spec [
	<baseline>
	spec for: #common do: [	
		"External dependencies"
		spec
			baseline: 'NeoCSV'
			with: [ spec repository: 'github://svenvc/NeoCSV/repository' ].
		spec
			baseline: 'NeoJSON'
			with: [ spec repository: 'github://svenvc/NeoJSON/repository' ].
				
		"Packages"
		spec 
			package: 'DataFrame-Core';
			package: 'DataFrame-Tests' with: [ spec requires: #('DataFrame-Core') ];
			package: 'DataFrame-Type' with: [ spec requires: #('DataFrame-Core') ];
			package: 'DataFrame-Type-Tests' with: [ spec requires: #('DataFrame-Type') ];
			package: 'DataFrame-IO' with: [ spec requires: #('DataFrame-Core' 'DataFrame-Type' 'NeoCSV' 'NeoJSON') ];
			package: 'DataFrame-IO-Tests' with: [ spec requires: #('DataFrame-IO') ];
			package: 'DataFrame-Math';
			package: 'DataFrame-Math-Tests' with: [ spec requires: #('DataFrame-Math') ] ].
		
		spec
			for: #'pharo7.x'
			do: [
				spec
					package: 'DataFrame-Pharo67' ].
		
		spec
			for: #'pharo6.x'
			do: [
				spec
					package: 'DataFrame-Pharo6';
					package: 'DataFrame-Pharo67' ].
]
