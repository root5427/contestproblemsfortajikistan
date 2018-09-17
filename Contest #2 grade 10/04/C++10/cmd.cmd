@echo off

rem:>datas.txt

for /l %%i in (1, 1, 4) do (
	
	echo Input #%%i>>datas.txt
	echo.>>datas.txt
	type Input0%%i.txt>>datas.txt
	echo.>>datas.txt
	
	echo Answer #%%i>>datas.txt
	echo.>>datas.txt
	type Answer0%%i.txt>>datas.txt
	echo.>>datas.txt
)

for /l %%i in (51, 1, 58) do (
	
	echo Input #%%i>>datas.txt
	echo.>>datas.txt
	type Input%%i.txt>>datas.txt
	echo.>>datas.txt
	
	echo Answer #%%i>>datas.txt
	echo.>>datas.txt
	type Answer%%i.txt>>datas.txt
	echo.>>datas.txt
)

echo on