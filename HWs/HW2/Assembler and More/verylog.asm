.data
        BEGINMEM:0x0000
        ENDMEM:0x01ff
        KEYPAD:0x0900
        STATUSREG:0x0901
        SEVENSEG:0x0b00
        STAR:0xe
        SQUARE:0xf
.code
        ldi 3 0x0b00
        ldi 0 0x0
        ldi 6 0x0
readkey ldi 4 1
        ldi 2 0x0901
        ld 2 2
        and 2 2 4
        jz readkey
        ldi 1 0x0900
        ld 1 1
        ldi 5 0xb 
        sub 2 5 1
        jz cmultlb
        ldi 5 0xc 
        sub 2 5 1
        jz caddlb
        # call incr
        mov 6 1
        st 3 6
        jmp readkey
cmultlb	call mult
        st 3 0
        ldi 6 0x0
        jmp readkey
caddlb	call addit
        jmp readkey
addit   add 0 0 6
        st 3 0
        ldi 6 0x0  # 2 # 3 * 5
        ret
incr    push 0 
        ldi 0 10
        call mult
        add 0 0 1
        st 3 0
        mov 6 0
        pop 0
        ret
mult    mov 5 6  # 5=1
        mov 6 0 # 6 = 0
        ldi 0 0x0
        ldi 2 1
loop1   and 2 2 5 
        jz disp
        add 0 0 6
        dec 5
        jmp loop1
disp    ret
