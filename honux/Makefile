all: hello console timer libc music sound snake sokoban copy

MSX := /mnt/d/MSX/roms
export PATH := $(PWD)/../bin:$(PATH)
	
hello: bin	
	make -C 01_hello
	
console: bin
	make -C 02_consolehello
	
timer: bin	
	make -C 03_timer

libc: bin	
	make -C 04_clibrary

music: bin	
	make -C 05_music

sound: bin	
	make -C 06_sound

snake: bin	
	make -C 07_snakebyte	

sokoban: bin	
	make -C 08_socoban

tetris: bin	
	make -C 09_tetris
	
breakout: bin	
	make -C 10_breakout
	
log: bin	
	make -C 11_log

debugger: bin	
	make -C 12_debugger

.PHONY: clean cleanall 01_hello 02_consolehello 03_timer 04_clibrary 05_music 06_sound 07_snakebyte 08_socoban 09_tetris 10_breakout 11_log 12_debugger
clean:
	make -C 01_hello clean
	make -C 02_consolehello clean
	make -C 03_timer clean
	make -C 04_clibrary clean
	make -C 05_music clean
	make -C 06_sound clean
	make -C 07_snakebyte clean
	make -C 08_socoban clean
	make -C 09_tetris clean
	make -C 10_breakout clean

bin:
	mkdir -p ./bin

cleanall: clean
	rm -rf ./bin

copy: bin
	cp bin/* $(MSX)