Class {
	#name : 'DataFrameTypeDetectorTest',
	#superclass : 'TestCase',
	#instVars : [
		'detector'
	],
	#category : 'DataFrame-Type-Tests'
}

{ #category : 'running' }
DataFrameTypeDetectorTest >> setUp [
	super setUp.
	detector := DataFrameTypeDetector new.
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testBooleanColumn [
	| column expected actual |
	column := #('true' 'false' 'true' 'true') asDataSeries.
	expected := #(true false true true) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testBooleanColumnWithNils [
	| column expected actual |
	column := #('true' 'false' 'true' nil) asDataSeries.
	expected := #(true false true nil) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testBooleanColumnWithNilsMixedCase [
	| column expected actual |
	column := #('TRUE' 'False' 'true' nil) asDataSeries.
	expected := #(true false true nil) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testBooleanColumnWithNumbers [
	"Make sure that our boolean type detector doesn't return true for numbers"
	| column expected actual |
	column := #(1 2 3 4 5) asDataSeries.
	expected := false.
	actual := detector canAllBeBoolean: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testBooleanColumnWithStrings [
	"Make sure that our boolean type detector doesn't return true for strings that aren't true or false"
	| column expected actual |
	column := #('this' 'should' 'be' 'false') asDataSeries.
	expected := false.
	actual := detector canAllBeBoolean: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testColumnAllNils [
	| column expected actual |
	column := #(nil nil nil nil) asDataSeries.
	expected := #(nil nil nil nil) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testDateAndTimeColumn [
	| column expected actual |
"GemStone/S allows only YYYY-MM-DDTHH:MM:SS+HH:MM for DateAndTimes.
	column := #('18 March 1996 1:10' '6 March 1996 2:30 am' '12 March 2019 14:24 am' '9 February 2019 00:00 am') asDataSeries.
	expected := (#('1996-03-18T01:10:00' '1996-03-06T02:30:00' '2019-03-12T14:24:00' '2019-02-09T00:00:00') collect: #asDateAndTime) asDataSeries.
"	column := #('1996-03-18T01:10:00' '1996-03-06T02:30:00' '2019-03-12T14:24:00' '2019-02-09T00:00:00') asDataSeries.
	expected := (#('1996-03-18T01:10:00' '1996-03-06T02:30:00' '2019-03-12T14:24:00' '2019-02-09T00:00:00') collect: #asDateAndTime) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testDateAndTimeColumnWithNils [
	| column expected actual |
"GemStone/S allows only YYYY-MM-DDTHH:MM:SS+HH:MM for DateAndTimes.
	column := #(nil '6 March 1996 2:30 am' '12 March 2019 14:24 am' nil) asDataSeries.
	expected := { nil. '1996-03-06T02:30:00' asDateAndTime. '2019-03-12T14:24:00' asDateAndTime. nil} asDataSeries.
"	column := #(nil '1996-03-06T02:30:00' '2019-03-12T14:24:00' nil) asDataSeries.
	expected := { nil. '1996-03-06T02:30:00' asDateAndTime. '2019-03-12T14:24:00' asDateAndTime. nil} asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testFloatColumn [
	| column expected actual |
	column := #('1.2' '3.3' '-10.1' '0.0') asDataSeries.
	expected := #(1.2 3.3 -10.1 0.0) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testFloatColumnWithNils [
	| column expected actual |
	column := #('1.2' nil '-10.1' '0.0') asDataSeries.
	expected := #(1.2 nil -10.1 0.0) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testIntegerColumn [
	| column expected actual |
	column := #('1' '3' '-10' '0') asDataSeries.
	expected := #(1 3 -10 0) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testIntegerColumnWithNils [
	| column expected actual |
	column := #('1' '3' '-10' nil) asDataSeries.
	expected := #(1 3 -10 nil) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testMixedNumberColumn [
	| column expected actual |
	column := #('1' '3.3' '-10' '0') asDataSeries.
	expected := #(1.0 3.3 -10.0 0.0) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testMixedNumberColumnWithNils [
	| column expected actual |
	column := #(nil '3.3' nil '0') asDataSeries.
	expected := #(nil 3.3 nil 0.0) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testStringColumn [
	| column actual |
	column := #('lorem' 'ipsum' 'dolor' 'sit') asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: column
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testStringColumnWithNils [
	| column actual |
	column := #(nil 'ipsum' 'dolor' 'sit') asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: column
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testTimeColumn [
	| column expected actual |
"GemStone/S allows only HH:MM:SS for times.
	column := #('1:10' '2:30' '14:24' '00:00') asDataSeries.
	expected := (#('1:10 am' '2:30 am' '14:24 am' '00:00 am') collect: #asTime) asDataSeries.
"	column := #('01:10:00' '02:30:00' '14:24:00' '00:00:00') asDataSeries.
	expected := (#('01:10:00' '02:30:00' '14:24:00' '00:00:00') collect: #asTime) asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]

{ #category : 'tests' }
DataFrameTypeDetectorTest >> testTimeColumnWithNils [
	| column expected actual |
"GemStone/S allows only HH:MM:SS for times.
	column := #('1:10' nil '14:24' nil) asDataSeries.
	expected := {'1:10 am' asTime. nil. '14:24 am' asTime. nil} asDataSeries.
"	column := #('01:10:00' nil '14:24:00' nil) asDataSeries.
	expected := {'01:10:00' asTime. nil. '14:24:00' asTime. nil} asDataSeries.
	actual := detector detectColumnTypeAndConvert: column.
	self assert: actual equals: expected
]
