BIN=../bin/hex2bin ../bin/rasm

all: $(BIN)

../bin/hex2bin:
	mkdir -p hex2bin-2.0/bin
	make -C hex2bin-2.0
	cp hex2bin-2.0/bin/hex2bin ../bin
	make -C hex2bin-2.0 cleanall

../bin/rasm:
	make -C rasm

.PHONY: all clean
clean:
	make -C hex2bin-2.0 cleanall
	make -C rasm clean
