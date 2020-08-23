CC = nasm
NASMFLAGS = -f elf
LDFLAGS = -m elf_i386

BASICS = count.asm count-ascii.asm helloworld.asm helloworld-args.asm helloworld-inc.asm helloworld-len.asm helloworld-len-subroutines.asm helloworld-lf.asm input.asm
MATHS = addition.asm division.asm multiplication.asm subtraction.asm
MISC = fizzbuzz.asm namespace.asm
SYSTEM = execute.asm file-delete.asm file-r-w-close.asm file-read.asm file-seek.asm file-write.asm fork.asm fork-bomb.asm time.asm
NETWORK = http.asm socket.asm reverse.c

ALL = $(BASICS) $(MATHS) $(MISC) $(SYSTEM) $(NETWORK)

all: $(ALL)

.PHONY: clean

clean:
	rm -r out/

$(BASICS): %.asm:
	@mkdir -p out
	@$(CC) $(NASMFLAGS) src/basics/$@ -o out/$*.o
	@ld $(LDFLAGS) out/$*.o -o out/$*
	@rm out/$*.o

$(MATHS): %.asm:
	@$(CC) $(NASMFLAGS) src/maths/$@ -o out/$*.o
	@ld $(LDFLAGS) out/$*.o -o out/$*
	@rm out/$*.o

$(MISC): %.asm:
	@$(CC) $(NASMFLAGS) src/misc/$@ -o out/$*.o
	@ld $(LDFLAGS) out/$*.o -o out/$*
	@rm out/$*.o

$(SYSTEM): %.asm:
	@$(CC) $(NASMFLAGS) src/system/$@ -o out/$*.o
	@ld $(LDFLAGS) out/$*.o -o out/$*
	@rm out/$*.o

$(filter %.asm,$(NETWORK)): %.asm:
	@$(CC) $(NASMFLAGS) src/network/$@ -o out/$*.o
	@ld $(LDFLAGS) out/$*.o -o out/$*
	@rm out/$*.o
$(filter %.c,$(NETWORK)): %.c:
	@gcc src/network/$@ -o out/$*