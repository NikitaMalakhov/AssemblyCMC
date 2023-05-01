include console.inc


.data
    T db "112 Malakhov Nikita. Block1. Task4. Division"

    P dd ?
    Q dd ?

    E dd ?

.code

Start:
    ConsoleTitle offset T

    inint P, "P="
    inint Q, "Q="

    mov EAX, P
    mov EDX, 0
    mov EBX, Q

    div EBX

    mov E, 10

    outword EAX ; integer part
    outchar '.'

    mov ECX, 5

B:
    mov EAX, EDX
    mul E

    div EBX

    outword EAX

    dec ECX

    cmp ECX, 0
    jNE B

EX:
    pause
    exit

end Start