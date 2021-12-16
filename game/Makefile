default:
	$(error Please use the Makefile from root directory)

all: generated bin build
	make -C data
	cd src && ../../tools/mkdeps.py -b ../build -I ../generated:../../include ./ Makefile.deps
	make -C src all

generated:
	mkdir -p ./generated

bin:
	mkdir -p ./bin

build:
	mkdir -p ./build

openmsx: all
	make -C src openmsx

.PHONY: all clean default
clean:
	rm -rf ./generated ./bin ./build
	make -C src clean
	make -C data clean

