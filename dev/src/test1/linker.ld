/* hacked version of litex */

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

   /* kernel data to be copied to ram by rom code...*/
	.data :
	{
		. = ALIGN(8);
		_fdata = .;
		*(.data .data.* .gnu.linkonce.d.*)
		FILL(0);
		. = ALIGN(8);
		_edata = .;
	} > ram AT > rom

   /* test code */
   .test :
   {
      . = ALIGN(4);
      *test.o (.text .text* .gnu.linkonce.t.*)
      . = ALIGN(4);
   } > ram

	.bss :
	{
		. = ALIGN(8);
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
PROVIDE(_stack_0 = ORIGIN(ram) + LENGTH(ram) - 4);
PROVIDE(_stack_1 = _stack_0 - _stack_size);

PROVIDE(_fdata_rom = LOADADDR(.data));
PROVIDE(_edata_rom = LOADADDR(.data) + SIZEOF(.data));
PROVIDE(_test_start = LOADADDR(.test));
