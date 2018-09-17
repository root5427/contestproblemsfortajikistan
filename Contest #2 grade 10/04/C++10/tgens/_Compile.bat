@echo off
@echo Compile
@for %%i in (*.pas) do call pp %%i >nul
del *.ow >nul

