SECTIONS
{
    . = 0x00000000; 

    .text : {
        *(vector_table)
        *(.text)
    }

    .data : {
        *(.data)
    }

    .bss : {
        *(.bss)
    }
}
