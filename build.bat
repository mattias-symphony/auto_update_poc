@echo off
mc -U sample.mc
rc /nologo -r sample.rc
link -dll -noentry -out:sample.dll sample.res /nologo /machine:x86
cl Svc.cpp /nologo
cl SvcConfig.cpp /nologo
cl SvcControl.cpp /nologo
reg add HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\SvcName /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\SvcName /v EventMessageFile /t REG_SZ /d %cd%\sample.dll /f
reg add HKLM\SYSTEM\CurrentControlSet\Services\EventLog\Application\SvcName /v TypesSupported  /t REG_DWORD /d 000000007 /f
