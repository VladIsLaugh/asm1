include WINDOWS.inc

include user32.inc
include kernel32.inc
includelib user32.lib
includelib kernel32.lib
include Advapi32.inc
includelib Advapi32.lib

.data
hello_title 	db 		'Лабораторна робота №1',0	
drive			db		256 dup (0)
buflen       	dd	 	256;	
first_message 	db 	 	256 dup(0)
second_message 	db 		256 dup(0)

len				db		25
res1			db 		500 dup(0)
res2			db		1000 dup(0)
sform			db		'Computer name: %s', 13, 10
				db 		'Current directory: %s', 0

