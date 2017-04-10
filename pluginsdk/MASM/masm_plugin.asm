;******************************************************************************
;* PEiD Plugin Example by diablo2oo2                                          *
;******************************************************************************
.586p
.mmx			
.model flat, stdcall
option casemap :none


;******************************************************************************
;* INCLUDES                                                                   *
;******************************************************************************
include				\masm32\include\windows.inc
include				\masm32\macros\macros.asm

include				\masm32\include\user32.inc
include				\masm32\include\kernel32.inc
include				\masm32\include\shell32.inc
include				\masm32\include\advapi32.inc
include				\masm32\include\gdi32.inc
include				\masm32\include\comctl32.inc
include				\masm32\include\comdlg32.inc
include				\masm32\include\masm32.inc

includelib			\masm32\lib\user32.lib
includelib			\masm32\lib\kernel32.lib
includelib			\masm32\lib\shell32.lib
includelib			\masm32\lib\advapi32.lib
includelib			\masm32\lib\gdi32.lib
includelib			\masm32\lib\comctl32.lib
includelib			\masm32\lib\comdlg32.lib
includelib			\masm32\lib\masm32.lib


;******************************************************************************
;* DATA & CONSTANTS                                                           *
;******************************************************************************
.const

.data

.data?
hInstance			dd ?


;******************************************************************************
;* CODE                                                                       *
;******************************************************************************
.code
align 16
DllEntry proc _hInstance:HINSTANCE, _reason:DWORD, _reserved1:DWORD
	m2m hInstance,_hInstance
	mov eax,TRUE
	ret
DllEntry endp

align 16
LoadDll proc
	;---Name of the plugin---
	mov eax,chr$("MASM Plugin Example")
	ret
LoadDll endp

align 16
DoMyJob proc _hwnd:dword,_filename:dword,_lpreserved:dword,_lpparam:dword	
	
	invoke MessageBox,_hwnd,_filename,chr$("MASM Plugin Example"),MB_OK
	
	;---job done!---
	pop ebp		;stack fix
	mov eax,1
	retn		;stack fix
DoMyJob endp
	
end DllEntry