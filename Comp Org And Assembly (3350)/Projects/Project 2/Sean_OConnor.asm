.386
.model flat, stdcall
.stack 4096
ExitProcess proto, dwExitCode: dword

.data
	input byte 1,2,3,4,5,6,7,8
	shift byte 2
.code
	main proc
		; clearing registers
		mov EAX, 0
		mov EBX, 0
		mov ECX, 0
		mov EDX, 0

		; Setup of EAX register
		mov ah, [input]
		add ah, shift
		mov al, [input + 1]
		add al, shift

		; Setup of EBX register
		mov bh, [input + 2]
		add bh, shift
		mov bl, [input + 3]
		add bl, shift
		
		; Setup of ECX register 
		mov ch, [input + 4]
		add ch, shift
		mov cl, [input + 5]
		add cl, shift

		; Setup EDX register 
		mov dh, [input + 6]
		add dh, shift
		mov dl, [input + 7]
		add dl, shift

		; exitting program 
		invoke ExitProcess, 0
	main endp
end main