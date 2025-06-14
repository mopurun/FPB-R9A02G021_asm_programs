
#define PCNTR1_1 ((volatile unsigned long*)(0x40040020))


int main(void);
void delay(int value);

__attribute__ ((section("vector_table")))
void (*const vector_table2[])(void) = {
    (void(*)(void))0x20000137,
    (void(*)(void))0x70010113,
    (void(*)(void))0x200001b7,
    (void(*)(void))0x50018193
};


int main(void){

    while(1){
        *PCNTR1_1 = 0x00810001;
        delay(10000);
        *PCNTR1_1 = 0x00810080;
        delay(10000);
    }

    return 0;
}

void delay(int value){
    for(int i = 0; i < value ; i++){
        asm volatile("nop");
    }
}