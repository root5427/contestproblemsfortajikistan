@echo off

for /l %%i in (10, 1, 12) do (
	echo Checker #%%i>>datas.txt
	type Input%%i.txt>>datas.txt
	echo.>>datas.txt
	type Answer%%i.txt>>datas.txt
	echo.>>datas.txt
	echo.>>datas.txt
)

echo on