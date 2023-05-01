include console.inc

.data
    T db "112 Malakhov Nikita. Block1. Task1"
    K db ?
    N dd ?
    Q db 3
.code
Start:
    ConsoleTitle offset T
    inint N, "Enter N: "
    mov ECX, 0
    mov EAX, N
M:
    cmp EAX, 1
    je E
    mov EBX, 3
    mov EDX, 0
    div EBX
    cmp EDX, 0
    jne I
    mov EDX, 0
    inc ECX
    jmp M
E:
    outintln ECX,,"power = "
    pause
    exit
I:
    mov ECX, -1
    jmp E
end Start