all: libs

libs: ubox spman mplayer

game: libs bin/game.rom

bin/game.rom:
	mkdir -p ./bin
	make -C tools
	make -C game

docs:
	make -C docs

ubox:
	mkdir -p lib
	make -C src/ubox

spman:
	mkdir -p lib
	make -C src/spman

mplayer:
	mkdir -p lib
	make -C src/mplayer

.PHONY: clean docs ubox libs bin/game.rom
clean:
	rm -rf ./bin
	make -C src/ubox clean
	make -C src/spman clean
	make -C src/mplayer clean
	make -C docs clean
	make -C game clean

