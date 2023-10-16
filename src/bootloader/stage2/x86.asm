bits 16

section _TEXT class=CODE

global _x86_Video_WriteCharTeletype
_x86_Video_WriteCharTeletype:

    ; make new call frame
    push bp             ; save old call frame
    mov bp, sp          ; init new call frame

    ; save bx
    push bx

    ; [bp + 0] - return address (small mem model => 2 bytes)
    ; [bp + 2] - first arg (char)
    ; [bp + 4] - second arg (page)
    ; note: bytes are connected to words (you can't push a single byte to stack)
    mov ah, 0Eh
    mov al, [bp + 2]
    mov bh, [bp + 4]

    int 10h

    ; restore bx
    pop bx

    ; restore old call frame
    mov sp, bp
    pop bp
    ret