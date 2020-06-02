# PC/AT BIOS fiddlings

This is me fiddling with BIOS routines as described in "IBM Personal Computer
Hardware Reference Library - Technical Reference".

The goal is to familiarize myself with the platform for eventual inclusion in
Collapse OS.

This asm source is compiled with nasm and ran through qemu.

Credits to [Eugene Obrezkov][eugene] for jump-starting me.

## Dependencies

* nasm
* qemu

## Build & run

Run `make run` to run the thing through qemu

[eugene]: https://blog.ghaiklor.com/2017/10/21/how-to-implement-your-own-hello-world-boot-loader/
