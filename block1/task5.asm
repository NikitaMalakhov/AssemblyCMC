include console.inc


.data
    T db "112 Malakhov Nikita. Block1. Task5. Lowest and highest digit"

    N dd ?

    LO db ? ; lowest digit
    HI db ? ; highest digit

.code

Start:
    ConsoleTitle offset T
    inint N, "N = "

    mov EAX, N ; Preparing for dividing
    mov EDX, 0
    mov EBX, 10

    div EBX ; (EDX, EAX) - mod, div

    ; Work the case with N < 10.

    mov LO, DL
    mov HI, DL

    cmp EAX, 0
    jE EX

B:
    mov EDX, 0
    div EBX

    mov HI, DL
    cmp EAX, 0
    jNE B

EX:
    mov AL, LO
    mul HI

    movzx EAX, AX
    outint EAX,,"Result = "

    pause
    exit


end Start