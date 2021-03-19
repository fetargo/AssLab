.386
.model flat, stdcall, C
option casemap: none
include windows.inc
include user32.inc
include kernel32.inc
includelib user32.lib
includelib kernel32.lib
 
;include msvcrt.inc       
;includelib msvcrt.lib         
 
.data
    Array dw 1, -2, -15, 0, 30000, 30000, -30000, 5, 8, 10 
    n = $-Array                                          
 
	format1 db "Summ = %i ", 0
 
    nsumm dd 0
    psumm dd 0  
    msk dd 16                               
 
    buff db 16 dup (?)                      
    szCaption db 'summ', 0
    szTextNZero db '5th bit is 1', 0 
    szTextZero db '5th bit isnt 1', 0            
 
.code
start:

    mov ecx, 0 
    _next_iter:
        cmp ecx, n
        je chksumm
        xor eax, eax
        cmp Array[ecx], 0
        jl negative       
        jge positive      
 
    negative:               
        mov eax, nsumm               
        sbb ax, Array[ecx]                
        mov nsumm, eax                  
        jmp contin                 
 
    positive:           
        mov eax, psumm               
        adc ax, Array[ecx]          
        mov psumm, eax                      
        jmp contin                  
 
    contin:                           
        add ecx,2         
        jmp _next_iter
 
    chksumm: 
    	neg nsumm
    	mov eax, nsumm
    	and eax, msk
    	cmp eax, msk
    	je bit
    	jne zbit
   	bit:
   		invoke MessageBox,  NULL,  offset szTextNZero,  offset szCaption,  MB_OK
   		jmp _close
   	
   	zbit:
   		invoke MessageBox,  NULL,  offset szTextZero,  offset szCaption,  MB_OK
   		jmp _close
   		
   	_close:
        invoke wsprintfA, addr buff, addr format1, nsumm            
        invoke MessageBox, NULL,addr buff, offset szCaption, MB_OK
        invoke wsprintfA, addr buff, addr format1, psumm            
        invoke MessageBox, NULL,addr buff, offset szCaption, MB_OK 
        invoke ExitProcess, NULL
end start
