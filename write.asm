; input EXC = adress of string : EDX = nbr of char to print : EBX = file discriptor
write:
    mov eax, 4
    int 80h
    ret