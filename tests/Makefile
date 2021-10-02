default:
	$(error Please use the Makefile from root directory)

include ../config.env
export $(shell sed 's/=.*//' ../config.env)

TESTS := $(wildcard test_*.py)

test:
	python3 -m unittest $(TESTS)

.PHONY: test default

