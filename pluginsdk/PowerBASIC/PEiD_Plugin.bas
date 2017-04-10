' =================================================
'
' PEiD's Plugin skeleton for PowerBASIC
' (C) 2004 by Marco Pontello - http://mark0.net
'
' This code is to be considered "public domain".
' Feel free to do what you want with it.
'
' -------------------------------------------------
'
' PEiD is a file identifier especially tailored for
' PE (Portable executable) files. It detects most
' common packers, cryptors and compilers. It also 
' sports a range of useful tools and plugins.
' 
' PEiD's home: http://peid.has.it/
' 
' =================================================

#COMPILE DLL
#DIM ALL

$PROGRAMVER = "1.0"
$PROGRAMTITLE = "MyPlugin"

#INCLUDE "WIN32API.INC"

' --- Global declarations

GLOBAL ghDLLInstance AS LONG                                   
GLOBAL ghPEiDDialog AS LONG                                   

' --- Exported functions

DECLARE FUNCTION DoMyJob CDECL ALIAS "DoMyJob" (BYVAL hMainDlg AS DWORD, _
                         BYREF szfName AS ASCIIZ, BYVAL lpReserved AS DWORD, _
                         BYVAL lpVoid AS DWORD) AS DWORD
DECLARE FUNCTION LoadDll CDECL ALIAS "LoadDll" () AS DWORD

' --- Return Plugin Name to PEiD
'     PEiD call this at startup to build a list with the name of all
'     available Plugins

FUNCTION LoadDll CDECL ALIAS "LoadDll" () EXPORT AS DWORD

  STATIC szPluginName AS ASCIIZ * 256
  szPluginName = $PROGRAMTITLE
  FUNCTION = VARPTR(szPluginName)

END FUNCTION

' --- Main Plugin routine
'     This is called by PEiD when the Plugin is selected/run

FUNCTION DoMyJob CDECL ALIAS "DoMyJob" (BYVAL hMainDlg AS DWORD, _
                 BYREF szfName AS ASCIIZ, BYVAL lpReserved AS DWORD, _
                 BYVAL lpVoid AS DWORD) EXPORT AS DWORD
  
  ghPEiDDialog = hMainDlg
  MsgBox "PEiD's file: " & szfName, %MB_SYSTEMMODAL, $PROGRAMTITLE
  FUNCTION = 1 
  EXIT FUNCTION

END FUNCTION
                                                       
' --- Main DLL entry

FUNCTION LibMain (BYVAL hInstance AS LONG, BYVAL fwdReason AS LONG, _
                  BYVAL lpvReserved AS LONG) AS LONG

  SELECT CASE fwdReason
  CASE %DLL_PROCESS_ATTACH
     ghDLLInstance = hInstance
     FUNCTION = 1
  CASE %DLL_PROCESS_DETACH
     FUNCTION = 1
  CASE %DLL_THREAD_ATTACH
     FUNCTION = 1
  CASE %DLL_THREAD_DETACH
     FUNCTION = 1
  END SELECT     
  EXIT FUNCTION

END FUNCTION
