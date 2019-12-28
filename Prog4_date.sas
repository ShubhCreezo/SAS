/* In this module we are gonna learn Date formats */
DATA date;
input user$ date;
* INFORMAT allows us to read date in the form of number of days from 01/01/1960;
informat date ddmmyy10.;
datalines;
Karma 24/02/2004
Gump  16-05-1960
Dan   05.12.1950
Jenny 01/01/1960
;

DATA date1;
input user$ date: ddmmyy10.;
datalines;
Karma 24/02/2004
Gump  16-05-1960
Dan   05.12.1950
Jenny 01/01/1960
;
/*
	20/12/2020	ddmmyy10.
	20.12.2020	ddmmyyp10.
	20122020	ddmmyyb10.
	20-12-2020	ddmmyyd10.
	20:12:2020	ddmmyyc10.
*/

PROC PRINT data=date1;
* FORMAT allows us to print number of days to date in the desired format;
format date mmddyyp8.;
run;
