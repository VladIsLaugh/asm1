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
		jmp exit
	NoCD:
		invoke GetUserName,addr first_message,addr buflen
	    invoke GetWindowsDirectory,addr second_message,255
	exit:
		invoke wsprintf,addr res1,addr sform, addr first_message, addr second_message
		invoke lstrlen, addr res1
		mov len, eax
		invoke MessageBox,NULL,addr res1,addr hello_title,MB_OK
	ret
	
	

main endp

end Begin
