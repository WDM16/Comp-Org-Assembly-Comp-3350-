; The purpose of this code is to read in an array and then 
; put this value into a different array shifted by a certain amount
; determined by the shift dword
; Sean O'Connor
; Last modified: 9/7/2020
.386
.model flat,stdcall
.stack 4096
ExitProcess proto, dwExitCode:dword


.data
	shift dword 3 ;this is the shift value 
	input byte 5,0ah,3,6,0ch ;this is the input array
	output byte LENGTHOF input DUP(?) ;this is the new array that the values will be placed

.code 
	main proc 
			mov ECX, 0 ;Clear the ECX register
			mov CL, LENGTHOF input ;This loop will iterate - shift times 
			sub ECX, shift ;(This loop will place the 'non-wraped' values)
			mov ESI, 0 ;Start reading from input at 0 
			mov EDI, shift ;Start writing at shift 
		l1:
			mov EAX, 0 ;Clear the EAX register 
			mov al, input[esi] ;Move the value from input into al
			mov output[edi], al ;Move the value from al into output
			add ESI, 1 ;Increment the input index 
			add EDI, 1 ;Increment the output index 
		loop l1
			mov ECX, 0 ;Clear the ECX register
			mov ECX, shift ;This loop will iterate shift times 
			mov EDI, 0 ;Start writing at index 0
			mov ESI, LENGTHOF input ;Start reading at index length - shift
			sub ESI, shift ;(this loop will place the 'wrapped' values)
		l2:
			mov al, input[esi] ;Move the value from input into al
			mov output[edi], al ;Move the value from al into output
			add ESI, 1 ;Increment the input index
			add EDI, 1 ;Increment the output index 
		loop l2

		invoke ExitProcess, 0
	main endp
end main