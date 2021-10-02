default:
	$(error Please use the Makefile from root directory)

TESTS := $(wildcard test_*.py)

test:
	python3 -m unittest $(TESTS)

.PHONY: test default

