rem @echo off
echo Test generating. 
cd TGens
call __GenAll.bat
cd ..

call tgens\_copyto.bat 01 59 60
call tgens\_copyto.bat 02 61 62


call tgens\_copyto.bat 03 05 06
call tgens\_copyto.bat 04 07 08
call tgens\_copyto.bat 05 09 10
call tgens\_copyto.bat 06 11 12
call tgens\_copyto.bat 07 13 14
call tgens\_copyto.bat 08 15 16
call tgens\_copyto.bat 09 17 18
call tgens\_copyto.bat 10 19 20
call tgens\_copyto.bat 11 21 22
call tgens\_copyto.bat 12 23 24
call tgens\_copyto.bat 13 25 26
call tgens\_copyto.bat 14 27 28
call tgens\_copyto.bat 15 29 30
call tgens\_copyto.bat 16 31 32
call tgens\_copyto.bat 17 33 34
call tgens\_copyto.bat 18 35 36
call tgens\_copyto.bat 19 37 38
call tgens\_copyto.bat 20 39 40
call tgens\_copyto.bat 21 41 42
call tgens\_copyto.bat 22 43 44
call tgens\_copyto.bat 23 45 46
call tgens\_copyto.bat 24 47 48
call tgens\_copyto.bat 25 49 50

ren problem.set problem.xml