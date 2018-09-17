@echo off
@echo Create answers
for %%i in (*.tst) do solve <%%i >%%~ni.ans