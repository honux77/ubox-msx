all: libs

libs: lib ubox spman mplayer

game: bin libs bin/game.rom

bin/game.rom:
	make -C tools
	make -C game

docs:
	make -C docs

ubox:
	make -C src/ubox

spman:
	make -C src/spman

mplayer:
	make -C src/mplayer

.PHONY: clean cleanall docs ubox libs bin/game.rom
clean:
	rm -f ./bin/game.rom
	make -C src/ubox clean
	make -C src/spman clean
	make -C src/mplayer clean
	make -C game clean

lib:
	mkdir -p ./lib

bin:
	mkdir -p ./bin

cleanall: clean
	rm -rf ./bin ./lib
	make -C docs clean

