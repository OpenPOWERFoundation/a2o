/* this version puts kernel and bios at rom start

/* define format
INCLUDE output_format.ld */
OUTPUT_FORMAT("elf32-powerpc")

ENTRY(_start)

/* define origin, len of rom, ram, csr */
INCLUDE regions.ld

SECTIONS
{
   /* kernel code */
	.kernel :
	{
		/*_fkernel = .; */
      *crt0*(.text)
      KEEP(*crt0*(.text))
		*(.gnu.linkonce.t.*)
		_ekernel = .;
	} > rom

	.rodata :
	{
		. = ALIGN(8);
		_frodata = .;
		*(.rodata .rodata.* .gnu.linkonce.r.*)
		*(.rodata1)
		*(.got2 .got2.*)
		*(.toc .toc.*)
		FILL(0);
		. = ALIGN(8);
		_erodata = .;
	} > rom

   /* bios code */
   .bios :
   {
      . = ALIGN(32);
      bios.o (.text .text* .gnu.linkonce.t.*)
      . = ALIGN(4);
   } > rom

   /* kernel data to be copied to ram by rom code...*/
	.data :
	{
		. = ALIGN(8);
		_fdata = .;
		*(.data .data.* .sdata .gnu.linkonce.d.*)
		FILL(0);
		. = ALIGN(8);
		_edata = .;
	} > ram AT > rom

   /* tst */
   .arcitst :
   {
      . = ALIGN(32);
      arcitst.o (.text .text* .gnu.linkonce.t.*)
      . = ALIGN(4);
   } > rom

	.bss :
	{
		. = 0x0000C000; /*relative to start of ram! ALIGN(16384*4);*/
		_fbss = .;
		*(.dynsbss)
		*(.sbss .sbss.* .gnu.linkonce.sb.*)
		*(.scommon)
		*(.dynbss)
		*(.bss .bss.* .gnu.linkonce.b.*)
		*(COMMON)
		. = ALIGN(8);
		_ebss = .;
		_end = .;
	} > ram

	/DISCARD/ :
	{
		*(.eh_frame)
		*(.comment)
      *(.gnu.attributes)
	}

}

PROVIDE(_stack_size = 0x00010000);
PROVIDE(_stack_0 = ORIGIN(ram) + LENGTH(ram) - 8);
PROVIDE(_stack_1 = _stack_0 - _stack_size);

PROVIDE(_fdata_rom = LOADADDR(.data));
PROVIDE(_edata_rom = LOADADDR(.data) + SIZEOF(.data));
PROVIDE(_bios_start = LOADADDR(.bios));
