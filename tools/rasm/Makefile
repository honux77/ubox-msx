all: rasm

rasm: rasm_v0120.c
	gcc -s -O2 $< -o $@ -lm -lrt -march=native
	cp rasm ../../bin
	rm -f rasm

clean:
	rm -f rasm

.PHONY: all clean

