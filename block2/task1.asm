include console.inc


.data
    T db "112 Malakhov Nikita. Block2. Task1"

    LAT db 'Z' - 'A' + 1 dup(0)
    C db ?
.code
Start:
    ConsoleTitle offset T

    mov EAX, 0
    mov C, 0
LStart:
    mov ECX, 0
LBody:
    inchar AL
    cmp EAX, '.'
    jE LEnd
    mov C, AL
    sub EAX, 'A'
    cmp LAT[EAX], 0
    jNE ByPass
Print:
    outchar C
    mov LAT[EAX], 1
ByPass:
    jmp LBody
LEnd:
    jmp EX
EX:
    pause
    exit

end Start

; PS C:\masm32\2sem\block2> .\task1.exe
; BABCDBADEBFA.
; BACDEF
; PS C:\masm32\2sem\block2>