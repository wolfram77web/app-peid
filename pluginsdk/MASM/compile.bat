\masm32\bin\ml /c /coff /Cp masm_plugin.asm
\masm32\bin\link /dll /DEF:masm_plugin.def /subsystem:windows /libpath:\masm32\lib masm_plugin.obj

pause