all:
	mkdir -p ./generated ./bin ./build
	make -C data
	cd src && rm -f Makefile.deps && touch Makefile.deps && find . -name "*.c" | xargs -n1 sdcc -I../generated -I../../include -MM | sed -r 's/([^:]+):/..\/build\/\1:/' >> Makefile.deps
	make -C src

.PHONY: all clean
clean:
	rm -rf ./generated ./bin ./build
	make -C src clean
	make -C data clean

