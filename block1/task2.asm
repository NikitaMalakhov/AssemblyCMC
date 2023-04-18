include console.inc

.data
    T db "112 Malakhov Nikita. Block1. Task2. Prime"

    N dd ?

    NLIM dd ?

    Q db ?

.code
Start:
    ConsoleTitle offset T

    inint N, "Enter N: "

    mov ECX, 2

    mov EAX, N
    mov EDX, 0
    mov EBX, 2
    div EBX
    sub EAX, 1 ; or use DEC which doesn't touch the flags

    mov NLIM, EAX

B:
    mov EBX, ECX
    mov EAX, N
    mov EDX, 0
    div EBX


    cmp EDX, 0
    jE NONPRIME

    inc ECX

    cmp ECX, NLIM
    jNE B

PRIME:
    outwordln BL,,"PRIME"
    jmp EX
EX:
    exit

NONPRIME:
    outwordln BL,,"NONPRIME"
    jmp EX

end Start