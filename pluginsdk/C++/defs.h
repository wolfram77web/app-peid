//#include <windows.h>
#ifdef _DLLMACRO
	#define	 DllExport	__declspec(dllexport)
#else
	#define	 DllExport	__declspec(dllimport)
#endif

DllExport DWORD DoMyJob(HWND hMainDlg, char *szFname, DWORD lpReserved, LPVOID lpParam);
DllExport LPSTR LoadDll();
