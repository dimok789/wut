OUTPUT_FORMAT("elf32-powerpc")
OUTPUT_ARCH(powerpc:common)

ENTRY(_start)

MEMORY {
   system   (rwx) : ORIGIN = 0x01000000, LENGTH = 32M
   code     (rwx) : ORIGIN = 0x02000000, LENGTH = 224M
   data     (rw)  : ORIGIN = 0x10000000, LENGTH = 800M
}

SECTIONS {
   . = ORIGIN(code);

   .syscall ALIGN(32) : {
      *(.syscall)
   } > code

   .text ALIGN(32) : {
      *(.text .text.*)
   } > code

   .fimport_coreinit ALIGN(4) : {
      *(.fimport_coreinit)
   } > code

   .fimport_gx2 ALIGN(4) : {
      *(.fimport_gx2)
   } > code

   .fimport_nsysnet ALIGN(4) : {
      *(.fimport_nsysnet)
   } > code

   .fimport_proc_ui ALIGN(4) : {
      *(.fimport_proc_ui)
   } > code

   .fimport_sysapp ALIGN(4) : {
      *(.fimport_sysapp)
   } > code

   .fimport_vpad ALIGN(4) : {
      *(.fimport_vpad)
   } > code

   . = ORIGIN(data);

   .rodata ALIGN(4096) : {
      *(.rodata .rodata.*)
   } > data

   .data ALIGN(32) : {
      *(.data .data.*)
   } > data

   .bss ALIGN(32) : {
      *(.bss .bss.*)
   } > data

   .sdata ALIGN(32) : {
      *(.sdata .sdata.*)
   } > data

   .sdata2 ALIGN(32) : {
      *(.sdata2 .sdata2.*)
   } > data

   .sbss ALIGN(32) : {
      *(.sbss .sbss.*)
   } > data

   .sbss2 ALIGN(32) : {
      *(.sbss2 .sbss2.*)
   } > data

   /DISCARD/ : {
      *(.comment)
   }
}
