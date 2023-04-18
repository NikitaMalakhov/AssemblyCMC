include console.inc


.data
    T db "112 Malakhov Nikita. Block1. Task7. Closes dividable by 7"
    N dd ?
.code
Start:
    ConsoleTitle offset T

    inint EAX, "Enter number: "
    mov N, EAX
    mov EDX, 0
    mov EBX, 7 ; Preparing division

    div EBX

    mov EAX, N
    cmp EDX, 4
    jGE B
    sub EAX, EDX
    jmp EX

B:
    sub EBX, EDX ; 7 - edx
    add EAX, EBX ; closest number dividable by 7

EX:
    outwordln EAX,,"Closest integer dividable by 7: "
    pause
    exit

end Start