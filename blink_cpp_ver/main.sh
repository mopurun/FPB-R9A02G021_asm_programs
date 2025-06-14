cd $(dirname $0) 
/opt/rv32ec/bin/riscv32-unknown-linux-gnu-gcc -march=rv32ec -o hello.out -nostdlib -T linker.ld main.c
/opt/rv32ec/bin/riscv32-unknown-linux-gnu-objcopy -O binary hello.out hello.bin
/opt/rv32ec/bin/riscv32-unknown-linux-gnu-objcopy -O ihex hello.out hello.hex
/opt/rv32ec/bin/riscv32-unknown-linux-gnu-objdump -D hello.out > objdump.txt
