include console.inc



.data
    T db "Malakhov Nikita 112. Block 2. Task 4"
    S db 11 dup(0), 0

.code

Start:
    ConsoleTitle offset T
    inint EAX
    cmp EAX, 0

    jGE Positive

Negative:
    outchar '-'
    neg EAX
    mov ECX, 10 ; Setting up loop
    mov EBX, 10 ; prepairing for division
    mov EDX, 0
    jmp LBody

Positive:
    mov ECX, 10
    mov EBX, 10
    mov EDX, 0
LBody:
    mov EDX, 0
    div EBX
    mov S[ECX], DL ; place remainder on memory

    dec ECX

    cmp EAX, 0 ; no digits to translate
    jE LEx
    cmp ECX, 0
    jE LEx

    jmp LBody

LEx:
    outword S[ECX + 1] 
    inc ECX
    cmp ECX, 10
    jE Ex
    jmp LEx
Ex:
    pause
    exit
end Start