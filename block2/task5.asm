include console.inc

.data
    T db "Malakhov Nikita 112. Block 2. Task 5"
    S db 9 dup('0'), 0
    DigOff db ('A' - 10)
.code

Start:
    ConsoleTitle offset T

    inint EAX

    mov ECX, 8

LBody:
    mov EBX, 16
    mov EDX, 0
    div EBX ; (EAX, EDX)
    cmp EDX, 9 ; we must to check if the remainder is bigger than the max representation of decimal (a-f)
    jA AFDigits

ANINEDig:
    add DL, '0'
    jmp C
AFDigits:
    add DL, DigOff
    jmp C
C:
    mov S[ECX], DL
    dec ECX
    cmp EAX, 0; there are no more remaining digits
    jNE LBody
    jmp Ex

Ex:
    outstrln offset S
    pause
    exit
end Start