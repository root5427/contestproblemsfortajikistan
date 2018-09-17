@echo off

type tgens\1.txt >input%2.txt
type tgens\%1.tst >>input%2.txt
type tgens\2.txt >input%3.txt
type tgens\%1.tst >>input%3.txt