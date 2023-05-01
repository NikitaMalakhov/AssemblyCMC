include console.inc
.data
    T db "112 Malakhov Nikita. Block2. Task7",0
    N equ 10 ; предельный размер рабочего массива для хранения введённых элементов
    X dd N dup(?) ; числа без знака
.code
Start:
    mov EAX, 0
LInputStart:
    mov ECX, 0
LInputBody:
    inint EAX
    mov X[ECX * 4], EAX
    inc ECX
    cmp ECX, N
    jE LStart
    jmp LInputBody
LStart:
    mov ECX, 0
    mov EDX, 0 ; counter for transpositions
LBody:
    mov EAX, X[ECX*4]
    mov EBX, X[ECX*4 + 4]
    cmp EAX, EBX
    jLE NORM
TR:
    inc EDX
    mov X[ECX*4 + 4], EAX
    mov X[ECX*4], EBX
NORM:
    inc ECX
    cmp ECX, N - 1
    jE LEnd
    jmp LBody
LEnd:
    cmp EDX, 0
    jE Ex
    jmp LStart
Ex:
    mov ECX, 0
print:
    outint X[ECX*4]
    outchar ' '
    inc ECX
    cmp ECX, N
    jE AF
    jmp print
AF:
    pause
    exit
end Start