@echo off 
set process=nw.exe

tasklist>%tmp%\tmp.txt 
find /i "%process%" "%tmp%\tmp.txt">%tmp%\pid.tmp

if errorlevel==1 (
	color C 
	
	echo The "%process%" was not found in the system
	timeout /t 3
)

for /f "tokens=2 skip=2" %%p in (%tmp%\pid.tmp) do ( 
	color a 
	cls 
	tskill %%p
	echo NW.Exe process terminated successfully
	timeout /t 3
	exit
)