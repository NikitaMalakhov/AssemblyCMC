include console.inc


.data
    T db "112 Malakhov Nikita. Block1. Task6. 5 base"

    N dd ?

    LO db ? ; lowest digit
    HI db ? ; highest digit

    ENCD db '0' ; ENCODING SHIFT

.code

; CL - buffer for reading characters
; Using gorner schema
Start:
    ConsoleTitle offset T

    mov EAX, 0

    mov EBX, 5 ; base of 5-digit system

    mov ECX, 0 ; clear

    inchar CL, "Enter number in 5-base: "

B:
    sub CL, ENCD
    ; outwordln CL
    mul EBX
    add EAX, ECX
    inchar CL

    cmp CL, ' ' ; Case if this digit is last
    jNE B
EX:
    outwordln EAX
    pause
    exit

end Start