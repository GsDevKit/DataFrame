Class {
	#name : 'TestCsvStrings',
	#superclass : 'Object',
	#category : 'DataFrame-IO-Tests'
}

{ #category : 'running' }
TestCsvStrings class >> commaCsvString [
	^ ',temperature,precipitation,type
01:10:00,2.4,true,rain
01:30:00,0.5,true,rain
01:50:00,-1.2,true,snow
02:10:00,-2.3,false,-
02:30:00,3.2,true,rain
'
]

{ #category : 'running' }
TestCsvStrings class >> commaQuoteCsvString [
	^ '"","temperature","precipitation","type"
"01:10:00","2.4","true","rain"
"01:30:00","0.5","true","rain"
"01:50:00","-1.2","true","snow"
"02:10:00","-2.3","false","-"
"02:30:00","3.2","true","rain"
'
]

{ #category : 'running' }
TestCsvStrings class >> emptyCsvString [
	^ ''
]

{ #category : 'running' }
TestCsvStrings class >> tabCsvString [
	^ '	temperature	precipitation	type
01:10:00	2.4	true	rain
01:30:00	0.5	true	rain
01:50:00	-1.2	true	snow
02:10:00	-2.3	false	-
02:30:00	3.2	true	rain
'
]

{ #category : 'running' }
TestCsvStrings class >> tabQuoteCsvString [
	^ '""	"temperature"	"precipitation"	"type"
"01:10:00"	"2.4"	"true"	"rain"
"01:30:00"	"0.5"	"true"	"rain"
"01:50:00"	"-1.2"	"true"	"snow"
"02:10:00"	"-2.3"	"false"	"-"
"02:30:00"	"3.2"	"true"	"rain"
'
]
