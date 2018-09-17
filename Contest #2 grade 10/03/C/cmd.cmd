@echo off

rem:>datas.txt
for /l %%i in (1, 1, 9) do (
	echo Checker #%%i>>datas.txt
	
	echo Input>>datas.txt
	echo.>>datas.txt
	type Input0%%i.txt>>datas.txt
	echo.>>datas.txt
	
	echo Output>>datas.txt
	echo.>>datas.txt
	type Answer0%%i.txt>>datas.txt
	echo.>>datas.txt
	echo.>>datas.txt
)

for /l %%i in (10, 1, 18) do (
	echo Checker #%%i>>datas.txt
	
	echo Input>>datas.txt
	echo.>>datas.txt
	type Input%%i.txt>>datas.txt
	echo.>>datas.txt
	
	echo Output>>datas.txt
	echo.>>datas.txt
	type Answer%%i.txt>>datas.txt
	echo.>>datas.txt
	echo.>>datas.txt
)

echo on