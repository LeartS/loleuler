SHELL := /bin/bash

test: 
	while read line; do \
		read problem solution <<< $$line; \
		echo -n "Testing problem $${problem}... "; \
		outsum=$$(lci "$${problem}.lol" | shasum -a 256 | cut -d ' ' -f 1); \
		if [ "$$outsum" == "$$solution" ]; then echo "[OK]"; \
		                                   else echo "[WRONG]"; exit 1; \
		fi \
	done < solutions.csv
