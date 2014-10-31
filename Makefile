SHELL := /bin/bash

LOLFILES := $(wildcard *.lol)
LOLPROBLEMS := $(patsubst %.lol,%,$(LOLFILES))
LOLDO = $(shell lci "$@.lol" | shasum -a 256 | cut -d ' ' -f 1)
LOLSOLUTION = $(shell grep --basic-regexp "$@\W" solutions.tsv | cut -f 2)

%: %.lol
	@echo -n "Testing problem $@... "
	@if [ "$(LOLDO)" = "$(LOLSOLUTION)" ]; then \
		echo "[OK]"; \
	else \
		echo "[WRONG]"; exit 1; \
	fi

tests: $(LOLPROBLEMS)
	@echo "All tests ran successfully."
