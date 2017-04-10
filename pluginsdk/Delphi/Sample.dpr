//sample provided by _pusher_
library Sample;

uses
  Windows;

type DLL_RET_MSG = record
szMsgText: PChar;
szMsgHead: PChar;
dRetVal: DWORD;
dRetExVal: DWORD;
dFlags: DWORD;
end;

function LoadDll:PChar;cdecl;
begin
result:='Name for Plugin';
end;

function DoMyJob(hMainDlg: HWND; szFname: PChar; lpReserved: DWORD; DRM: DLL_RET_MSG):DWORD; cdecl;
begin
Messagebox(hMainDlg,Pchar('hello world'+#13+#10+'FileName: '+szFname),'',MB_OK);
result:=1; //this is like showing peid all went well.
end;

exports
    DoMyJob,
    LoadDll;

end.
