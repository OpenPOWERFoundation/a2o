/* simple loader of kernel only */

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
}

PROVIDE(_stack_size = 0x00010000);
PROVIDE(_stack_0 = ORIGIN(ram) + LENGTH(ram) - 4);
PROVIDE(_stack_1 = _stack_0 - _stack_size);

PROVIDE(_fdata_rom = LOADADDR(.data));
PROVIDE(_edata_rom = LOADADDR(.data) + SIZEOF(.data));
PROVIDE(_test_start = ORIGIN(ram));
