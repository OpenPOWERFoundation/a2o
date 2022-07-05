#

```
powerpc-linux-gnu-as -a64 -mbig-endian -ma2 boot.s -ahlnd -o boot.o > boot.lst
powerpc-linux-gnu-objdump -d boot.o > boot.d

# creat binary
powerpc-linux-gnu-objcopy -O binary boot.o boot.bin

# create ascii hex
../bin/bin2init boot.bin

```