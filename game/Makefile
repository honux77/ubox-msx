all:
	mkdir -p ./generated ./bin ./build
	make -C data
	cd src && ../../tools/mkdeps.py -b ../build -I ../generated:../../include ./ Makefile.deps
	make -C src

.PHONY: all clean
clean:
	rm -rf ./generated ./bin ./build
	make -C src clean
	make -C data clean

