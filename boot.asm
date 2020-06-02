org 0x7C00                      ; BIOS loads our programm at this address
bits 16                         ; We're working at 16-bit mode here

start:
	cli                     ; Disable the interrupts
	mov ah, 0x00		; Video mode
	; In QEMU, this doesn't change anything, but according to technical
        ; docs, default is 40x25 (mode 0). Try to change 2 for 0, you'll see
	; how it looks.
	mov al, 2		; 80x25, BW
	int 0x10
	mov si, msg             ; SI now points to our message
	mov ah, 0x0E            ; Indicate BIOS we're going to print chars
.loop	lodsb                   ; Loads SI into AL and increments SI [next char]
	or al, al               ; Checks if the end of the string
	jz .next                ; Jump to halt if the end
	int 0x10                ; Otherwise, call interrupt for printing the char
	jmp .loop               ; Next iteration of the loop
.next:
	; read kbd
	mov ah, 0
	int 0x16
	; spit read char
	mov ah, 0x0e
	int 0x10
	hlt

msg:	db "Hello, World!", 0   ; Our actual message to print

;; Magic numbers
times 510 - ($ - $$) db 0
dw 0xAA55
