@ECHO off
ECHO  If you are running this file in Windows Vista, please do the following:
ECHO    - Go to "Start -> All Programs -> Accessories".
ECHO    - Select "Command Prompt", and right mouse click. Choose 
ECHO      "Run as administrator" from the menu.
ECHO    - From the Command Prompt window, change the current directory to the 
ECHO      PSIM directory. For example, if PSIM is located in 
ECHO      "C:\program files\powersim\psim7.1.1", type
ECHO             cd c:\program files\powersim\psim7.1.1
ECHO    - Run the batch file by typing "reg.bat". 

regsvr32 PsimX2.ocx

