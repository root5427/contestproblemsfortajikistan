@echo off
@echo ------------- %1 ------------------------
@tst2pic <%1 >show.pic
@call Labyrinth.exe show.pic
@del show.pic >nul