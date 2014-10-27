SHELL := /bin/bash

test:
	while read line
	do
		problem=$(echo $line | cut -d ',' -f 1)
		echo $problem
	done < solutions.csv
