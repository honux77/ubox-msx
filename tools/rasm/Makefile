all: rasm

CC := gcc

ifdef ($(OS),Windows_NT)
    TARGET := rasm.exe
    LDFLAGS := -lrtm
else
    TARGET := rasm
    LDFLAGS := -lm -lrt
endif

rasm: rasm_v0120.c
	$(CC) $< -s -O2 $(LDFLAGS) -march=native -o $@
	cp $(TARGET) ../../bin
	rm -f $(TARGET)

clean:
	rm -f $(TARGET)

.PHONY: all clean

