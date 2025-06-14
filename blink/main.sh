cd $(dirname $0) 
/opt/riscv/bin/riscv64-unknown-linux-gnu-as -march=rv32ima_zicsr -o hello.out hello.asm
/opt/riscv/bin/riscv64-unknown-linux-gnu-objcopy -O binary hello.out hello.bin
/opt/riscv/bin/riscv64-unknown-linux-gnu-objcopy -O ihex hello.out hello.hex

