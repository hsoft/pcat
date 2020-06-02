TARGET = boot.bin

.PHONY: all
all: $(TARGET)

$(TARGET): boot.asm
	nasm boot.asm -f bin -o $@

.PHONY: run
run: $(TARGET)
	qemu-system-i386 -fda $(TARGET)
