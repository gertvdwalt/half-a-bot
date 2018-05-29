Set RegQry=HKLM\Hardware\Description\System\CentralProcessor\0
 
REG.exe Query %RegQry% > checkOS.txt
 
Find /i "x86" < CheckOS.txt > StringCheck.txt
 
If %ERRORLEVEL% == 0 (
    "32 bit\change.exe" %1 %temp%\wrtemp.dfu
    "32 bit\dfu-util.exe" -D %temp%\wrtemp.dfu
) ELSE (
    "64 bit\change.exe" %1 %temp%\wrtemp.dfu
    "64 bit\dfu-util.exe" -D %temp%\wrtemp.dfu
)