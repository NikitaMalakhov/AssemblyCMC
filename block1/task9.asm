include console.inc


.data
    T db "112 Malakhov Nikita. Block1. Task4. Division"

.code
    ConsoleTitle offset T

; Let's define structure of outer and inner loops
; OLStart:
; ILStart:
; ILEnd:
; OLEnd;

Start:
    mov EBX, 0 ; Counter
    mov EAX, 0 ; Let's use EAX for chars and ECX for utilchars (. ,)
    mov ECX, 0
    mov EDX, 0 ; DL, DH - First and Last char correspondingly

OLStart:
    inchar AL
    mov DL, AL
    mov DH, AL
ILStart:
    inchar CL
    cmp CL, '.'
    jE ILEnd

    cmp CL, ','
    jE ILEnd

    mov DH, CL

    jmp ILStart
ILEnd:
    cmp DH, DL
    jE INCR
    jNE OLEnd
INCR:
    inc EBX
    jmp OLEnd

OLEnd:
    cmp CL, '.'
    jNE OLStart

    jmp EX
EX:
    outwordln EBX
    pause
    exit


end Start