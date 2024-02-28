# SOLO SE USATE IL CONTAINER DOCKER
Primo comando da eseguire
nasm -f elf32 sum.asm
32 in quanto siamo a 32bit

Il comando magico per far eseguire al GNU linker come se ci trovassimo in ambiente intel x86 
ld -m elf_i386 -s -o file file.o

La chiave è utilizzare elf_i386
