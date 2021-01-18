all: rasm

rasm: rasm_v0120.c
	$(CC) $< -s -O2 -lm -lrt -march=native -o $@
	cp rasm ../../bin
	rm -f rasm

clean:
	rm -f rasm

.PHONY: all clean

