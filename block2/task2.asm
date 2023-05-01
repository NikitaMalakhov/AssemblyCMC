include console.inc


.data
    T db "112 Malakhov Nikita. Block2. Task2"

    z2 db 'neud',0
    z3 db 'udovl',0
    z4 db 'horosho',0
    z5 db 'otlichno',0

    adr dd z2,z3,z4,z5
.code
Start:
    ConsoleTitle offset T

    mov EAX, 0

    inint EAX

    outstrln adr[EAX*4 - 8]

    pause
    exit
end Start