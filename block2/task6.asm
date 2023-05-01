include console.inc


.data
    T db 'Malakhov Nikita 112. Block 2. Task 6', 0
    N equ 30

    X dd N dup(0)

.code


Start:
    ConsoleTitle offset T

    inint EDI, 'Quantity = '

LStart:
    mov ECX, 0
LBody:
    inint X[ECX*4]
    inc ECX
    cmp ECX, EDI
    jNE LBody
LExit:
    mov ECX, 0
    mov

PrintS:
    outint X[ECX*4]
    outchar ' '
    inc ECX
    cmp ECX, EDI
    jNE PrintS
    

Ex:
    pause
    exit

end Start
