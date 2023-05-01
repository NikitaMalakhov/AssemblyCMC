include console.inc

.data
    T db "112 Malakhov Nikita. Block2. Task3",0


.code
Start:
    ConsoleTitle offset T

    inint EAX

    mov EAX, 0FFFFFFFFh
    cmp EAX, EAX
    jS Print
    exit
Print:
    outstrln offset T
    pause
    exit

end Start