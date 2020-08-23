<h1 align="center">:desktop_computer: x86 Assembly :desktop_computer:</h1>

<div align="center">
    Some simple examples written in x86 assembly
</div>

## Contents
- [Prerequisites](#prerequisites)
- [Programs](#programs)
- [Building](#building)

## Prerequisites
- [NASM](https://nasm.us/)
- [gcc](https://gcc.gnu.org/)
- [make](https://www.gnu.org/software/make/)

## Programs

Some examples of the programs are:

- Basics - [counting](src/basics/count.asm), [hello world](src/basics/helloworld.asm), [subroutines](src/basics/helloworld-len-subrountines.asm), [input](src/basics/input.asm), [more](src/basics/)
- Maths - [addition](src/maths/addition.asm), [subtraction](src/maths/subtraction.asm), [multiplication](src/maths/multiplication.asm), [division](src/maths/division.asm)
- System - [execute](src/system/execute.asm), [file-read-write](src/system/file-r-w-close.asm), [fork](src/system/fork.asm), [fork-bomb](src/system/fork-bomb.asm), [time](src/system/time.asm)
- Network - [sockets](src/network/socket.asm), [http-request](src/network/http.asm)
- Misc - [fizzbuzz](src/misc/fizzbuzz.asm), [namespaces](src/misc/namespace.asm), [hex-reversal](src/misc/reverse.c)


## Building
To compile all binaries (outputs to out/):
```sh
$ make
```

To compile an individual binary from ASM:
```sh
$ nasm -f elf example.asm -o example.o
$ ld -m elf_i386 example.o -o example
```

To compile an individual binary from C:
```sh
$ gcc example.c -o example
```

## Running
After running `make` you can find all of the binaries in the `out/` dir
```sh
[x86-assembly/out]$ helloworld
```
