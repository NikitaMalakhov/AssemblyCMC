include console.inc

.data
    N equ 30 ; предельный размер рабочего массива для хранения введённых символов
    S db N dup(?) ; S[0..N-1] – рабочий массив

.code
Start:
    mov EAX, 0
    mov EBX, 0
    mov EDX, 0
LStart:
    mov ECX, 0
LBody:
    mov EAX, 0
    inchar AL
    ; ----------
    cmp EAX, '.'
    jE Ex
    ; ----------
    ; ----------
    cmp EAX, '_'
    jE LBody
    ; ----------
    mov EBX, EAX
    sub EAX, 'a'
    cmp EAX, 0
    jGE OK
TR:
    mov EAX, EBX
    sub EAX, 'A'
OK:
    mov S[ECX], AL
    inc ECX
    jmp LBody

Ex:
    dec ECX
    mov EAX, N
    mov EBX, 2
    div EBX
    inc EAX
    mov ESI, EAX
    mov EBX, 0
    mov EDX, 0
LEx:
    mov AL, S[ECX]
    mov BL, S[EDX]
    cmp AL, BL
    jNE NOTPAL
    cmp EDX, ESI
    jE PAL
    dec ECX
    inc EDX
    jmp LEx
NOTPAL:
    outstrln 'NOT PALINDROM'
    pause
    exit
PAL:
    outstrln 'PALINDROM'
    pause
    exit
end Start