include console.inc

.data
    T db "112 Malakhov Nikita. Block1. Task8. Calculate sequence"
    S dd ?
    ENCD dd '0'
.code

Start:
    ConsoleTitle offset T

    mov EAX, 0
    mov ECX, 0
    mov EBX, 0

    inchar CL, "Enter sequence: "

    sub ECX, ENCD ; Got digit

    add EAX, ECX

B:
    inchar BL ; SIGN

    cmp Bl, '.'
    jE EX

    cmp BL, '+'
    jE ADDING

    cmp BL, '-'
    jE SUBTRACT

ADDING:
    inchar CL
    sub ECX, ENCD
    add EAX, ECX
    jmp B

SUBTRACT:
    inchar CL
    sub ECX, ENCD
    sub EAX, ECX
    jmp B

EX:
    outwordln EAX,,"Sum = "
    pause
    exit

end Start