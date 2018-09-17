@echo off

rem:>dates.txt

for /l %%i in (1, 1, 6) do (
	
	echo Checker#%%i>>dates.txt
	echo.>>dates.txt
	echo Input>>dates.txt
	echo.>>dates.txt
	type Input0%%i.txt>>dates.txt
	echo.>>dates.txt

	echo Output>>dates.txt
	echo.>>dates.txt
	type Answer0%%i.txt>>dates.txt
	echo.>>dates.txt
)

echo on