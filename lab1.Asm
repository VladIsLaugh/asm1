.386
.model flat,STDCALL
option casemap :none  ;case sensitive

include lab1.inc

.code
Begin:
	call main
	
invoke ExitProcess,NULL


main proc

	invoke GetDriveType, addr drive
   	;mov drive, DRIVE_CDROM
	cmp drive, DRIVE_CDROM	
	
	jz CD	; ==
	jnz NoCD ;!=
	CD:
		
		invoke GetComputerName,addr first_message,addr buflen
		invoke GetCurrentDirectory,255,addr second_message
		invoke wsprintf,addr res1,addr sform1, addr first_message, addr second_message
		jmp exit
	NoCD:
		invoke GetUserName,addr first_message,addr buflen
	    invoke GetWindowsDirectory,addr second_message,255
	    invoke wsprintf,addr res1,addr sform2, addr first_message, addr second_message
	exit:
		invoke lstrlen, addr res1
		lea esi, res1
		lea edi, res2
		mov ecx,eax
		l1:
			mov al, [esi]
			mov ah, [edi]
			mov [edi], al
			inc edi
			mov [edi], al
			inc esi
			inc edi
		loop l1
		invoke MessageBox,NULL,addr res1,addr hello_title,MB_OK
		invoke MessageBox,NULL,addr res2,addr hello_title,MB_OK
	ret
	
	

main endp

end Begin
