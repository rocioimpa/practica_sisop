#!/bin/bash

fecha=$( echo $1 | grep '^[0-9]\{4\}\-\(\(0[1-9]\|((1[0-2])))\-((0[1-9])|(1[0-9])|((2[0-9]))|((3[0-1])))' ) # Validamos la fecha
echo $fecha


var=$( echo $1 | grep '^[0-9]\{4\}\-\(\(02-\(2[0-8]\|[0-1][0-9]\)\)\|\(11-\(30\|[0-2][0-9]\)\)\|\(0[469]-\(30\|[0-2][0-9]\)\)\|\(12-\(31\|30\|[0-2][0-9]\)\)\|\(10-\(31\|30\|[0-2][0-9]\)\)\|\(0[13578]-\(31\|30\|[0-2][0-9]\)\)\)' )
echo $var