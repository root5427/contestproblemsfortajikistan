rem @echo off
call _GenPic.bat 
echo create tests
cut 1276988   2 0 10   < 01.pic >01.tst
cut 126988    2 4 999  < 02.pic >02.tst
cut 3469882   2 1 999  < 03.pic >03.tst
cut 3469883   3 1 300  < 04.pic >04.tst
cut 3569884   3 0 0    < 05.pic >05.tst
cut 3769885   0 2 700  < 06.pic >06.tst
cut 126988    3 1 100  < 07.pic >07.tst
cut 312988    2 4 0    < 08.pic >08.tst
cut 386128    1 2 800  < 09.pic >09.tst
cut 348128    2 3 100  < 10.pic >10.tst
cut 346828    3 4 100  < 11.pic >11.tst
cut 146188    2 3 500  < 12.pic >12.tst
cut 316128    2 1 999  < 13.pic >13.tst
cut 341128    3 3 999  < 14.pic >14.tst
cut 100128    2 1 999  < 15.pic >15.tst
cut 200128    2 4 999  < 16.pic >16.tst
cut 310128    2 3 999  < 17.pic >17.tst
cut 301128    2 5 20   < 18.pic >18.tst
cut 300228    3 5 0    < 19.pic >19.tst
cut 300118    3 5 5    < 20.pic >20.tst
cut 300121    2 4 100  < 21.pic >21.tst
cut 500128    2 1 250  < 22.pic >22.tst
cut 350128    2 6 40   < 23.pic >23.tst
cut 305128    3 0 0    < 24.pic >24.tst
cut 300158    1 4 500  < 25.pic >25.tst
